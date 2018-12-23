set(LIBNAME "cdraaloptions_obj")
set(LIBNAME_STATIC "cdraaloptions_static")
set(LIBNAME_SHARED "cdraaloptions")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(HDRS
  ${CMAKE_CURRENT_SOURCE_DIR}/../api/cdraaloptions/options.h
  ${CMAKE_CURRENT_SOURCE_DIR}/../api/cdraaloptions/lib_export.h
)

set(SRCS
   options.cpp
)

set(EXTRA_LINK_LIBRARIES
)

# Create object library (as intermediate target)
set(OBJECT_SRCS ${HDRS} ${SRCS})
build_object_library("${LIBNAME}" "${OBJECT_SRCS}")

set(LIB_SRCS ${HDRS} $<TARGET_OBJECTS:${LIBNAME}>)

# Shared library is installed to shared package
build_shared_library(${LIBNAME_SHARED} "${LIB_SRCS}" "${EXTRA_LINK_LIBRARIES}" TRUE)
install_target_binary(${LIBNAME_SHARED} shared)
install_target_files("include/cdraaloptions" "${HDRS}" shared)

# Static library is installed to static package
build_static_library(${LIBNAME_STATIC} "${LIB_SRCS}" "${EXTRA_LINK_LIBRARIES}" TRUE)
install_target_binary(${LIBNAME_STATIC} static)
install_target_files("include/cdraaloptions" "${HDRS}" static)
