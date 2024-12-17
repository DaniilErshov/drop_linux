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

# Utility rule file for test_install_all_arkode_C_manyvector.

# Include any custom commands dependencies for this target.
include examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/progress.make

examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running arkode installation tests"
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/Testing_Install_All/arkode/C_manyvector && /usr/bin/cmake /usr/local/examples/arkode/C_manyvector > cmake.out
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/Testing_Install_All/arkode/C_manyvector && /usr/bin/cmake --build /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/Testing_Install_All/arkode/C_manyvector > make.out

test_install_all_arkode_C_manyvector: examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector
test_install_all_arkode_C_manyvector: examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/build.make
.PHONY : test_install_all_arkode_C_manyvector

# Rule to build all files generated by this target.
examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/build: test_install_all_arkode_C_manyvector
.PHONY : examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/build

examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/clean:
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/arkode/C_manyvector && $(CMAKE_COMMAND) -P CMakeFiles/test_install_all_arkode_C_manyvector.dir/cmake_clean.cmake
.PHONY : examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/clean

examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/depend:
	cd /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1 /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/arkode/C_manyvector /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/arkode/C_manyvector /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/arkode/C_manyvector/CMakeFiles/test_install_all_arkode_C_manyvector.dir/depend
