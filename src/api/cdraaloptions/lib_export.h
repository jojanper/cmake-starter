#pragma once

#if __GNUC__ >= 4
#define CDRAAL_PUBLIC __attribute__ ((visibility ("default")))
#else
#define CDRAAL_PUBLIC
#endif
