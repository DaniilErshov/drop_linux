# Install script for directory: D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/src/sundials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/SUNDIALS")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  MESSAGE("
Install shared components
")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Debug/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Release/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/MinSizeRel/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/RelWithDebInfo/sundials_generic.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_static.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_static.dir/install-cxx-module-bmi-Release.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_static.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_static.dir/install-cxx-module-bmi-RelWithDebInfo.cmake" OPTIONAL)
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Debug/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Release/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/MinSizeRel/sundials_generic.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/RelWithDebInfo/sundials_generic.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Debug/sundials_generic.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Release/sundials_generic.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/MinSizeRel/sundials_generic.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/RelWithDebInfo/sundials_generic.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_shared.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_shared.dir/install-cxx-module-bmi-Release.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_shared.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    include("D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/src/sundials/CMakeFiles/sundials_generic_shared.dir/install-cxx-module-bmi-RelWithDebInfo.cmake" OPTIONAL)
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sundials" TYPE FILE FILES
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_base.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_band.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_context.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_context.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_convertibleto.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_dense.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_direct.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_iterative.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_linearsolver.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_linearsolver.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_math.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_matrix.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_matrix.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_memory.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_mpi_types.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_nonlinearsolver.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_nonlinearsolver.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_nvector.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_nvector.hpp"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_profiler.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_logger.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_types.h"
    "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/include/sundials/sundials_version.h"
    )
endif()

