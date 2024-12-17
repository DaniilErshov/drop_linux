# Install script for directory: /home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial

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
   "/usr/local/examples/cvode/serial/cvAdvDiff_bnd.c;/usr/local/examples/cvode/serial/cvAdvDiff_bnd.out;/usr/local/examples/cvode/serial/cvAdvDiff_bndL.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvAdvDiff_bnd.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvAdvDiff_bnd.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvAdvDiff_bndL.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvAnalytic_mels.c;/usr/local/examples/cvode/serial/cvAnalytic_mels.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvAnalytic_mels.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvAnalytic_mels.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvDirectDemo_ls.c;/usr/local/examples/cvode/serial/cvDirectDemo_ls.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDirectDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDirectDemo_ls.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvDisc_dns.c;/usr/local/examples/cvode/serial/cvDisc_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDisc_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDisc_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvDiurnal_kry_bp.c;/usr/local/examples/cvode/serial/cvDiurnal_kry_bp.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDiurnal_kry_bp.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDiurnal_kry_bp.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvDiurnal_kry.c;/usr/local/examples/cvode/serial/cvDiurnal_kry.out;/usr/local/examples/cvode/serial/cvDiurnal_kry_bp.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDiurnal_kry.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDiurnal_kry.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvDiurnal_kry_bp.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvKrylovDemo_ls.c;/usr/local/examples/cvode/serial/cvKrylovDemo_ls.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_0_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_0_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvKrylovDemo_ls.c;/usr/local/examples/cvode/serial/cvKrylovDemo_ls.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_0_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_0_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvKrylovDemo_ls.c;/usr/local/examples/cvode/serial/cvKrylovDemo_ls.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_0_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_1.out;/usr/local/examples/cvode/serial/cvKrylovDemo_ls_2.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_0_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_1.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_ls_2.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvKrylovDemo_prec.c;/usr/local/examples/cvode/serial/cvKrylovDemo_prec.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_prec.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvKrylovDemo_prec.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvParticle_dns.c;/usr/local/examples/cvode/serial/cvParticle_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvParticle_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvParticle_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvPendulum_dns.c;/usr/local/examples/cvode/serial/cvPendulum_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvPendulum_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvPendulum_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRoberts_dns.c;/usr/local/examples/cvode/serial/cvRoberts_dns.out;/usr/local/examples/cvode/serial/cvRoberts_dnsL.out;/usr/local/examples/cvode/serial/cvRoberts_dns_constraints.out;/usr/local/examples/cvode/serial/cvRoberts_dns_negsol.out;/usr/local/examples/cvode/serial/cvRoberts_dns_uw.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dnsL.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_constraints.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_negsol.out"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_uw.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRoberts_dns_constraints.c;/usr/local/examples/cvode/serial/cvRoberts_dns_constraints.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_constraints.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_constraints.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRoberts_dns_negsol.c;/usr/local/examples/cvode/serial/cvRoberts_dns_negsol.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_negsol.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_negsol.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRoberts_dns_uw.c;/usr/local/examples/cvode/serial/cvRoberts_dns_uw.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_uw.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_uw.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRocket_dns.c;/usr/local/examples/cvode/serial/cvRocket_dns.out")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRocket_dns.c"
    "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRocket_dns.out"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/README")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/README")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/plot_cvParticle.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/plot_cvParticle.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/plot_cvPendulum.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/plot_cvPendulum.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/cvRoberts_dns_stats.csv")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/sundials-6.5.1/examples/cvode/serial/cvRoberts_dns_stats.csv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/CMakeLists.txt")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/cvode/serial/CMakeLists.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/examples/cvode/serial/Makefile")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/examples/cvode/serial" TYPE FILE RENAME "Makefile" FILES "/home/daniilershov/autoignition/auto_ignition/auto_ignition/sundials/build/examples/cvode/serial/Makefile_ex")
endif()

