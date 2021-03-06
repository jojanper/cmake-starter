#include <stdio.h>
#include <stdlib.h>

#include "cdraaloptions/options-c.h"
#include "cdraaloptions/options.h"

int
main(int argc, char const *argv[])
{
    cdraal::Options options;

    printf("Number of arguments: %i\n", argc);
    for (int i = 0; i < argc; i++)
        printf("%s\n", argv[i]);

    auto handle = CDraalOpenOptions();
    CDraalCloseOptions(handle);

    return options.addOption() ? EXIT_SUCCESS : EXIT_FAILURE;
}
