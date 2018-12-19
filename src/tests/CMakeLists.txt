set(TEST_SUITE_NAME libTests)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../api)

set(SRCS
  test_lib.cpp
)

set(EXTRA_LINK_LIBRARIES
  cdraaloptions
)

add_executable(${TEST_SUITE_NAME} ${SRCS})
target_link_libraries(${TEST_SUITE_NAME} ${EXTRA_LINK_LIBRARIES} ${GTEST_ALL_LIBS})
add_test(NAME ${TEST_SUITE_NAME} COMMAND $<TARGET_FILE:${TEST_SUITE_NAME}>)
set_target_properties(${TEST_SUITE_NAME} PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin
)
