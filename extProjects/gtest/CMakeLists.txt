project(gtest_builder)
include(ExternalProject)

# Download and install GoogleTest
ExternalProject_Add(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest
  GIT_TAG        master
  CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=DebugLibs
  -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=ReleaseLibs

  # Disable install step
  INSTALL_COMMAND ""
)

# Specify include dir
ExternalProject_Get_Property(googletest source_dir)
set(GTEST_INCLUDE_DIRS ${source_dir}/googletest/include)

# Specify MainTest's link libraries
ExternalProject_Get_Property(googletest binary_dir)
set(GTEST_LIBS_DIR ${binary_dir}/googlemock/gtest)

add_library(gtest STATIC IMPORTED GLOBAL)
set_target_properties(gtest PROPERTIES IMPORTED_LOCATION_RELEASE ${GTEST_LIBS_DIR}/ReleaseLibs/libgtest.a)
set_target_properties(gtest PROPERTIES IMPORTED_LOCATION_DEBUG ${GTEST_LIBS_DIR}/DebugLibs/libgtestd.a)

add_library(gtest_main STATIC IMPORTED GLOBAL)
set_target_properties(gtest_main PROPERTIES IMPORTED_LOCATION_RELEASE ${GTEST_LIBS_DIR}/ReleaseLibs/libgtest_main.a)
set_target_properties(gtest_main PROPERTIES IMPORTED_LOCATION_DEBUG ${GTEST_LIBS_DIR}/DebugLibs/libgtest_maind.a)

set(GTEST_ALL_LIBS "")
if (CMAKE_USE_PTHREADS_INIT)
  set(GTEST_ALL_LIBS ${CMAKE_THREAD_LIBS_INIT})
endif(CMAKE_USE_PTHREADS_INIT)

# Expose these variables to parent scope
set(GTEST_ALL_LIBS gtest gtest_main ${GTEST_ALL_LIBS} PARENT_SCOPE)
set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIRS} PARENT_SCOPE)
