/*********************** dSPACE target specific file *************************

   Header file sine_dsrtvdf.h:

   Declaration of function that initializes the global TRC pointers

   4.3 (02-May-2020)
   Sat Mar 20 17:34:40 2021

   Copyright 2021, dSPACE GmbH. All rights reserved.

 *****************************************************************************/
#ifndef _DSRT_sine_DSRTVDF_HEADER_
#define _DSRT_sine_DSRTVDF_HEADER_

/* Include the model header file. */
#include "sine.h"
#include "sine_private.h"
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

/*
 *  Declare the global TRC pointers
 */
EXTERN_C volatile real_T *p_0_sine_real_T_0;
EXTERN_C volatile real_T *p_1_sine_real_T_0;
EXTERN_C volatile real_T *p_2_sine_real_T_0;
EXTERN_C volatile int32_T *p_2_sine_int32_T_1;

/*
 *  Declare the general function for TRC pointer initialization
 */
EXTERN_C void sine_rti_init_trc_pointers(void);

#endif                                 /* _DSRT_sine_DSRTVDF_HEADER_ */
