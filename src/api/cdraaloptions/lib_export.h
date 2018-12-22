#pragma once

#if __GNUC__ >= 4
#define CDRAAL_PUBLIC __attribute__ ((visibility ("default")))
#else
#define DRAAL_PUBLIC
#endif
