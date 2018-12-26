# Public API
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/api)

add_subdirectory(lib)

if(BUILD_APPS)
  add_subdirectory(app)
endif(BUILD_APPS)

if(BUILD_TESTS)
  add_subdirectory(tests)
endif(BUILD_TESTS)
