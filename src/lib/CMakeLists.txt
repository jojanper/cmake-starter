set(LIBNAME "cdraaloptions")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(HDRS
  ${CMAKE_CURRENT_SOURCE_DIR}/../api/cdraaloptions/options.h
)

set(SRCS
   options.cpp
)

set(EXTRA_LINK_LIBRARIES
)

add_library(${LIBNAME} STATIC ${HDRS} ${SRCS})
target_link_libraries(${LIBNAME} ${EXTRA_LINK_LIBRARIES})
set_target_properties(${LIBNAME} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
)

install(TARGETS ${LIBNAME}
  ARCHIVE
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(FILES
  ${HDRS}
  DESTINATION include/cdraaloptions
)

strip_library(${LIBNAME})
