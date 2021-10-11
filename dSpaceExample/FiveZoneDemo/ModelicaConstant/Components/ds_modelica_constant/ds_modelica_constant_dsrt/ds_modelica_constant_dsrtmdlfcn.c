/**************************************************************************** *
 * FILE :
 *  ds_modelica_constant_dsrtmdlfcn.c
 *
 *
 *
 * Copyright 2017, dSPACE GmbH. All rights reserved
 *
   \****************************************************************************/

#ifndef TEMP_DSRT_RTI
#include <rtmodel.h>
#include "rtwtypes.h"
#include "ds_modelica_constant_dsrtmdlfcn.h"
#include <stdio.h>

int32_T DSRTStopSimulation = 0;
EXTERN_C_DECL void ds_modelica_constant_initialize();
EXTERN_C_DECL void ds_modelica_constant_terminate();

/* Initialization of model */
void ds_modelica_constant_DSRTInitMdl(void)
{
  /* Initialize model */
  ds_modelica_constant_initialize();

  /* Check for initialization errors */
  ds_modelica_constant_DSRTCheckForErrorStatus();

  /* Reinit Stop Simulation flag*/
  DSRTStopSimulation = 0;
}

/* Model start function */
void ds_modelica_constant_DSRTStartMdl(void)
{
  uint8_T lastApplStateStopped;
  ds_modelica_constant_APLastApplStateStopped(&lastApplStateStopped);
  if (lastApplStateStopped) {
    /* Reinit main simulation structure */
    ds_modelica_constant_DSRTInitMdl();
  }
}

/* Model stop function */
void ds_modelica_constant_DSRTStopMdl(void)
{
  /* Call terminate function */
  ds_modelica_constant_terminate();

  /* Check for model error status */
  ds_modelica_constant_DSRTCheckForErrorStatus();
}

/* Check for model error status */
void ds_modelica_constant_DSRTCheckForErrorStatus()
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_modelica_constant_M);
  if (errorStatus != (char *) NULL && !strcmp(errorStatus, "Simulation finished"))
  {
    /* The RTM errorStatus field has been set */
    ds_modelica_constant_APTerminateSimulation();
    ds_modelica_constant_APPrintMessage(
      "Model 'ds_modelica_constant' has set error status:");
    ds_modelica_constant_APPrintMessage(errorStatus);
  }
}

/* Check for simulation stop conditions */
void ds_modelica_constant_DSRTCheckForSimulationStopCondition(void)
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_modelica_constant_M);
  if (errorStatus != (char *) NULL) {
    if (DSRTStopSimulation != 1) {
      /* The RTM errorStatus field has been set */
      ds_modelica_constant_APTerminateSimulation();
      ds_modelica_constant_APPrintMessage(
        "Model 'ds_modelica_constant' has set error status:");
      ds_modelica_constant_APPrintMessage(errorStatus);
      DSRTStopSimulation = 1;
    }
  } else if (rtmGetStopRequested(ds_modelica_constant_M)) {
    if (DSRTStopSimulation != 1) {
      ds_modelica_constant_APStopSimulation();
      ds_modelica_constant_APPrintMessage(
        "Model 'ds_modelica_constant': A Simulink Stop Simulation block or request has been executed.");
      DSRTStopSimulation = 1;
    }
  }
}

#endif
