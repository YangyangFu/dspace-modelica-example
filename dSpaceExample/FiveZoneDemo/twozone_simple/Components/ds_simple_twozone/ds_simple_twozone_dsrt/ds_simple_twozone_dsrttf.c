/*****************************************************************************

   Include file ds_simple_twozone_dsrttf.c:

   Definition of task functions.

   Mon Oct 11 17:55:19 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header files */
#include "ds_simple_twozone_dsrttf.h"
#include "ds_simple_twozone.h"
#include "ds_simple_twozone_private.h"

/* Task function for TID0 */
void ds_simple_twozone_DSRTMdlOutputs0()
{
  /* Call to Simulink model output function */
  ds_simple_twozone_output();
}

void ds_simple_twozone_DSRTMdlUpdate0()
{
  /* Call to Simulink model upadte function */
  ds_simple_twozone_update();
}
