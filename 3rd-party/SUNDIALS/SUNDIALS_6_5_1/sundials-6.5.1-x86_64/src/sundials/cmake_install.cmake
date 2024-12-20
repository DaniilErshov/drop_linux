# Install script for directory: /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/src/sundials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  MESSAGE("
Install shared components
")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/sundials/libsundials_generic.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sundials" TYPE FILE FILES
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_base.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_band.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_context.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_context.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_convertibleto.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_dense.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_direct.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_iterative.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_linearsolver.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_linearsolver.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_math.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_matrix.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_matrix.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_memory.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_mpi_types.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_nonlinearsolver.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_nonlinearsolver.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_nvector.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_nvector.hpp"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_profiler.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_logger.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_types.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/sundials/sundials_version.h"
    )
endif()

