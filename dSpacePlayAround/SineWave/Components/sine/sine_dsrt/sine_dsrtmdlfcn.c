/**************************************************************************** *
 * FILE :
 *  sine_dsrtmdlfcn.c
 *
 *
 *
 * Copyright 2017, dSPACE GmbH. All rights reserved
 *
   \****************************************************************************/

#ifndef TEMP_DSRT_RTI
#include <rtmodel.h>
#include "rtwtypes.h"
#include "sine_dsrtmdlfcn.h"
#include <stdio.h>

int32_T DSRTStopSimulation = 0;
EXTERN_C_DECL void sine_initialize();
EXTERN_C_DECL void sine_terminate();

/* Initialization of model */
void sine_DSRTInitMdl(void)
{
  /* Initialize model */
  sine_initialize();

  /* Check for initialization errors */
  sine_DSRTCheckForErrorStatus();

  /* Reinit Stop Simulation flag*/
  DSRTStopSimulation = 0;
}

/* Model start function */
void sine_DSRTStartMdl(void)
{
  uint8_T lastApplStateStopped;
  sine_APLastApplStateStopped(&lastApplStateStopped);
  if (lastApplStateStopped) {
    /* Reinit main simulation structure */
    sine_DSRTInitMdl();
  }
}

/* Model stop function */
void sine_DSRTStopMdl(void)
{
  /* Call terminate function */
  sine_terminate();

  /* Check for model error status */
  sine_DSRTCheckForErrorStatus();
}

/* Check for model error status */
void sine_DSRTCheckForErrorStatus()
{
  const char_T* errorStatus = rtmGetErrorStatus(sine_M);
  if (errorStatus != (char *) NULL && !strcmp(errorStatus, "Simulation finished"))
  {
    /* The RTM errorStatus field has been set */
    sine_APTerminateSimulation();
    sine_APPrintMessage("Model 'sine' has set error status:");
    sine_APPrintMessage(errorStatus);
  }
}

/* Check for simulation stop conditions */
void sine_DSRTCheckForSimulationStopCondition(void)
{
  const char_T* errorStatus = rtmGetErrorStatus(sine_M);
  if (errorStatus != (char *) NULL) {
    if (DSRTStopSimulation != 1) {
      /* The RTM errorStatus field has been set */
      sine_APTerminateSimulation();
      sine_APPrintMessage("Model 'sine' has set error status:");
      sine_APPrintMessage(errorStatus);
      DSRTStopSimulation = 1;
    }
  } else if (rtmGetStopRequested(sine_M)) {
    if (DSRTStopSimulation != 1) {
      sine_APStopSimulation();
      sine_APPrintMessage("Model 'sine': A Simulink Stop Simulation block or request has been executed.");
      DSRTStopSimulation = 1;
    }
  }
}

#endif
