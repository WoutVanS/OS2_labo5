# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build"

# Include any dependencies generated for this target.
include lib/CMakeFiles/tcpsock.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/tcpsock.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/tcpsock.dir/flags.make

lib/CMakeFiles/tcpsock.dir/tcpsock.c.o: lib/CMakeFiles/tcpsock.dir/flags.make
lib/CMakeFiles/tcpsock.dir/tcpsock.c.o: ../lib/tcpsock.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/CMakeFiles/tcpsock.dir/tcpsock.c.o"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tcpsock.dir/tcpsock.c.o   -c "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/tcpsock.c"

lib/CMakeFiles/tcpsock.dir/tcpsock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tcpsock.dir/tcpsock.c.i"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/tcpsock.c" > CMakeFiles/tcpsock.dir/tcpsock.c.i

lib/CMakeFiles/tcpsock.dir/tcpsock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tcpsock.dir/tcpsock.c.s"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/tcpsock.c" -o CMakeFiles/tcpsock.dir/tcpsock.c.s

# Object files for target tcpsock
tcpsock_OBJECTS = \
"CMakeFiles/tcpsock.dir/tcpsock.c.o"

# External object files for target tcpsock
tcpsock_EXTERNAL_OBJECTS =

lib/libtcpsock.so: lib/CMakeFiles/tcpsock.dir/tcpsock.c.o
lib/libtcpsock.so: lib/CMakeFiles/tcpsock.dir/build.make
lib/libtcpsock.so: lib/CMakeFiles/tcpsock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libtcpsock.so"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tcpsock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/tcpsock.dir/build: lib/libtcpsock.so

.PHONY : lib/CMakeFiles/tcpsock.dir/build

lib/CMakeFiles/tcpsock.dir/clean:
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && $(CMAKE_COMMAND) -P CMakeFiles/tcpsock.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/tcpsock.dir/clean

lib/CMakeFiles/tcpsock.dir/depend:
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib/CMakeFiles/tcpsock.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : lib/CMakeFiles/tcpsock.dir/depend
