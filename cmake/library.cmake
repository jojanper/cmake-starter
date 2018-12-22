# Parse list such that first argument is assigned to FIRST_ARG variable
# and remaining arguments are assinged to REMAINING_ARG variables. These
# variables are available to the the caller via PARENT_SCOPE.
function(parse_list)
  set(args ${ARGN})
  list(LENGTH args num_args)
  MATH(EXPR list_length "${num_args}-1")

  set(lib_srcs)
  foreach(arg RANGE 1 ${list_length})
    list(GET args ${arg} entry )
    set(lib_srcs "${lib_srcs} ${entry}")
  endforeach(arg)

  list(GET args 0 lib_name)
  set(FIRST_ARG ${lib_name} PARENT_SCOPE)
  set(REMAINING_ARG ${lib_srcs} PARENT_SCOPE)
endfunction()

# Create object library.
#
# lib_name - Name of library
# lib_srcs - Library sources
function(build_object_library lib_name lib_srcs)
  add_library(${lib_name} OBJECT ${lib_srcs})
  set_target_properties(${lib_name} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
  )
endfunction()

# Create static library.
#
# lib_name  - Name of library
# lib_srcs  - Library sources
# link_libs - Additional link libraries
function(build_static_library lib_name lib_srcs link_libs)
  add_library(${lib_name} STATIC ${lib_srcs})
  set_target_properties(${lib_name} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
  )
  target_link_libraries(${lib_name} ${link_libs})
endfunction()

# Create shared library.
#
# lib_name  - Name of library
# lib_srcs  - Library sources
# link_libs - Additional link libraries
function(build_shared_library lib_name lib_srcs link_libs)
  add_library(${lib_name} SHARED ${lib_srcs})
  set_target_properties(${lib_name} PROPERTIES
    COMPILE_DEFINITIONS "SHARED_LIBRARY"
    VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD}
    SOVERSION ${VERSION_MAJOR}
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin
  )
  target_link_libraries(${lib_name} PRIVATE ${link_libs})
  strip_library(${lib_name})
endfunction()

# Install target.
#
# target - Target item
function(install_target_binary target)
  install(TARGETS ${target}
    ARCHIVE
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
  )
endfunction()

# Install files.
#
# destination - Destination name
# target      - Target file(s)
function(install_target_files destination target)
  install(FILES ${target} DESTINATION ${destination})
endfunction()
