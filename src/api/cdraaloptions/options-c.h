#include <stddef.h>

#include "cdraaloptions/lib_export.h"

/**
 * Options handle.
 */
typedef void *CDraalOptionsHandle;

#ifdef __cplusplus
extern "C" {
#endif

CDRAAL_PUBLIC CDraalOptionsHandle CDraalOpenOptions();
CDRAAL_PUBLIC void CDraalCloseOptions(CDraalOptionsHandle handle);

#ifdef __cplusplus
}
#endif
