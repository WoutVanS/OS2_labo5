/**
 * \author Mathieu Erbas
 */

#ifndef _GNU_SOURCE
    #define _GNU_SOURCE
#endif

#include "sbuffer.h"

#include "config.h"
#include <math.h>
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>


typedef struct sbuffer_node {
    struct sbuffer_node* prev;
    sensor_data_t data;
    pthread_t readBy;
} sbuffer_node_t;

struct sbuffer {
    sbuffer_node_t* head;
    sbuffer_node_t* tail;
    bool closed;
    //pthread_mutex_t mutex;
    pthread_rwlock_t rwlock;
    pthread_cond_t dataMgrCond;
    pthread_cond_t strgMgrCond;
    pthread_mutex_t dataMgrMutex;
    pthread_mutex_t strgMgrMutex;
    unsigned long dataMgr;
    unsigned long strgMgr;
};

static sbuffer_node_t* create_node(const sensor_data_t* data) {
    sbuffer_node_t* node = malloc(sizeof(*node));
    *node = (sbuffer_node_t){
        .data = *data,
        .prev = NULL,
    };
    return node;
}

sbuffer_t* sbuffer_create() {
    sbuffer_t* buffer = malloc(sizeof(sbuffer_t));
    assert(buffer != NULL);

    buffer->head = NULL;
    buffer->tail = NULL;
    buffer->closed = false;
    ASSERT_ELSE_PERROR(pthread_rwlock_init(&buffer->rwlock, NULL) == 0);
    buffer->dataMgr = 0;
    buffer->strgMgr = 0;

    pthread_cond_init(&buffer->dataMgrCond, NULL);
    pthread_cond_init(&buffer->strgMgrCond, NULL);
    pthread_mutex_init(&buffer->dataMgrMutex, NULL);
    pthread_mutex_init(&buffer->strgMgrMutex, NULL);
    return buffer;
}

void sbuffer_destroy(sbuffer_t* buffer) {
    assert(buffer);
    // make sure it's empty
    assert(buffer->head == buffer->tail);
    ASSERT_ELSE_PERROR(pthread_rwlock_destroy(&buffer->rwlock) == 0);

    pthread_cond_destroy(&buffer->dataMgrCond);
    pthread_cond_destroy(&buffer->strgMgrCond);
    pthread_mutex_destroy(&buffer->dataMgrMutex);
    pthread_mutex_destroy(&buffer->strgMgrMutex);
    free(buffer);
}

bool sbuffer_is_empty(sbuffer_t* buffer) {
    assert(buffer);
    ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0); 
    bool res = buffer->head == NULL;
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
    return res;
}

bool sbuffer_is_closed(sbuffer_t* buffer) {
    assert(buffer);
    ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0);  //checken op writers  
    bool res = buffer->closed;
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0); 
    return res;
}

int sbuffer_insert_first(sbuffer_t* buffer, sensor_data_t const* data) {  
    assert(buffer && data);
    if (sbuffer_is_closed(buffer))
        return SBUFFER_FAILURE;

    // create new node
    sbuffer_node_t* node = create_node(data);
    assert(node->prev == NULL);

    ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0); 
    bool wasEmpty = buffer->head == NULL;
    // insert it
    if (buffer->head != NULL)
        buffer->head->prev = node;
    buffer->head = node;
    
    if (buffer->tail == NULL) {
        buffer->tail = node;
    }        
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);

    if(wasEmpty) {      //buffer leeg->threads slapen->wakker maken
        pthread_cond_signal(&buffer->dataMgrCond);
        pthread_cond_signal(&buffer->strgMgrCond);
    }

    return SBUFFER_SUCCESS;
}

sensor_data_t sbuffer_remove_last(sbuffer_t* buffer) {
    assert(buffer);
    ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0);
    if(buffer->head == NULL) {
        if(buffer->closed) {
            ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
            sensor_data_t data;
            data.value =  -INFINITY;
            return data;
        }
        while(buffer->head == NULL && !buffer->closed) {    //leeg->slapen tot iets in zit
            if(pthread_self() == buffer->dataMgr) {
                ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0); 
                ASSERT_ELSE_PERROR(pthread_mutex_lock(&buffer->dataMgrMutex) == 0);
                ASSERT_ELSE_PERROR(pthread_cond_wait(&(buffer->dataMgrCond), &(buffer->dataMgrMutex)) == 0);   
                ASSERT_ELSE_PERROR(pthread_mutex_unlock(&buffer->dataMgrMutex) == 0);
                ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0);   
            }  
            else if(pthread_self() == buffer->strgMgr) {
                ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);  
                ASSERT_ELSE_PERROR(pthread_mutex_lock(&buffer->strgMgrMutex) == 0);
                ASSERT_ELSE_PERROR(pthread_cond_wait(&(buffer->strgMgrCond), &(buffer->strgMgrMutex)) == 0);   
                ASSERT_ELSE_PERROR(pthread_mutex_unlock(&buffer->strgMgrMutex) == 0);

                ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0);   
            } 
            else {
                ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);  
                sensor_data_t data;
                data.value =  -INFINITY;
                return data;
            }
        }
    }
    
    assert(buffer->head != NULL);

    sbuffer_node_t* removed_node = buffer->tail;

    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);

    ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0);  
    if(!removed_node->readBy){
        removed_node->readBy = pthread_self();
        ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);   
        return removed_node->data;
    } 
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0); 
    if(removed_node->readBy != pthread_self()) {
        assert(removed_node != NULL);
        ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0);
        if (removed_node == buffer->head) {
            buffer->head = NULL;
            assert(removed_node == buffer->tail);
        }
        buffer->tail = removed_node->prev;
        ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);

        sensor_data_t ret = removed_node->data;
        free(removed_node);
        return ret;
    }
    sbuffer_node_t* prev_node = removed_node;
    removed_node = removed_node->prev;
    while(removed_node != NULL && removed_node->readBy == pthread_self()) {
        prev_node = removed_node;
        removed_node = removed_node->prev;
    }

    if(removed_node == NULL) {
        ASSERT_ELSE_PERROR(pthread_rwlock_rdlock(&buffer->rwlock) == 0);  
        if(buffer->closed) {
            ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);   
            sensor_data_t data;
            data.value =  -INFINITY;

            return data;
        }
        if(pthread_self() == buffer->dataMgr) {
            ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
            pthread_cond_signal(&buffer->strgMgrCond);
            pthread_mutex_lock(&buffer->dataMgrMutex);
            pthread_cond_wait(&(buffer->dataMgrCond), &(buffer->dataMgrMutex));   
            pthread_mutex_unlock(&buffer->dataMgrMutex);
        }  
        else if(pthread_self() == buffer->strgMgr) {
            ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
            pthread_mutex_lock(&buffer->strgMgrMutex);
            pthread_cond_wait(&(buffer->strgMgrCond), &(buffer->strgMgrMutex));   
            pthread_mutex_unlock(&buffer->strgMgrMutex);
        } 
        return sbuffer_remove_last(buffer);
    }

    ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0);   
    if(!removed_node->readBy){
        removed_node->readBy = pthread_self();
        ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0); 
        return removed_node->data;
    } 

    if (removed_node == buffer->head) {
        buffer->head = prev_node;
    }
    prev_node->prev = removed_node->prev;
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);

    sensor_data_t ret = removed_node->data;
    free(removed_node);
    return ret;

}

void sbuffer_close(sbuffer_t* buffer) {
    assert(buffer);
    ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0); 
    buffer->closed = true;  
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
}


void mgrs(sbuffer_t* buffer, unsigned long dataMgr, unsigned long strgMgr) {
    ASSERT_ELSE_PERROR(pthread_rwlock_wrlock(&buffer->rwlock) == 0);
    buffer->dataMgr = dataMgr;
    buffer->strgMgr = strgMgr;
    ASSERT_ELSE_PERROR(pthread_rwlock_unlock(&buffer->rwlock) == 0);
}
