/****************************************************************************\ 
 *** 
 *** File                  : rtosal_task.cpp
 *** 
 *** Generated by dSPACE Tools.
 *** (c) Copyright 2013, dSPACE GmbH. All rights reserved.
\****************************************************************************/

#if !defined(RTOSAL_TASK_CPP_)
#  define    RTOSAL_TASK_CPP_


/* -- Include directives. -- */
#  include <DsApplicationInterface.h>
#  include "dssimengine_api.h"
#  include "rtosal_msg.h"
#  include "rtosal_taskap.h"
#  include "IOCode_Data.h"
#  include <dsrtt.h>
#  include "rtosal_task.h"

#  if defined(EXTERN_C_DECL)
#    undef EXTERN_C_DECL
#  endif
#  if defined(__cplusplus)
#    define EXTERN_C_DECL extern "C"
#  else
#    define EXTERN_C_DECL extern
#  endif


/* -- Defines and directives in module scope. After include directives. -- */
DS_DEFINE_TASK(DsCRtosAlPeriodic_Task_1);

/* -- Variable declarations in module scope. -- */
DsCTask* pRtosAlPeriodic_Task_1 = 0;
DsCTimer* pRtosAlTimer_Periodic_Task_1 = 0;

/* Task simulation time variable */
Float64 RtosAlTaskSimTime_Periodic_Task_1 = 0;
ULong64 StepCounter_Periodic_Task_1 = 0;

/* -- Declarations of extern functions. -- */

 EXTERN_C_DECL void sine_DSRTMdlOutputs0(
    void);

 EXTERN_C_DECL void sine_DSRTMdlUpdate0(
    void);

/* -- Declarations of module local functions. -- */

  void RtosAlHandleOverruns(
    DsCTask* pTask, int numberOfAcceptedOverruns);

/* -- Definitions of exported functions. -- */

  void
RtosAlDefaultDeadlineViolationHandler(
    DsTErrorList ErrorList, DsCTask* pTask) 
{
    SimEngineApplStop();
    DsCApplication* pAppl = SimEngineApplGet();
    char CallCounterStr[32];
    snprintf(CallCounterStr, 32, "%llu", pTask->getCallCounter());
    pAppl->errorMessage(RTOSAL_DEADLINE_VIOLATION, "%s%s%s", "sine", pTask->getDescription(), CallCounterStr);

}

/* -- Definitions of module local functions. -- */

  void
DsCRtosAlPeriodic_Task_1::onRun(
    DsTErrorList ErrorList) 
{
    RtosAlTask_01_TaskEntry();

    DS_MODEL_ACCESS_WRITE(1,pRtosAlPeriodic_Task_1);
    dsrtt_script_service_pre_computation();
    sine_DSRTMdlOutputs0();
    pRtosAlPeriodic_Task_1->daqService(1);

    DS_MODEL_ACCESS_READ(1,pRtosAlPeriodic_Task_1);
    dsrtt_script_service_post_computation();
    sine_DSRTMdlUpdate0();
    RtosAlTask_01_TaskExit();

}

  void
DsCRtosAlPeriodic_Task_1::onOverrun(
    DsTErrorList ErrorList) 
{
    DsCTask* pTask = DsCRtosAlPeriodic_Task_1::getInstance();
    RtosAlHandleOverruns(pTask, 0);

}

  void
RtosAlHandleOverruns(
    DsCTask* pTask, int numberOfAcceptedOverruns) 
{
    /* Value -1 of numberOfAcceptedOverruns represents positive infinity */ 
    if (numberOfAcceptedOverruns < 0)
    {
        return;
    }
    if (pTask->getOverrunCounter() > (unsigned int)numberOfAcceptedOverruns)
    {
        SimEngineApplStop();
        DsCApplication* pAppl = SimEngineApplGet();
        char CallCounterStr[32];
        snprintf(CallCounterStr, 32, "%llu", pTask->getCallCounter());
        pAppl->errorMessage(RTOSAL_TASK_OVERRUN, "%s%s%s%d", "sine", pTask->getDescription(), CallCounterStr, numberOfAcceptedOverruns);
    }

}

#endif                                 /* RTOSAL_TASK_CPP_ */
/* [EOF] */