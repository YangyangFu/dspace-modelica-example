/*****************************************************************************

   Include file ds_modelica_constant_dsrttf.c:

   Definition of task functions.

   Fri Oct  8 16:56:56 2021

   Copyright 2019, dSPACE GmbH. All rights reserved.

 *****************************************************************************/

/* Include header files */
#include "ds_modelica_constant_dsrttf.h"
#include "ds_modelica_constant.h"
#include "ds_modelica_constant_private.h"

/* Task function for TID0 */
void ds_modelica_constant_DSRTMdlOutputs0()
{
  /* Call to Simulink model output function */
  ds_modelica_constant_output();
}

void ds_modelica_constant_DSRTMdlUpdate0()
{
  /* Call to Simulink model upadte function */
  ds_modelica_constant_update();
}
