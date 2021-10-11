/*********************** dSPACE target specific file *************************

   Include file ds_simple_twozone_dsrtmf.h:

   Definition of model functions.

   Mon Oct 11 17:55:19 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_simple_twozone_DSRTMF_HEADER_
#define _DSRT_ds_simple_twozone_DSRTMF_HEADER_
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

/* Model functions declarations */
#define ds_simple_twozone_dsrt_mdl_ApSimEngineOnInitIoPreRtosInit()
#define dsrt_mdl_timesync_simstate()
#define ds_simple_twozone_dsrt_mdl_ApSimEngineIdle()
#endif                              /* _DSRT_ds_simple_twozone_DSRTMF_HEADER_ */

/****** [EOF] ****************************************************************/
