cmake_minimum_required (VERSION 3.5)
set(CMAKE_MACOSX_RPATH OFF)
set(PACKAGE_VERSION 0.1.0)

if (NOT CMAKE_BUILD_TYPE)
  message(STATUS "No build type specified, defaulting to release.")
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
endif ()

project(streamclusterer)

option(BUILD_LTO "Build with link-time optimizations." OFF)
option(BUILD_SANITIZE "Build with address sanitizer." OFF)

# Include some of our custom CMake modules
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake")
find_package(CTargets)
find_package(Options)
find_package(LTO)

#include_directories(include /usr/local/include/roaring)
link_directories(/usr/local/lib/)

enable_testing()
include(CTest)

#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(TEST_DATA_DIR "${CMAKE_CURRENT_SOURCE_DIR}/tests/testdata/")
set(BENCHMARK_DATA_DIR "${CMAKE_CURRENT_SOURCE_DIR}/benchmarks/realdata/")
message(STATUS "Using TEST_DATA_DIR: " ${TEST_DATA_DIR})
message(STATUS "Using BENCHMARK_DATA_DIR: " ${BENCHMARK_DATA_DIR})

add_subdirectory(src)
add_subdirectory(tests)

MESSAGE(STATUS "CMAKE_SYSTEM_PROCESSOR: " ${CMAKE_SYSTEM_PROCESSOR})
MESSAGE(STATUS "CMAKE_BUILD_TYPE: " ${CMAKE_BUILD_TYPE})
MESSAGE(STATUS "BUILD_LTO: " ${BUILD_LTO})
MESSAGE(STATUS "SANITIZE: " ${BUILD_SANITIZE})
MESSAGE(STATUS "CMAKE_C_COMPILER: " ${CMAKE_C_COMPILER})
MESSAGE(STATUS "CMAKE_C_FLAGS: " ${CMAKE_C_FLAGS})
MESSAGE(STATUS "CMAKE_C_FLAGS_DEBUG: " ${CMAKE_C_FLAGS_DEBUG})
MESSAGE(STATUS "CMAKE_C_FLAGS_RELEASE: " ${CMAKE_C_FLAGS_RELEASE})

