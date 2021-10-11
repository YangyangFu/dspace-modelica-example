/**************************************************************************** *
 * FILE :
 *  ds_fivezoneg36_dsrt_dsrtmdlfcn.c
 *
 *
 *
 * Copyright 2017, dSPACE GmbH. All rights reserved
 *
   \****************************************************************************/

#ifndef TEMP_DSRT_RTI
#include <rtmodel.h>
#include "rtwtypes.h"
#include "ds_fivezoneg36_dsrt_dsrtmdlfcn.h"
#include <stdio.h>

int32_T DSRTStopSimulation = 0;
EXTERN_C_DECL void ds_fivezoneg36_dsrt_initialize();
EXTERN_C_DECL void ds_fivezoneg36_dsrt_terminate();

/* Initialization of model */
void ds_fivezoneg36_dsrt_DSRTInitMdl(void)
{
  /* Initialize model */
  ds_fivezoneg36_dsrt_initialize();

  /* Check for initialization errors */
  ds_fivezoneg36_dsrt_DSRTCheckForErrorStatus();

  /* Reinit Stop Simulation flag*/
  DSRTStopSimulation = 0;
}

/* Model start function */
void ds_fivezoneg36_dsrt_DSRTStartMdl(void)
{
  uint8_T lastApplStateStopped;
  ds_fivezoneg36_dsrt_APLastApplStateStopped(&lastApplStateStopped);
  if (lastApplStateStopped) {
    /* Reinit main simulation structure */
    ds_fivezoneg36_dsrt_DSRTInitMdl();
  }
}

/* Model stop function */
void ds_fivezoneg36_dsrt_DSRTStopMdl(void)
{
  /* Call terminate function */
  ds_fivezoneg36_dsrt_terminate();

  /* Check for model error status */
  ds_fivezoneg36_dsrt_DSRTCheckForErrorStatus();
}

/* Check for model error status */
void ds_fivezoneg36_dsrt_DSRTCheckForErrorStatus()
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_fivezoneg36_dsrt_M);
  if (errorStatus != (char *) NULL && !strcmp(errorStatus, "Simulation finished"))
  {
    /* The RTM errorStatus field has been set */
    ds_fivezoneg36_dsrt_APTerminateSimulation();
    ds_fivezoneg36_dsrt_APPrintMessage(
      "Model 'ds_fivezoneg36_dsrt' has set error status:");
    ds_fivezoneg36_dsrt_APPrintMessage(errorStatus);
  }
}

/* Check for simulation stop conditions */
void ds_fivezoneg36_dsrt_DSRTCheckForSimulationStopCondition(void)
{
  const char_T* errorStatus = rtmGetErrorStatus(ds_fivezoneg36_dsrt_M);
  if (errorStatus != (char *) NULL) {
    if (DSRTStopSimulation != 1) {
      /* The RTM errorStatus field has been set */
      ds_fivezoneg36_dsrt_APTerminateSimulation();
      ds_fivezoneg36_dsrt_APPrintMessage(
        "Model 'ds_fivezoneg36_dsrt' has set error status:");
      ds_fivezoneg36_dsrt_APPrintMessage(errorStatus);
      DSRTStopSimulation = 1;
    }
  } else if (rtmGetStopRequested(ds_fivezoneg36_dsrt_M)) {
    if (DSRTStopSimulation != 1) {
      ds_fivezoneg36_dsrt_APStopSimulation();
      ds_fivezoneg36_dsrt_APPrintMessage(
        "Model 'ds_fivezoneg36_dsrt': A Simulink Stop Simulation block or request has been executed.");
      DSRTStopSimulation = 1;
    }
  }
}

#endif
