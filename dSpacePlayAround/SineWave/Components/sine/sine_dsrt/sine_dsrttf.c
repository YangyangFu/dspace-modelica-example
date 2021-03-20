/*****************************************************************************

   Include file sine_dsrttf.c:

   Definition of task functions.

   Sat Mar 20 17:34:40 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header files */
#include "sine_dsrttf.h"
#include "sine.h"
#include "sine_private.h"

/* Task function for TID0 */
void sine_DSRTMdlOutputs0()
{
  /* Call to Simulink model output function */
  sine_output();
}

void sine_DSRTMdlUpdate0()
{
  /* Call to Simulink model upadte function */
  sine_update();
}
