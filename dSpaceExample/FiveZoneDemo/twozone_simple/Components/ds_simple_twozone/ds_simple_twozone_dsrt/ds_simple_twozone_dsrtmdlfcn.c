/**************************************************************************** *
 * FILE :
 *  ds_simple_twozone_dsrtmdlfcn.c
 *
 *
 *
 * Copyright 2017, dSPACE GmbH. All rights reserved
 *
   \****************************************************************************/

#ifndef TEMP_DSRT_RTI
#include <rtmodel.h>
#include "rtwtypes.h"
#include "ds_simple_twozone_dsrtmdlfcn.h"
#include <stdio.h>

int32_T DSRTStopSimulation = 0;
EXTERN_C_DECL void ds_simple_twozone_initialize();
EXTERN_C_DECL void ds_simple_twozone_terminate();

/* Initialization of model */
void ds_simple_twozone_DSRTInitMdl(void)
{
  /* Initialize model */
  ds_simple_twozone_initialize();

  /* Check for initialization errors */
  ds_simple_twozone_DSRTCheckForErrorStatus();

  /* Reinit Stop Simulation flag*/
  DSRTStopSimulation = 0;
}

/* Model start function */
void ds_simple_twozone_DSRTStartMdl(void)
{
  uint8_T lastApplStateStopped;
  ds_simple_twozone_APLastApplStateStopped(&lastApplStateStopped);
  if (lastApplStateStopped) {
    /* Reinit main simulation structure */
    ds_simple_twozone_DSRTInitMdl();
  }
}

/* Model stop function */
void ds_simple_twozone_DSRTStopMdl(void)
{
  /* Call terminate function */
  ds_simple_twozone_terminate();

  /* Check for model error status */
  ds_simple_twozone_DSRTCheckForErrorStatus();
}

/* Check for model error status */
void ds_simple_twozone_DSRTCheckForErrorStatus()
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_simple_twozone_M);
  if (errorStatus != (char *) NULL && !strcmp(errorStatus, "Simulation finished"))
  {
    /* The RTM errorStatus field has been set */
    ds_simple_twozone_APTerminateSimulation();
    ds_simple_twozone_APPrintMessage(
      "Model 'ds_simple_twozone' has set error status:");
    ds_simple_twozone_APPrintMessage(errorStatus);
  }
}

/* Check for simulation stop conditions */
void ds_simple_twozone_DSRTCheckForSimulationStopCondition(void)
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_simple_twozone_M);
  if (errorStatus != (char *) NULL) {
    if (DSRTStopSimulation != 1) {
      /* The RTM errorStatus field has been set */
      ds_simple_twozone_APTerminateSimulation();
      ds_simple_twozone_APPrintMessage(
        "Model 'ds_simple_twozone' has set error status:");
      ds_simple_twozone_APPrintMessage(errorStatus);
      DSRTStopSimulation = 1;
    }
  } else if (rtmGetStopRequested(ds_simple_twozone_M)) {
    if (DSRTStopSimulation != 1) {
      ds_simple_twozone_APStopSimulation();
      ds_simple_twozone_APPrintMessage(
        "Model 'ds_simple_twozone': A Simulink Stop Simulation block or request has been executed.");
      DSRTStopSimulation = 1;
    }
  }
}

#endif
