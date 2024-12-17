# CMake generated Testfile for 
# Source directory: D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial
# Build directory: D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/examples/sunlinsol/pcg/serial
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(test_sunlinsol_pcg_serial_100_500_1e-13_0 "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Debug/test_sunlinsol_pcg_serial.exe" "100" "500" "1e-13" "0")
  set_tests_properties(test_sunlinsol_pcg_serial_100_500_1e-13_0 PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;81;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(test_sunlinsol_pcg_serial_100_500_1e-13_0 "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/Release/test_sunlinsol_pcg_serial.exe" "100" "500" "1e-13" "0")
  set_tests_properties(test_sunlinsol_pcg_serial_100_500_1e-13_0 PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;81;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(test_sunlinsol_pcg_serial_100_500_1e-13_0 "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/MinSizeRel/test_sunlinsol_pcg_serial.exe" "100" "500" "1e-13" "0")
  set_tests_properties(test_sunlinsol_pcg_serial_100_500_1e-13_0 PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;81;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(test_sunlinsol_pcg_serial_100_500_1e-13_0 "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials_build/bin/RelWithDebInfo/test_sunlinsol_pcg_serial.exe" "100" "500" "1e-13" "0")
  set_tests_properties(test_sunlinsol_pcg_serial_100_500_1e-13_0 PROPERTIES  _BACKTRACE_TRIPLES "D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/cmake/macros/SundialsAddTest.cmake;183;add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;81;sundials_add_test;D:/Storage/Daniil/gorenie_version/gorenie_try1_10/sundials/sundials-6.5.1/examples/sunlinsol/pcg/serial/CMakeLists.txt;0;")
else()
  add_test(test_sunlinsol_pcg_serial_100_500_1e-13_0 NOT_AVAILABLE)
endif()
