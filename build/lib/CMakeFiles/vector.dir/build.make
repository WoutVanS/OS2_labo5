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
include lib/CMakeFiles/vector.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/vector.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/vector.dir/flags.make

lib/CMakeFiles/vector.dir/vector.c.o: lib/CMakeFiles/vector.dir/flags.make
lib/CMakeFiles/vector.dir/vector.c.o: ../lib/vector.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/CMakeFiles/vector.dir/vector.c.o"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vector.dir/vector.c.o   -c "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/vector.c"

lib/CMakeFiles/vector.dir/vector.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vector.dir/vector.c.i"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/vector.c" > CMakeFiles/vector.dir/vector.c.i

lib/CMakeFiles/vector.dir/vector.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vector.dir/vector.c.s"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib/vector.c" -o CMakeFiles/vector.dir/vector.c.s

# Object files for target vector
vector_OBJECTS = \
"CMakeFiles/vector.dir/vector.c.o"

# External object files for target vector
vector_EXTERNAL_OBJECTS =

lib/libvector.so: lib/CMakeFiles/vector.dir/vector.c.o
lib/libvector.so: lib/CMakeFiles/vector.dir/build.make
lib/libvector.so: lib/CMakeFiles/vector.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libvector.so"
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vector.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/vector.dir/build: lib/libvector.so

.PHONY : lib/CMakeFiles/vector.dir/build

lib/CMakeFiles/vector.dir/clean:
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" && $(CMAKE_COMMAND) -P CMakeFiles/vector.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/vector.dir/clean

lib/CMakeFiles/vector.dir/depend:
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/lib" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/lib/CMakeFiles/vector.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : lib/CMakeFiles/vector.dir/depend

