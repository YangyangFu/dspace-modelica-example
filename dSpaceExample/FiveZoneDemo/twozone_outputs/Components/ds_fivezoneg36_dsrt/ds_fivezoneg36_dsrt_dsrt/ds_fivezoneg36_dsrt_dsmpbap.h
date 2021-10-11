/*********************** dSPACE target specific header file ********************
   Include file ds_fivezoneg36_dsrt_dsmpbap.h:

   Definitions used for access points

   Wed Oct  6 14:22:41 2021

   (c) Copyright 2020, dSPACE GmbH. All rights reserved.

 *******************************************************************************/

#ifndef _DSMPB_ds_fivezoneg36_dsrt_HEADER_
#define _DSMPB_ds_fivezoneg36_dsrt_HEADER_
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
/* Write access point of block ds_fivezoneg36_dsrt/outputs/TRooCor, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport1_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/TRooSou, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport2_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/TDisCor, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport3_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/TDisSou, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport4_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/fanOnSta, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport5_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/VFloCor, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport6_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/VFloSou, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport7_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_fivezoneg36_dsrt/outputs/TOut, non-bus port 1 */
EXTERN_C void ap_write_ds_fivezoneg36_dsrt_DataOutport8_P1_S1(real_T
  * InputPortSignalPtr);

/*                                                                            */
/* Declarations of function module access points                              */
/*                                                                            */
/* Function module access point of system <Root>    */
EXTERN_C void ap_entry_ds_fivezoneg36_dsrt_SIDRoot_TID1();
EXTERN_C void ap_exit_ds_fivezoneg36_dsrt_SIDRoot_TID1();

#ifdef HAVE_ds_fivezoneg36_dsrt_DSMPBAP_CUSTOM
#include "ds_fivezoneg36_dsrt_dsmpbap_custom.h"
#endif
#endif
