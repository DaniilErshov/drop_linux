# CMake generated Testfile for 
# Source directory: D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial
# Build directory: D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/examples/arkode/C_serial
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(ark_analytic "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Debug/ark_analytic.exe")
  set_tests_properties(ark_analytic PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;128;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(ark_analytic "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Release/ark_analytic.exe")
  set_tests_properties(ark_analytic PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;128;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(ark_analytic "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/MinSizeRel/ark_analytic.exe")
  set_tests_properties(ark_analytic PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;128;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(ark_analytic "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/RelWithDebInfo/ark_analytic.exe")
  set_tests_properties(ark_analytic PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;128;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/arkode/C_serial/CMakeLists.txt;0;")
else()
  add_test(ark_analytic NOT_AVAILABLE)
endif()
