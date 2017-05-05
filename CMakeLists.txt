cmake_minimum_required(VERSION 3.1)

project(crunch)

set(CRUNCH_PROJECT_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(CRUNCH_INCLUDE_DIRS
    "${CRUNCH_PROJECT_DIR}/inc"
    "${CRUNCH_PROJECT_DIR}/crnlib"
)

list(APPEND CMAKE_MODULE_PATH "${CRUNCH_PROJECT_DIR}/CMakeModules")

find_package(Threads)
find_package(libm)

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(COMP_FLAGS "-fomit-frame-pointer -ffast-math -fno-math-errno \
    -fno-strict-aliasing -Wall -Wextra -march=core2")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMP_FLAGS}")

set(CMAKE_CXX_STANDARD 11)

add_subdirectory(crunch)
add_subdirectory(crnlib)

if (CMAKE_COMPILER_ID STREQUAL "MSVC")
    add_subdirectory(example1)
    add_subdirectory(example2)
    add_subdirectory(example3)
endif()
