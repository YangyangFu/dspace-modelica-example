/*********************** dSPACE target specific file *************************

   Header file ds_modelica_constant_dsrtvdf.h:

   Declaration of function that initializes the global TRC pointers

   4.3 (02-May-2020)
   Fri Oct  8 16:56:56 2021

   Copyright 2021, dSPACE GmbH. All rights reserved.

 *****************************************************************************/
#ifndef _DSRT_ds_modelica_constant_DSRTVDF_HEADER_
#define _DSRT_ds_modelica_constant_DSRTVDF_HEADER_

/* Include the model header file. */
#include "ds_modelica_constant.h"
#include "ds_modelica_constant_private.h"
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
EXTERN_C volatile real_T *p_0_ds_modelica_constant_real_T_0;
EXTERN_C volatile real_T *p_1_ds_modelica_constant_real_T_0;
EXTERN_C volatile real_T *p_2_ds_modelica_constant_real_T_0;

/*
 *  Declare the general function for TRC pointer initialization
 */
EXTERN_C void ds_modelica_constant_rti_init_trc_pointers(void);

#endif                          /* _DSRT_ds_modelica_constant_DSRTVDF_HEADER_ */
