/*********************** dSPACE target specific file *************************

   Include file ds_fivezoneg36_dsrt_dsrtap.h:

   Definitions for access points to Simulink root ports.

   Wed Oct  6 14:22:41 2021

   Copyright 2020, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_fivezoneg36_dsrt_DSRTAP_HEADER_
#define _DSRT_ds_fivezoneg36_dsrt_DSRTAP_HEADER_
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

#ifndef DATA_PORT_ACCESS_POINT_API_VERSION
#error The data port access point API version is undefined.
#elif (DATA_PORT_ACCESS_POINT_API_VERSION > 2) || (DATA_PORT_ACCESS_POINT_API_VERSION < 1)
#error The defined data port access point API version is unsupported.
#endif

#if (DATA_PORT_ACCESS_POINT_API_VERSION == 2)
#include "ds_fivezoneg36_dsrt_types.h"
#else
#include "rtwtypes.h"
#endif

/* Extern declarations for access points */
#ifdef HAVE_ds_fivezoneg36_dsrt_DSRTAP_CUSTOM
#include "ds_fivezoneg36_dsrt_dsrtap_custom.h"
#endif
#endif                            /* _DSRT_ds_fivezoneg36_dsrt_DSRTAP_HEADER_ */
