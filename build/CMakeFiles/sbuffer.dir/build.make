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
include CMakeFiles/sbuffer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sbuffer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sbuffer.dir/flags.make

CMakeFiles/sbuffer.dir/sbuffer.c.o: CMakeFiles/sbuffer.dir/flags.make
CMakeFiles/sbuffer.dir/sbuffer.c.o: ../sbuffer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sbuffer.dir/sbuffer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sbuffer.dir/sbuffer.c.o   -c "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/sbuffer.c"

CMakeFiles/sbuffer.dir/sbuffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sbuffer.dir/sbuffer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/sbuffer.c" > CMakeFiles/sbuffer.dir/sbuffer.c.i

CMakeFiles/sbuffer.dir/sbuffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sbuffer.dir/sbuffer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/sbuffer.c" -o CMakeFiles/sbuffer.dir/sbuffer.c.s

# Object files for target sbuffer
sbuffer_OBJECTS = \
"CMakeFiles/sbuffer.dir/sbuffer.c.o"

# External object files for target sbuffer
sbuffer_EXTERNAL_OBJECTS =

libsbuffer.so: CMakeFiles/sbuffer.dir/sbuffer.c.o
libsbuffer.so: CMakeFiles/sbuffer.dir/build.make
libsbuffer.so: CMakeFiles/sbuffer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libsbuffer.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sbuffer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sbuffer.dir/build: libsbuffer.so

.PHONY : CMakeFiles/sbuffer.dir/build

CMakeFiles/sbuffer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sbuffer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sbuffer.dir/clean

CMakeFiles/sbuffer.dir/depend:
	cd "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build" "/mnt/d/Documents/school/industriele-inginieurwetenschappen/fase 3/semister 1/Besturingssystemen 2/labo 5/OS2_labo5/build/CMakeFiles/sbuffer.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/sbuffer.dir/depend

