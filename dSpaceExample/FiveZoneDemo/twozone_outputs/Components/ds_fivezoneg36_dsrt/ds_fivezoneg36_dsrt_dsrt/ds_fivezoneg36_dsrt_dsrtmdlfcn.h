/*****************************************************************************

   Include file ds_fivezoneg36_dsrt_dsrtmdlfcn.h:

   Definition of model functions.

   Wed Oct  6 14:22:41 2021

   Copyright 2017, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_fivezoneg36_dsrt_DSRTMDLFCN_HEADER_
#define _DSRT_ds_fivezoneg36_dsrt_DSRTMDLFCN_HEADER_
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
EXTERN_C_DECL void ds_fivezoneg36_dsrt_DSRTInitMdl(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_DSRTStartMdl(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_DSRTStopMdl(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_DSRTCheckForSimulationStopCondition(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_DSRTCheckForErrorStatus(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_APTerminateSimulation(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_APStopSimulation(void);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_APLastApplStateStopped(uint8_T*);
EXTERN_C_DECL void ds_fivezoneg36_dsrt_APPrintMessage(const char_T*);

#endif                        /* _DSRT_ds_fivezoneg36_dsrt_DSRTMDLFCN_HEADER_ */
