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
CMAKE_SOURCE_DIR = /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64

# Include any dependencies generated for this target.
include src/arkode/CMakeFiles/sundials_arkode_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/arkode/CMakeFiles/sundials_arkode_static.dir/compiler_depend.make

# Include the progress variables for this target.
include src/arkode/CMakeFiles/sundials_arkode_static.dir/progress.make

# Include the compile flags for this target's objects.
include src/arkode/CMakeFiles/sundials_arkode_static.dir/flags.make

# Object files for target sundials_arkode_static
sundials_arkode_static_OBJECTS =

# External object files for target sundials_arkode_static
sundials_arkode_static_EXTERNAL_OBJECTS = \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_adapt.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep_nls.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_bandpre.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_bbdpre.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher_dirk.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher_erk.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_erkstep_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_erkstep.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_interp.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_ls.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mri_tables.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep_nls.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_root.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_band.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_context.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_dense.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_direct.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_iterative.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_linearsolver.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_logger.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_math.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_matrix.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_memory.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nonlinearsolver.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector_senswrapper.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_version.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunmemory/system/CMakeFiles/sundials_sunmemsys_obj_static.dir/sundials_system_memory.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/nvector/serial/CMakeFiles/sundials_nvecserial_obj_static.dir/nvector_serial.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunmatrix/band/CMakeFiles/sundials_sunmatrixband_obj_static.dir/sunmatrix_band.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunmatrix/dense/CMakeFiles/sundials_sunmatrixdense_obj_static.dir/sunmatrix_dense.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunmatrix/sparse/CMakeFiles/sundials_sunmatrixsparse_obj_static.dir/sunmatrix_sparse.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/band/CMakeFiles/sundials_sunlinsolband_obj_static.dir/sunlinsol_band.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/dense/CMakeFiles/sundials_sunlinsoldense_obj_static.dir/sunlinsol_dense.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/spbcgs/CMakeFiles/sundials_sunlinsolspbcgs_obj_static.dir/sunlinsol_spbcgs.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/spfgmr/CMakeFiles/sundials_sunlinsolspfgmr_obj_static.dir/sunlinsol_spfgmr.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/spgmr/CMakeFiles/sundials_sunlinsolspgmr_obj_static.dir/sunlinsol_spgmr.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/sptfqmr/CMakeFiles/sundials_sunlinsolsptfqmr_obj_static.dir/sunlinsol_sptfqmr.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunlinsol/pcg/CMakeFiles/sundials_sunlinsolpcg_obj_static.dir/sunlinsol_pcg.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunnonlinsol/newton/CMakeFiles/sundials_sunnonlinsolnewton_obj_static.dir/sunnonlinsol_newton.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sunnonlinsol/fixedpoint/CMakeFiles/sundials_sunnonlinsolfixedpoint_obj_static.dir/sunnonlinsol_fixedpoint.c.o"

src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_adapt.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep_io.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep_nls.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_arkstep.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_bandpre.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_bbdpre.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher_dirk.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher_erk.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_butcher.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_erkstep_io.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_erkstep.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_interp.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_io.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_ls.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mri_tables.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep_io.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep_nls.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_mristep.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode_root.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_obj_static.dir/arkode.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_band.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_context.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_dense.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_direct.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_iterative.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_linearsolver.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_logger.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_math.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_matrix.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_memory.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nonlinearsolver.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector_senswrapper.c.o
src/arkode/libsundials_arkode.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_version.c.o
src/arkode/libsundials_arkode.a: src/sunmemory/system/CMakeFiles/sundials_sunmemsys_obj_static.dir/sundials_system_memory.c.o
src/arkode/libsundials_arkode.a: src/nvector/serial/CMakeFiles/sundials_nvecserial_obj_static.dir/nvector_serial.c.o
src/arkode/libsundials_arkode.a: src/sunmatrix/band/CMakeFiles/sundials_sunmatrixband_obj_static.dir/sunmatrix_band.c.o
src/arkode/libsundials_arkode.a: src/sunmatrix/dense/CMakeFiles/sundials_sunmatrixdense_obj_static.dir/sunmatrix_dense.c.o
src/arkode/libsundials_arkode.a: src/sunmatrix/sparse/CMakeFiles/sundials_sunmatrixsparse_obj_static.dir/sunmatrix_sparse.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/band/CMakeFiles/sundials_sunlinsolband_obj_static.dir/sunlinsol_band.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/dense/CMakeFiles/sundials_sunlinsoldense_obj_static.dir/sunlinsol_dense.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/spbcgs/CMakeFiles/sundials_sunlinsolspbcgs_obj_static.dir/sunlinsol_spbcgs.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/spfgmr/CMakeFiles/sundials_sunlinsolspfgmr_obj_static.dir/sunlinsol_spfgmr.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/spgmr/CMakeFiles/sundials_sunlinsolspgmr_obj_static.dir/sunlinsol_spgmr.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/sptfqmr/CMakeFiles/sundials_sunlinsolsptfqmr_obj_static.dir/sunlinsol_sptfqmr.c.o
src/arkode/libsundials_arkode.a: src/sunlinsol/pcg/CMakeFiles/sundials_sunlinsolpcg_obj_static.dir/sunlinsol_pcg.c.o
src/arkode/libsundials_arkode.a: src/sunnonlinsol/newton/CMakeFiles/sundials_sunnonlinsolnewton_obj_static.dir/sunnonlinsol_newton.c.o
src/arkode/libsundials_arkode.a: src/sunnonlinsol/fixedpoint/CMakeFiles/sundials_sunnonlinsolfixedpoint_obj_static.dir/sunnonlinsol_fixedpoint.c.o
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_static.dir/build.make
src/arkode/libsundials_arkode.a: src/arkode/CMakeFiles/sundials_arkode_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C static library libsundials_arkode.a"
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode && $(CMAKE_COMMAND) -P CMakeFiles/sundials_arkode_static.dir/cmake_clean_target.cmake
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sundials_arkode_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/arkode/CMakeFiles/sundials_arkode_static.dir/build: src/arkode/libsundials_arkode.a
.PHONY : src/arkode/CMakeFiles/sundials_arkode_static.dir/build

src/arkode/CMakeFiles/sundials_arkode_static.dir/clean:
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode && $(CMAKE_COMMAND) -P CMakeFiles/sundials_arkode_static.dir/cmake_clean.cmake
.PHONY : src/arkode/CMakeFiles/sundials_arkode_static.dir/clean

src/arkode/CMakeFiles/sundials_arkode_static.dir/depend:
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1 /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/src/arkode /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64 /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/arkode/CMakeFiles/sundials_arkode_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/arkode/CMakeFiles/sundials_arkode_static.dir/depend

