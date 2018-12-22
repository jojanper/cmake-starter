cmake_minimum_required(VERSION 3.5)
project(cdraaloptions)

set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(CheckFunctionExists)
include(CheckIncludeFiles)
include(CheckIncludeFileCXX)
include(${PROJECT_SOURCE_DIR}/cmake/cxxflags.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/strip.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/library.cmake)

option(BUILD_TESTS "Build gtest unit tests" ON)
option(HAVE_THREADS "Use pthread in tests" ON)

set(EXT_PROJECTS_DIR ${PROJECT_SOURCE_DIR}/extProjects)

if(HAVE_THREADS)
  add_definitions(-DHAVE_THREADS)
endif(HAVE_THREADS)

# Unit testing: gtest as external component
if(BUILD_TESTS)
  if(HAVE_THREADS)
    find_package(Threads REQUIRED)
  endif(HAVE_THREADS)

  enable_testing()
  add_subdirectory(${EXT_PROJECTS_DIR}/gtest)
  include_directories(${GTEST_INCLUDE_DIRS})
endif(BUILD_TESTS)

# Include source codes
add_subdirectory(src)

# Set up cpack
set(PACKAGE_NAME "${CMAKE_PROJECT_NAME}-${CMAKE_SYSTEM_NAME}-${CMAKE_BUILD_TYPE}-${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
set(CPACK_PACKAGE_DESCRIPTION "CMake library project skeleton")
set(CPACK_PACKAGE_VERSION_MAJOR "${VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${VERSION_PATCH}")
set(CPACK_PACKAGE_VENDOR "Juha Ojanperä")
set(CPACK_PACKAGE_CONTACT "juha.ojanpera@gmail.com")
set(CPACK_PACKAGE_FILE_NAME ${PACKAGE_NAME})
set(CPACK_GENERATOR "ZIP")
set(CPACK_STRIP_FILES TRUE)
set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_ALL_IN_ONE_PACKAGE ON)
include(CPack)

# Show system settings
message("System name         ${CMAKE_SYSTEM_NAME}")
message("Build options:")
message(" C Compiler         ${CMAKE_C_COMPILER}")
message(" C++ Compiler       ${CMAKE_CXX_COMPILER}")
message(" Build type         ${CMAKE_BUILD_TYPE}")
message(" C_FLAGS            ${CMAKE_CXX_FLAGS}")
message(" CXX_FLAGS          ${CMAKE_CXX_FLAGS}")
message(" Tests              ${BUILD_TESTS}")
message("  -threads:         ${HAVE_THREADS}")
message("  -thread library:  ${CMAKE_THREAD_LIBS_INIT}")
message(" Package            ${PACKAGE_NAME}")
