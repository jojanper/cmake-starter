set(APPNAME optionsapp)

set(HDRS
)

set(SRCS
  main.cpp
)

set(EXE_SRCS ${HDRS} ${SRCS})
build_exe("${APPNAME}" "${EXE_SRCS}" cdraaloptions_static "")
