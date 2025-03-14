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
include src/cvodes/CMakeFiles/sundials_cvodes_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/cvodes/CMakeFiles/sundials_cvodes_static.dir/compiler_depend.make

# Include the progress variables for this target.
include src/cvodes/CMakeFiles/sundials_cvodes_static.dir/progress.make

# Include the compile flags for this target's objects.
include src/cvodes/CMakeFiles/sundials_cvodes_static.dir/flags.make

# Object files for target sundials_cvodes_static
sundials_cvodes_static_OBJECTS =

# External object files for target sundials_cvodes_static
sundials_cvodes_static_EXTERNAL_OBJECTS = \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodea.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodea_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_bandpre.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_bbdpre.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_diag.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_direct.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_io.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_ls.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_sim.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_stg.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_stg1.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_proj.c.o" \
"/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_spils.c.o" \
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

src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodea.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodea_io.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_bandpre.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_bbdpre.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_diag.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_direct.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_io.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_ls.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_sim.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_stg.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_nls_stg1.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_proj.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_obj_static.dir/cvodes_spils.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_band.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_context.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_dense.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_direct.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_iterative.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_linearsolver.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_logger.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_math.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_matrix.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_memory.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nonlinearsolver.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_nvector_senswrapper.c.o
src/cvodes/libsundials_cvodes.a: src/sundials/CMakeFiles/sundials_generic_obj_static.dir/sundials_version.c.o
src/cvodes/libsundials_cvodes.a: src/sunmemory/system/CMakeFiles/sundials_sunmemsys_obj_static.dir/sundials_system_memory.c.o
src/cvodes/libsundials_cvodes.a: src/nvector/serial/CMakeFiles/sundials_nvecserial_obj_static.dir/nvector_serial.c.o
src/cvodes/libsundials_cvodes.a: src/sunmatrix/band/CMakeFiles/sundials_sunmatrixband_obj_static.dir/sunmatrix_band.c.o
src/cvodes/libsundials_cvodes.a: src/sunmatrix/dense/CMakeFiles/sundials_sunmatrixdense_obj_static.dir/sunmatrix_dense.c.o
src/cvodes/libsundials_cvodes.a: src/sunmatrix/sparse/CMakeFiles/sundials_sunmatrixsparse_obj_static.dir/sunmatrix_sparse.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/band/CMakeFiles/sundials_sunlinsolband_obj_static.dir/sunlinsol_band.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/dense/CMakeFiles/sundials_sunlinsoldense_obj_static.dir/sunlinsol_dense.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/spbcgs/CMakeFiles/sundials_sunlinsolspbcgs_obj_static.dir/sunlinsol_spbcgs.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/spfgmr/CMakeFiles/sundials_sunlinsolspfgmr_obj_static.dir/sunlinsol_spfgmr.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/spgmr/CMakeFiles/sundials_sunlinsolspgmr_obj_static.dir/sunlinsol_spgmr.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/sptfqmr/CMakeFiles/sundials_sunlinsolsptfqmr_obj_static.dir/sunlinsol_sptfqmr.c.o
src/cvodes/libsundials_cvodes.a: src/sunlinsol/pcg/CMakeFiles/sundials_sunlinsolpcg_obj_static.dir/sunlinsol_pcg.c.o
src/cvodes/libsundials_cvodes.a: src/sunnonlinsol/newton/CMakeFiles/sundials_sunnonlinsolnewton_obj_static.dir/sunnonlinsol_newton.c.o
src/cvodes/libsundials_cvodes.a: src/sunnonlinsol/fixedpoint/CMakeFiles/sundials_sunnonlinsolfixedpoint_obj_static.dir/sunnonlinsol_fixedpoint.c.o
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_static.dir/build.make
src/cvodes/libsundials_cvodes.a: src/cvodes/CMakeFiles/sundials_cvodes_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C static library libsundials_cvodes.a"
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes && $(CMAKE_COMMAND) -P CMakeFiles/sundials_cvodes_static.dir/cmake_clean_target.cmake
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sundials_cvodes_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cvodes/CMakeFiles/sundials_cvodes_static.dir/build: src/cvodes/libsundials_cvodes.a
.PHONY : src/cvodes/CMakeFiles/sundials_cvodes_static.dir/build

src/cvodes/CMakeFiles/sundials_cvodes_static.dir/clean:
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes && $(CMAKE_COMMAND) -P CMakeFiles/sundials_cvodes_static.dir/cmake_clean.cmake
.PHONY : src/cvodes/CMakeFiles/sundials_cvodes_static.dir/clean

src/cvodes/CMakeFiles/sundials_cvodes_static.dir/depend:
	cd /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1 /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/src/cvodes /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64 /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/CMakeFiles/sundials_cvodes_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cvodes/CMakeFiles/sundials_cvodes_static.dir/depend

