# Install script for directory: /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial

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
   "/usr/local/examples/cvodes/serial/cvsAdvDiff_ASAi_bnd.c;/usr/local/examples/cvodes/serial/cvsAdvDiff_ASAi_bnd.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_ASAi_bnd.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_ASAi_bnd.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non.c;/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_stg_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_stg_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non.c;/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_stg_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_FSA_non_-sensi_stg_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsAdvDiff_bnd.c;/usr/local/examples/cvodes/serial/cvsAdvDiff_bnd.out;/usr/local/examples/cvodes/serial/cvsAdvDiff_bndL.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_bnd.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_bnd.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAdvDiff_bndL.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsAnalytic_mels.c;/usr/local/examples/cvodes/serial/cvsAnalytic_mels.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAnalytic_mels.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsAnalytic_mels.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsDirectDemo_ls.c;/usr/local/examples/cvodes/serial/cvsDirectDemo_ls.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDirectDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDirectDemo_ls.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry.c;/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_stg_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_stg_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry.c;/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_stg_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_FSA_kry_-sensi_stg_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsDiurnal_kry.c;/usr/local/examples/cvodes/serial/cvsDiurnal_kry.out;/usr/local/examples/cvodes/serial/cvsDiurnal_kry_bp.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_kry.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_kry_bp.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsDiurnal_kry_bp.c;/usr/local/examples/cvodes/serial/cvsDiurnal_kry_bp.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_kry_bp.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsDiurnal_kry_bp.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsFoodWeb_ASAi_kry.c;/usr/local/examples/cvodes/serial/cvsFoodWeb_ASAi_kry.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsFoodWeb_ASAi_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsFoodWeb_ASAi_kry.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsFoodWeb_ASAp_kry.c;/usr/local/examples/cvodes/serial/cvsFoodWeb_ASAp_kry.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsFoodWeb_ASAp_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsFoodWeb_ASAp_kry.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsHessian_ASA_FSA.c;/usr/local/examples/cvodes/serial/cvsHessian_ASA_FSA.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsHessian_ASA_FSA.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsHessian_ASA_FSA.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.c;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_1.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.c;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_1.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.c;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_1.out;/usr/local/examples/cvodes/serial/cvsKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsKrylovDemo_prec.c;/usr/local/examples/cvodes/serial/cvsKrylovDemo_prec.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_prec.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsKrylovDemo_prec.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsParticle_dns.c;/usr/local/examples/cvodes/serial/cvsParticle_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsParticle_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsParticle_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsPendulum_dns.c;/usr/local/examples/cvodes/serial/cvsPendulum_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsPendulum_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsPendulum_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns.c;/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns.out;/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.c;/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_constraints.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns.c;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_stg1_t.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_stg1_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns.c;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_sim_t.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_stg1_t.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_sim_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_-sensi_stg1_t.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.c;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_Switch.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints.c;/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_constraints_-sensi_stg1_t.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_dns.c;/usr/local/examples/cvodes/serial/cvsRoberts_dns.out;/usr/local/examples/cvodes/serial/cvsRoberts_dnsL.out;/usr/local/examples/cvodes/serial/cvsRoberts_dns_constraints.out;/usr/local/examples/cvodes/serial/cvsRoberts_dns_uw.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dnsL.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_constraints.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_uw.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_dns_constraints.c;/usr/local/examples/cvodes/serial/cvsRoberts_dns_constraints.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_constraints.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_constraints.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_dns_uw.c;/usr/local/examples/cvodes/serial/cvsRoberts_dns_uw.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_uw.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_uw.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/README")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/README")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/plot_cvsParticle.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/plot_cvsParticle.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/plot_cvsPendulum.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/plot_cvsPendulum.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_bkw1_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_bkw1_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_bkw2_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_bkw2_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_ASAi_dns_fwd_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_ASAi_dns_fwd_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_dns_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_dns_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_stats_-sensi_sim_t.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_stats_-sensi_sim_t.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/cvsRoberts_FSA_dns_stats_-sensi_stg1_t.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvodes/serial/cvsRoberts_FSA_dns_stats_-sensi_stg1_t.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/CMakeLists.txt")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/cvodes/serial/CMakeLists.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvodes/serial/Makefile")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvodes/serial" TYPE FILE RENAME "Makefile" FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/cvodes/serial/Makefile_ex")
endif()

