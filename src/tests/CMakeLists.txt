set(TEST_SUITE_NAME libTests)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(SRCS
  test_lib.cpp
)

set(EXTRA_LINK_LIBRARIES
  cdraaloptions
)

build_unittest(${TEST_SUITE_NAME} "${SRCS}" "${EXTRA_LINK_LIBRARIES}")
