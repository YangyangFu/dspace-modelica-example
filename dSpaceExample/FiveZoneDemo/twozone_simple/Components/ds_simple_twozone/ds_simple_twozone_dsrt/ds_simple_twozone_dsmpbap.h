/*********************** dSPACE target specific header file ********************
   Include file ds_simple_twozone_dsmpbap.h:

   Definitions used for access points

   Mon Oct 11 17:55:19 2021

   (c) Copyright 2020, dSPACE GmbH. All rights reserved.

 *******************************************************************************/

#ifndef _DSMPB_ds_simple_twozone_HEADER_
#define _DSMPB_ds_simple_twozone_HEADER_
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
/* Write access point of block ds_simple_twozone/outputs/TRooAir1, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport1_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/TRooAir2, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport2_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/TDis1, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport3_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/TDis2, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport4_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/VFlo1, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport5_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/VFlo2, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport6_P1_S1(real_T
  * InputPortSignalPtr);

/* Write access point of block ds_simple_twozone/outputs/TOut, non-bus port 1 */
EXTERN_C void ap_write_ds_simple_twozone_DataOutport7_P1_S1(real_T
  * InputPortSignalPtr);

/*                                                                            */
/* Declarations of function module access points                              */
/*                                                                            */
/* Function module access point of system <Root>    */
EXTERN_C void ap_entry_ds_simple_twozone_SIDRoot_TID1();
EXTERN_C void ap_exit_ds_simple_twozone_SIDRoot_TID1();

#ifdef HAVE_ds_simple_twozone_DSMPBAP_CUSTOM
#include "ds_simple_twozone_dsmpbap_custom.h"
#endif
#endif
