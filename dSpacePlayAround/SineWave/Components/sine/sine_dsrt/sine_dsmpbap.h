/*********************** dSPACE target specific header file ********************
   Include file sine_dsmpbap.h:

   Definitions used for access points

   Sat Mar 20 17:34:40 2021

   (c) Copyright 2020, dSPACE GmbH. All rights reserved.

 *******************************************************************************/

#ifndef _DSMPB_sine_HEADER_
#define _DSMPB_sine_HEADER_
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
/* Write access point of block sine/outputs/VoltageOut, non-bus port 1 */
EXTERN_C void ap_write_sine_DataOutport1_P1_S1(real_T* InputPortSignalPtr);

/*                                                                            */
/* Declarations of function module access points                              */
/*                                                                            */
/* Function module access point of system <Root>    */
EXTERN_C void ap_entry_sine_SIDRoot_TID0();
EXTERN_C void ap_exit_sine_SIDRoot_TID0();

#ifdef HAVE_sine_DSMPBAP_CUSTOM
#include "sine_dsmpbap_custom.h"
#endif
#endif
