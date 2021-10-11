/*****************************************************************************

   Include file ds_modelica_constant_dsrtmdlfcn.h:

   Definition of model functions.

   Fri Oct  8 16:56:56 2021

   Copyright 2017, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_modelica_constant_DSRTMDLFCN_HEADER_
#define _DSRT_ds_modelica_constant_DSRTMDLFCN_HEADER_
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
EXTERN_C_DECL void ds_modelica_constant_DSRTInitMdl(void);
EXTERN_C_DECL void ds_modelica_constant_DSRTStartMdl(void);
EXTERN_C_DECL void ds_modelica_constant_DSRTStopMdl(void);
EXTERN_C_DECL void ds_modelica_constant_DSRTCheckForSimulationStopCondition(void);
EXTERN_C_DECL void ds_modelica_constant_DSRTCheckForErrorStatus(void);
EXTERN_C_DECL void ds_modelica_constant_APTerminateSimulation(void);
EXTERN_C_DECL void ds_modelica_constant_APStopSimulation(void);
EXTERN_C_DECL void ds_modelica_constant_APLastApplStateStopped(uint8_T*);
EXTERN_C_DECL void ds_modelica_constant_APPrintMessage(const char_T*);

#endif                       /* _DSRT_ds_modelica_constant_DSRTMDLFCN_HEADER_ */
