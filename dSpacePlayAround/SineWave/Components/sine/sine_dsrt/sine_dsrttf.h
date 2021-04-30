/*********************** dSPACE target specific file *************************

   Include file sine_dsrttf.h:

   Extern declarations of task functions.

   Fri Mar 26 18:27:01 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

#ifndef _DSRT_sine_DSRTTF_HEADER_
#define _DSRT_sine_DSRTTF_HEADER_
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

EXTERN_C void sine_DSRTMdlOutputs0(void);
EXTERN_C void sine_DSRTMdlUpdate0(void);

#endif                                 /* _DSRT_sine_DSRTTF_HEADER_ */
