set(APPNAME optionsapp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(HDRS
)

set(SRCS
  main.cpp
)

set(EXE_SRCS ${HDRS} ${SRCS})
build_exe("${APPNAME}" "${EXE_SRCS}" cdraaloptions_static "")
