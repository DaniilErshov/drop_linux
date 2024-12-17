# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build

# Include any dependencies generated for this target.
include examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/progress.make

# Include the compile flags for this target's objects.
include examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/flags.make

examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o: examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/flags.make
examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o: /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c
examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o: examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o"
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o -MF CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o.d -o CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o -c /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c

examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.i"
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c > CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.i

examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.s"
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c -o CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.s

# Object files for target idasKrylovDemo_ls
idasKrylovDemo_ls_OBJECTS = \
"CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o"

# External object files for target idasKrylovDemo_ls
idasKrylovDemo_ls_EXTERNAL_OBJECTS =

examples/idas/serial/idasKrylovDemo_ls: examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/idasKrylovDemo_ls.c.o
examples/idas/serial/idasKrylovDemo_ls: examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/build.make
examples/idas/serial/idasKrylovDemo_ls: src/idas/libsundials_idas.so.5.5.1
examples/idas/serial/idasKrylovDemo_ls: src/nvector/serial/libsundials_nvecserial.so.6.5.1
examples/idas/serial/idasKrylovDemo_ls: examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable idasKrylovDemo_ls"
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/idasKrylovDemo_ls.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/build: examples/idas/serial/idasKrylovDemo_ls
.PHONY : examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/build

examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/clean:
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial && $(CMAKE_COMMAND) -P CMakeFiles/idasKrylovDemo_ls.dir/cmake_clean.cmake
.PHONY : examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/clean

examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/depend:
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1 /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/idas/serial/CMakeFiles/idasKrylovDemo_ls.dir/depend
