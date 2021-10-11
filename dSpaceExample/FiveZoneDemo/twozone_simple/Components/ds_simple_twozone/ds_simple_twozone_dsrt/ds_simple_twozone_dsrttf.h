/*********************** dSPACE target specific file *************************

   Include file ds_simple_twozone_dsrttf.h:

   Extern declarations of task functions.

   Mon Oct 11 17:55:19 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_ds_simple_twozone_DSRTTF_HEADER_
#define _DSRT_ds_simple_twozone_DSRTTF_HEADER_
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

EXTERN_C void ds_simple_twozone_DSRTMdlOutputs0(void);
EXTERN_C void ds_simple_twozone_DSRTMdlUpdate0(void);

#endif                              /* _DSRT_ds_simple_twozone_DSRTTF_HEADER_ */
