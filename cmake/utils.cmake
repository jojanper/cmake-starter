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
