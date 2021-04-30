/*********************** dSPACE target specific file *************************

   Include file sine_dsrtmf.h:

   Definition of model functions.

   Fri Mar 26 18:27:01 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_sine_DSRTMF_HEADER_
#define _DSRT_sine_DSRTMF_HEADER_
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

/* Model functions declarations */
#define sine_dsrt_mdl_ApSimEngineOnInitIoPreRtosInit()
#define dsrt_mdl_timesync_simstate()
#define sine_dsrt_mdl_ApSimEngineIdle()
#endif                                 /* _DSRT_sine_DSRTMF_HEADER_ */

/****** [EOF] ****************************************************************/
