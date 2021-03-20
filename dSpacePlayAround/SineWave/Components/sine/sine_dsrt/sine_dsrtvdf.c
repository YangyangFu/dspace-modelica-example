/***************************************************************************

   Source file sine_dsrtvdf.c:

   Definition of function that initializes the global TRC pointers

   4.3 (02-May-2020)
   Sat Mar 20 17:34:40 2021

   Copyright 2021, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header file. */
#include "sine_dsrtvdf.h"
#include "sine.h"
#include "sine_private.h"

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
volatile real_T *p_0_sine_real_T_0 = NULL;
volatile real_T *p_1_sine_real_T_0 = NULL;
volatile real_T *p_2_sine_real_T_0 = NULL;
volatile int32_T *p_2_sine_int32_T_1 = NULL;

/*
 *  Declare the functions, that initially assign TRC pointers
 */
static void rti_init_trc_pointers_0(void);

/* Global pointers to data type transitions are separated in different functions to avoid overloading */
static void rti_init_trc_pointers_0(void)
{
  p_0_sine_real_T_0 = &sine_B.sine_o;
  p_1_sine_real_T_0 = &sine_P.sine_Amp;
  p_2_sine_real_T_0 = &sine_DW.lastSin;
  p_2_sine_int32_T_1 = &sine_DW.systemEnable;
}

void sine_rti_init_trc_pointers(void)
{
  rti_init_trc_pointers_0();
}
