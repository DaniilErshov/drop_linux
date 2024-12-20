# Install script for directory: /home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/src/cvodes

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
Install CVODES
")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1-x86_64/src/cvodes/libsundials_cvodes.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cvodes" TYPE FILE FILES
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_bandpre.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_bbdpre.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_diag.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_direct.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_ls.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_proj.h"
    "/home/roman/REPO_GIT/3rd-party/SUNDIALS/SUNDIALS_6_5_1/sundials-6.5.1/include/cvodes/cvodes_spils.h"
    )
endif()

