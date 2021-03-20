/****************************************************************************\ 
 *** 
 *** File                  : rtosal_taskap.cpp
 *** 
 *** Generated by dSPACE Tools.
 *** (c) Copyright 2013, dSPACE GmbH. All rights reserved.
\****************************************************************************/

#if !defined(RTOSAL_TASKAP_CPP_)
#  define    RTOSAL_TASKAP_CPP_


/* -- Include directives. -- */
#  include "rtosal_task.h"
#  include "IOCode_Data.h"
#  include "rtosal_taskap.h"

#  if defined(EXTERN_C_DECL)
#    undef EXTERN_C_DECL
#  endif
#  if defined(__cplusplus)
#    define EXTERN_C_DECL extern "C"
#  else
#    define EXTERN_C_DECL extern
#  endif


/* -- Declarations of extern functions. -- */

 EXTERN_C_DECL void sine_DSRTCheckForSimulationStopCondition(
    void);

/* -- Definitions of exported functions. -- */

  void
RtosAlTask_01_TaskEntry(
    void) 
{

}

  void
RtosAlTask_01_TaskExit(
    void) 
{
sine_DSRTCheckForSimulationStopCondition();

    /* Update task simulation time */
    StepCounter_Periodic_Task_1++;
    RtosAlTaskSimTime_Periodic_Task_1 = StepCounter_Periodic_Task_1*0.001;

}

#endif                                 /* RTOSAL_TASKAP_CPP_ */
/* [EOF] */
