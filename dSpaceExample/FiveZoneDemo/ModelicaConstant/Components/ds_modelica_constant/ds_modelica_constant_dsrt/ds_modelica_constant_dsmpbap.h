/*********************** dSPACE target specific header file ********************
   Include file ds_modelica_constant_dsmpbap.h:

   Definitions used for access points

   Fri Oct  8 16:56:56 2021

   (c) Copyright 2020, dSPACE GmbH. All rights reserved.

 *******************************************************************************/

#ifndef _DSMPB_ds_modelica_constant_HEADER_
#define _DSMPB_ds_modelica_constant_HEADER_
#include "rtwtypes.h"
#ifdef EXTERN_C
#undef EXTERN_C
#endif

#ifdef __cplusplus
#define EXTERN_C                       extern "C"
#else
#define EXTERN_C                       extern
#endif

/* External declarations for access points prototypes */

/*                                                                            */
/* Declarations of read/write and trigger access points                       */
/*                                                                            */
/* Write access point of block ds_modelica_constant/output/y, non-bus port 1 */
EXTERN_C void ap_write_ds_modelica_constant_DataOutport1_P1_S1(real_T
  * InputPortSignalPtr);

/*                                                                            */
/* Declarations of function module access points                              */
/*                                                                            */
/* Function module access point of system <Root>    */
EXTERN_C void ap_entry_ds_modelica_constant_SIDRoot_TID1();
EXTERN_C void ap_exit_ds_modelica_constant_SIDRoot_TID1();

#ifdef HAVE_ds_modelica_constant_DSMPBAP_CUSTOM
#include "ds_modelica_constant_dsmpbap_custom.h"
#endif
#endif
