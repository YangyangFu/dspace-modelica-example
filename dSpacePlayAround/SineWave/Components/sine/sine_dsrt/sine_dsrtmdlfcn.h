/*****************************************************************************

   Include file sine_dsrtmdlfcn.h:

   Definition of model functions.

   Fri Mar 26 18:27:01 2021

   Copyright 2017, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_sine_DSRTMDLFCN_HEADER_
#define _DSRT_sine_DSRTMDLFCN_HEADER_
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
EXTERN_C_DECL void sine_DSRTInitMdl(void);
EXTERN_C_DECL void sine_DSRTStartMdl(void);
EXTERN_C_DECL void sine_DSRTStopMdl(void);
EXTERN_C_DECL void sine_DSRTCheckForSimulationStopCondition(void);
EXTERN_C_DECL void sine_DSRTCheckForErrorStatus(void);
EXTERN_C_DECL void sine_APTerminateSimulation(void);
EXTERN_C_DECL void sine_APStopSimulation(void);
EXTERN_C_DECL void sine_APLastApplStateStopped(uint8_T*);
EXTERN_C_DECL void sine_APPrintMessage(const char_T*);

#endif                                 /* _DSRT_sine_DSRTMDLFCN_HEADER_ */
