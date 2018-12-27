project(CDraalOptionsPackageTest LANGUAGES CXX C)
cmake_minimum_required(VERSION 3.5)

# Build using shared library (ON) or static library (OFF)
option(SHARED_PACKAGE "Use shared cmake targets" ON)

set(TARGET CDraalOptions)

# Target scripts
if (SHARED_PACKAGE)
  set(LINK_LIB cdraaloptions)
  set(TARGET "${TARGET}Shared")
else()
  set(LINK_LIB cdraaloptions_static)
  set(TARGET "${TARGET}Static")
endif(SHARED_PACKAGE)

# Find library settings from installed scripts
set(${TARGET}_DIR "${PACKAGE_PREFIX}/cmake")
find_package(${TARGET} REQUIRED)

set(HDRS
)

set(SRCS
  main.cpp
)

set(EXE_SRCS ${HDRS} ${SRCS})
set(APP_NAME cdraaloptions_public_app)

add_executable(${APP_NAME} ${EXE_SRCS})
target_link_libraries(${APP_NAME} CDraal::${LINK_LIB})
set_target_properties(${APP_NAME} PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin
  LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
  ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
  COMPILE_DEFINITIONS ""
)
