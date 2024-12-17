# Install script for directory: /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasAkzoNob_ASAi_dns.c;/usr/local/examples/idas/serial/idasAkzoNob_ASAi_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAkzoNob_ASAi_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAkzoNob_ASAi_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasAkzoNob_dns.c;/usr/local/examples/idas/serial/idasAkzoNob_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAkzoNob_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAkzoNob_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasAnalytic_mels.c;/usr/local/examples/idas/serial/idasAnalytic_mels.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAnalytic_mels.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasAnalytic_mels.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasFoodWeb_bnd.c;/usr/local/examples/idas/serial/idasFoodWeb_bnd.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasFoodWeb_bnd.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasFoodWeb_bnd.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasHeat2D_bnd.c;/usr/local/examples/idas/serial/idasHeat2D_bnd.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHeat2D_bnd.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHeat2D_bnd.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasHeat2D_kry.c;/usr/local/examples/idas/serial/idasHeat2D_kry.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHeat2D_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHeat2D_kry.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasHessian_ASA_FSA.c;/usr/local/examples/idas/serial/idasHessian_ASA_FSA.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHessian_ASA_FSA.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasHessian_ASA_FSA.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasKrylovDemo_ls.c;/usr/local/examples/idas/serial/idasKrylovDemo_ls.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_1.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasKrylovDemo_ls.c;/usr/local/examples/idas/serial/idasKrylovDemo_ls.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_1.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasKrylovDemo_ls.c;/usr/local/examples/idas/serial/idasKrylovDemo_ls.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_1.out;/usr/local/examples/idas/serial/idasKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_ASAi_dns.c;/usr/local/examples/idas/serial/idasRoberts_ASAi_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_ASAi_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_ASAi_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_FSA_dns.c;/usr/local/examples/idas/serial/idasRoberts_FSA_dns_-sensi_stg_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_FSA_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_FSA_dns_-sensi_stg_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_dns.c;/usr/local/examples/idas/serial/idasRoberts_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasSlCrank_dns.c;/usr/local/examples/idas/serial/idasSlCrank_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasSlCrank_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasSlCrank_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasSlCrank_FSA_dns.c;/usr/local/examples/idas/serial/idasSlCrank_FSA_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasSlCrank_FSA_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasSlCrank_FSA_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/README")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/README")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_ASAi_dns_bkw1_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_ASAi_dns_bkw1_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_ASAi_dns_fwd_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_ASAi_dns_fwd_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_dns_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_dns_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/idasRoberts_FSA_dns_stats_-sensi_stg_t.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/idas/serial/idasRoberts_FSA_dns_stats_-sensi_stg_t.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/CMakeLists.txt")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial/CMakeLists.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/idas/serial/Makefile")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/idas/serial" TYPE FILE RENAME "Makefile" FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/idas/serial/Makefile_ex")
endif()
