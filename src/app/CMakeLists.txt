set(APPNAME optionsapp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(HDRS
)

set(SRCS
  main.cpp
)

add_executable(${APPNAME}
  ${SRCS}
  ${HDRS}
)

target_link_libraries(${APPNAME}
  cdraaloptions
)

set_target_properties(${APPNAME} PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin
  LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/libs
  ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/libs
  COMPILE_DEFINITIONS ""
)
