/*****************************************************************************

   Include file ds_simple_twozone_dsrtmdlfcn.h:

   Definition of model functions.

   Mon Oct 11 17:55:19 2021

   Copyright 2017, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_simple_twozone_DSRTMDLFCN_HEADER_
#define _DSRT_ds_simple_twozone_DSRTMDLFCN_HEADER_
#if defined(EXTERN_C_DECL)
#undef EXTERN_C_DECL
#endif

#if defined(__cplusplus)
#define EXTERN_C_DECL                  extern "C"
#else
#define EXTERN_C_DECL                  extern
#endif

#include "rtwtypes.h"
#include <string.h>

/* Model functions declarations */
EXTERN_C_DECL void ds_simple_twozone_DSRTInitMdl(void);
EXTERN_C_DECL void ds_simple_twozone_DSRTStartMdl(void);
EXTERN_C_DECL void ds_simple_twozone_DSRTStopMdl(void);
EXTERN_C_DECL void ds_simple_twozone_DSRTCheckForSimulationStopCondition(void);
EXTERN_C_DECL void ds_simple_twozone_DSRTCheckForErrorStatus(void);
EXTERN_C_DECL void ds_simple_twozone_APTerminateSimulation(void);
EXTERN_C_DECL void ds_simple_twozone_APStopSimulation(void);
EXTERN_C_DECL void ds_simple_twozone_APLastApplStateStopped(uint8_T*);
EXTERN_C_DECL void ds_simple_twozone_APPrintMessage(const char_T*);

#endif                          /* _DSRT_ds_simple_twozone_DSRTMDLFCN_HEADER_ */
