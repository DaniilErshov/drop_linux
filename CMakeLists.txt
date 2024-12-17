cmake_minimum_required(VERSION 3.10)
  
# Указываем имя проекта
project(autoignition VERSION 1.0 LANGUAGES CXX)

# Указываем стандарт C++
set(CMAKE_CXX_STANDARD 20)

set(SUNDIALS_INSTDIR
  /home/daniilershov/sundials/build)
  
set(SUNDIALS_SRCDIR
 /home/daniilershov/sundials/sundials-6.5.1)

find_package(OpenMP REQUIRED)

# Update C compiler and linker flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_C_FLAGS}")


# Указываем директорию для заголовочных файлов
include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}/Json_reader
  ${CMAKE_CURRENT_SOURCE_DIR}/Boost_regex/include
  ${CMAKE_CURRENT_SOURCE_DIR}/ChemKinReader/include
  ${CMAKE_CURRENT_SOURCE_DIR}/auto_ignition
  ${CMAKE_CURRENT_SOURCE_DIR}/data_files
  ${SUNDIALS_INSTDIR}/include
  ${SUNDIALS_SRCDIR}/include
)

set(SUNDIALS_INCLUDE_DIR
   ${SUNDIALS_INSTDIR}/include
  CACHE PATH "Location of SUNDIALS header files")

# Specify the path to SUNDIALS libraries
set(SUNDIALS_LIBRARY_DIR
  ${SUNDIALS_INSTDIR}/lib
  CACHE PATH "Location of SUNDIALS libraries")


find_library(SUNDIALS_IDA_LIB
  sundials_ida ${SUNDIALS_LIBRARY_DIR}
  DOC "IDA library")

find_library(SUNDIALS_KINSOL_LIB
  sundials_kinsol ${SUNDIALS_LIBRARY_DIR}
  DOC "KINSOL library")
  

find_library(SUNDIALS_MANYVEC_LIB
  sundials_nvecmanyvector ${SUNDIALS_LIBRARY_DIR}
  DOC "NVECTOR_MANYVECTOR library")


find_library(SUNDIALS_NVEC_LIB
sundials_nvecopenmp ${SUNDIALS_LIBRARY_DIR}
DOC "NVECTOR_OPENMP library")

# Set additional libraries
set(SUNDIALS_EXTRA_LIBS  -lm CACHE STRING "Additional libraries")

# For SUNDIALS module examples the solver library is not needed
if(NOT SUNDIALS_SOLVER_LIB)
  set(SUNDIALS_SOLVER_LIB "")
endif()

# List of SUNDIALS libraries
set(SUNDIALS_LIBRARIES
  -L${SUNDIALS_LIBRARY_DIR}
  ${SUNDIALS_IDA_LIB}
  ${SUNDIALS_KINSOL_LIB}
  ${SUNDIALS_NVEC_LIB}
  ${SUNDIALS_MANYVEC_LIB}
  ${SUNDIALS_EXTRA_LIBS})


# Автоматически находим все .cpp файлы
file(GLOB SOURCES
    src/*.cpp
    Boost_regex/src/*.cpp
    ChemKinReader/src/*.cpp
    auto_ignition/*.cpp
    Json_reader/*.cc
)

# Проверяем, были ли найдены файлы
if(NOT SOURCES)
    message(FATAL_ERROR "No source files found!")
endif()

 message("DIR LIB = ${SUNDIALS_LIBRARY_DIR}")


add_executable(MyExecutable_1 ${SOURCES})


target_include_directories(MyExecutable_1 PRIVATE ${SUNDIALS_INCLUDE_DIR})
# Линкуем с библиотеками SUNDIALS
target_link_libraries(MyExecutable_1 ${SUNDIALS_IDA_LIB} ${SUNDIALS_KINSOL_LIB} ${SUNDIALS_NVEC_LIB})
 if(OpenMP_CXX_FOUND)
    target_link_libraries(MyExecutable_1 OpenMP::OpenMP_CXX)
endif()
