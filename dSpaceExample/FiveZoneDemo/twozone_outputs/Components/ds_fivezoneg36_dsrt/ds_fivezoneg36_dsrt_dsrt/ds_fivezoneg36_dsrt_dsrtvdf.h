/*********************** dSPACE target specific file *************************

   Header file ds_fivezoneg36_dsrt_dsrtvdf.h:

   Declaration of function that initializes the global TRC pointers

   4.3 (02-May-2020)
   Wed Oct  6 14:22:41 2021

   Copyright 2021, dSPACE GmbH. All rights reserved.

 *****************************************************************************/
#ifndef _DSRT_ds_fivezoneg36_dsrt_DSRTVDF_HEADER_
#define _DSRT_ds_fivezoneg36_dsrt_DSRTVDF_HEADER_

/* Include the model header file. */
#include "ds_fivezoneg36_dsrt.h"
#include "ds_fivezoneg36_dsrt_private.h"
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
EXTERN_C volatile real_T *p_0_ds_fivezoneg36_dsrt_real_T_0;
EXTERN_C volatile real_T *p_1_ds_fivezoneg36_dsrt_real_T_0;
EXTERN_C volatile real_T *p_2_ds_fivezoneg36_dsrt_real_T_0;

/*
 *  Declare the general function for TRC pointer initialization
 */
EXTERN_C void ds_fivezoneg36_dsrt_rti_init_trc_pointers(void);

#endif                           /* _DSRT_ds_fivezoneg36_dsrt_DSRTVDF_HEADER_ */
