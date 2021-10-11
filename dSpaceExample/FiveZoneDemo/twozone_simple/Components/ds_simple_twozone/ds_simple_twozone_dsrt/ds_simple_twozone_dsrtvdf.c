/***************************************************************************

   Source file ds_simple_twozone_dsrtvdf.c:

   Definition of function that initializes the global TRC pointers

   4.3 (02-May-2020)
   Mon Oct 11 17:55:19 2021

   Copyright 2021, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header file. */
#include "ds_simple_twozone_dsrtvdf.h"
#include "ds_simple_twozone.h"
#include "ds_simple_twozone_private.h"

/* Compiler options to turn off optimization. */
#if !defined(DS_OPTIMIZE_INIT_TRC_POINTERS)
#ifdef _MCCPPC

#pragma options -nOt -nOr -nOi -nOx

#endif

#ifdef __GNUC__

#pragma GCC optimize ("O0")

#endif

#ifdef _MSC_VER

#pragma optimize ("", off)

#endif
#endif

/* Definition of Global pointers to data type transitions (for TRC-file access) */
volatile real_T *p_0_ds_simple_twozone_real_T_0 = NULL;
volatile real_T *p_1_ds_simple_twozone_real_T_0 = NULL;
volatile real_T *p_2_ds_simple_twozone_real_T_0 = NULL;

/*
 *  Declare the functions, that initially assign TRC pointers
 */
static void rti_init_trc_pointers_0(void);

/* Global pointers to data type transitions are separated in different functions to avoid overloading */
static void rti_init_trc_pointers_0(void)
{
  p_0_ds_simple_twozone_real_T_0 = &ds_simple_twozone_B.Constant;
  p_1_ds_simple_twozone_real_T_0 = &ds_simple_twozone_P.TRoo1FtoV_xmax;
  p_2_ds_simple_twozone_real_T_0 = &ds_simple_twozone_DW.Sfunc_DSTATE;
}

void ds_simple_twozone_rti_init_trc_pointers(void)
{
  rti_init_trc_pointers_0();
}
