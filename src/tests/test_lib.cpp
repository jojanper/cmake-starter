#include <gtest/gtest.h>

#include "cdraaloptions/options.h"

TEST(OptionsTestSuite, Init)
{
    cdraal::Options options;

    EXPECT_TRUE(options.addOption());
}
