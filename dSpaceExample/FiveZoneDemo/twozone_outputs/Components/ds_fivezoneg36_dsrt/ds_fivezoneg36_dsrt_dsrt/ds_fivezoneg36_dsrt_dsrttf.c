/*****************************************************************************

   Include file ds_fivezoneg36_dsrt_dsrttf.c:

   Definition of task functions.

   Wed Oct  6 14:22:41 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header files */
#include "ds_fivezoneg36_dsrt_dsrttf.h"
#include "ds_fivezoneg36_dsrt.h"
#include "ds_fivezoneg36_dsrt_private.h"

/* Task function for TID0 */
void ds_fivezoneg36_dsrt_DSRTMdlOutputs0()
{
  /* Call to Simulink model output function */
  ds_fivezoneg36_dsrt_output();
}

void ds_fivezoneg36_dsrt_DSRTMdlUpdate0()
{
  /* Call to Simulink model upadte function */
  ds_fivezoneg36_dsrt_update();
}
