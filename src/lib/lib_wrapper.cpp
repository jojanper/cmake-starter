#include <stddef.h>
#include <stdio.h>

#include "cdraaloptions/options-c.h"
#include "cdraaloptions/options.h"

CDraalOptionsHandle CDraalOpenOptions()
{
    auto handle = new cdraal::Options();
    printf("Create handle: %p\n", handle);
    return handle;
}

void CDraalCloseOptions(CDraalOptionsHandle handle)
{
    auto *obj = (cdraal::Options *) handle;
    printf("Close handle: %p\n", obj);
    delete obj;
}
