/**
 * \author Mathieu Erbas
 */

#ifndef _GNU_SOURCE
    #define _GNU_SOURCE
#endif

#include "config.h"
#include "connmgr.h"
#include "datamgr.h"
#include "sbuffer.h"
#include "sensor_db.h"

#include <assert.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <wait.h>
#include <math.h>

static int print_usage() {
    printf("Usage: <command> <port number> \n");
    return -1;
}

static void* datamgr_run(void* buffer) {
    datamgr_init();

    // datamgr loop
    while (true) {
        sensor_data_t data = sbuffer_remove_last(buffer);
        if(data.value != -INFINITY){
            datamgr_process_reading(&data);
        }
        else if (sbuffer_is_closed(buffer)) {
            // buffer is both empty & closed: there will never be data again
            break;
        }
    }
    datamgr_free();
    return NULL;
}

static void* storagemgr_run(void* buffer) {
    DBCONN* db = storagemgr_init_connection(1);
    assert(db != NULL);

    // storagemgr loop
    while (true) {
        sensor_data_t data = sbuffer_remove_last(buffer);
        if(data.value != -INFINITY){
            storagemgr_insert_sensor(db, data.id, data.value, data.ts);
        }
        else if (sbuffer_is_closed(buffer)) {
            // buffer is both empty & closed: there will never be data again
            break;
        }
    }
    storagemgr_disconnect(db);
    return NULL;
}

int main(int argc, char* argv[]) {
    if (argc != 2)
        return print_usage();
    char* strport = argv[1];
    char* error_char = NULL;
    int port_number = strtol(strport, &error_char, 10);
    if (strport[0] == '\0' || error_char[0] != '\0')
        return print_usage();

    sbuffer_t* buffer = sbuffer_create();

    pthread_t datamgr_thread;
    ASSERT_ELSE_PERROR(pthread_create(&datamgr_thread, NULL, datamgr_run, buffer) == 0);

    pthread_t storagemgr_thread;
    ASSERT_ELSE_PERROR(pthread_create(&storagemgr_thread, NULL, storagemgr_run, buffer) == 0);

    mgrs(buffer, datamgr_thread, storagemgr_thread);

    // main server loop
    connmgr_listen(port_number, buffer);

    sbuffer_close(buffer);

    pthread_join(datamgr_thread, NULL);
    pthread_join(storagemgr_thread, NULL);

    sbuffer_destroy(buffer);

    wait(NULL);

    return 0;
}
