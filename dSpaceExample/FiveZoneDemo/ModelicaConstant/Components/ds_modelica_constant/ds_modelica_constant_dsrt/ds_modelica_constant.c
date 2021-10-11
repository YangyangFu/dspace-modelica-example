/*
 * ds_modelica_constant.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "ds_modelica_constant".
 *
 * Model version              : 1.4
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C source code generated on : Fri Oct  8 16:56:56 2021
 *
 * Target selection: dsrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Custom Processor->Custom
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ds_modelica_constant_dsrtvdf.h"
#include "ds_modelica_constant.h"
#include "ds_modelica_constant_private.h"

/* Block signals (default storage) */
B_ds_modelica_constant_T ds_modelica_constant_B;

/* Block states (default storage) */
DW_ds_modelica_constant_T ds_modelica_constant_DW;

/* Real-time model */
RT_MODEL_ds_modelica_constant_T ds_modelica_constant_M_;
RT_MODEL_ds_modelica_constant_T *const ds_modelica_constant_M =
  &ds_modelica_constant_M_;

/* Model output function */
void ds_modelica_constant_output(void)
{
  /* user code (Output function Body) */
  if (rtmIsMajorTimeStep(ds_modelica_constant_M)) {
    /* Function module access point of system <Root>    */
    ap_entry_ds_modelica_constant_SIDRoot_TID1();
  }

  /* S-Function (dspaceexample_t_dy2600gstg0): '<S3>/Sfunc' */

  /* Level2 S-Function Block: '<S3>/Sfunc' (dspaceexample_t_dy2600gstg0) */
  {
    SimStruct *rts = ds_modelica_constant_M->childSfunctions[0];
    sfcnOutputs(rts,0);
  }

  /* S-Function (dsmpb_dataoutport): '<S4>/Data Outport S-Fcn' */

  /* Write access point of block ds_modelica_constant/output/y non-bus port 1 */
  ap_write_ds_modelica_constant_DataOutport1_P1_S1(&ds_modelica_constant_B.Sfunc);

  /* user code (Output function Trailer) */
  if (rtmIsMajorTimeStep(ds_modelica_constant_M)) {
    /* Function module access point of system <Root>    */
    ap_exit_ds_modelica_constant_SIDRoot_TID1();
  }
}

/* Model update function */
void ds_modelica_constant_update(void)
{
  /* Update for S-Function (dspaceexample_t_dy2600gstg0): '<S3>/Sfunc' */
  /* Level2 S-Function Block: '<S3>/Sfunc' (dspaceexample_t_dy2600gstg0) */
  {
    SimStruct *rts = ds_modelica_constant_M->childSfunctions[0];
    sfcnUpdate(rts,0);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++ds_modelica_constant_M->Timing.clockTick0)) {
    ++ds_modelica_constant_M->Timing.clockTickH0;
  }

  ds_modelica_constant_M->Timing.t[0] =
    ds_modelica_constant_M->Timing.clockTick0 *
    ds_modelica_constant_M->Timing.stepSize0 +
    ds_modelica_constant_M->Timing.clockTickH0 *
    ds_modelica_constant_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.001, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    ds_modelica_constant_M->Timing.clockTick1++;
    if (!ds_modelica_constant_M->Timing.clockTick1) {
      ds_modelica_constant_M->Timing.clockTickH1++;
    }
  }
}

/* Model initialize function */
void ds_modelica_constant_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)ds_modelica_constant_M, 0,
                sizeof(RT_MODEL_ds_modelica_constant_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&ds_modelica_constant_M->solverInfo,
                          &ds_modelica_constant_M->Timing.simTimeStep);
    rtsiSetTPtr(&ds_modelica_constant_M->solverInfo, &rtmGetTPtr
                (ds_modelica_constant_M));
    rtsiSetStepSizePtr(&ds_modelica_constant_M->solverInfo,
                       &ds_modelica_constant_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&ds_modelica_constant_M->solverInfo,
                          (&rtmGetErrorStatus(ds_modelica_constant_M)));
    rtsiSetRTModelPtr(&ds_modelica_constant_M->solverInfo,
                      ds_modelica_constant_M);
  }

  rtsiSetSimTimeStep(&ds_modelica_constant_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&ds_modelica_constant_M->solverInfo,"FixedStepDiscrete");
  ds_modelica_constant_M->solverInfoPtr = (&ds_modelica_constant_M->solverInfo);

  /* Initialize timing info */
  {
    int_T *mdlTsMap = ds_modelica_constant_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    ds_modelica_constant_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    ds_modelica_constant_M->Timing.sampleTimes =
      (&ds_modelica_constant_M->Timing.sampleTimesArray[0]);
    ds_modelica_constant_M->Timing.offsetTimes =
      (&ds_modelica_constant_M->Timing.offsetTimesArray[0]);

    /* task periods */
    ds_modelica_constant_M->Timing.sampleTimes[0] = (0.0);
    ds_modelica_constant_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
    ds_modelica_constant_M->Timing.offsetTimes[0] = (0.0);
    ds_modelica_constant_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(ds_modelica_constant_M, &ds_modelica_constant_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = ds_modelica_constant_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    ds_modelica_constant_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(ds_modelica_constant_M, -1);
  ds_modelica_constant_M->Timing.stepSize0 = 0.001;
  ds_modelica_constant_M->solverInfoPtr = (&ds_modelica_constant_M->solverInfo);
  ds_modelica_constant_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&ds_modelica_constant_M->solverInfo, 0.001);
  rtsiSetSolverMode(&ds_modelica_constant_M->solverInfo,
                    SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &ds_modelica_constant_B), 0,
                sizeof(B_ds_modelica_constant_T));

  /* states (dwork) */
  (void) memset((void *)&ds_modelica_constant_DW, 0,
                sizeof(DW_ds_modelica_constant_T));

  /* child S-Function registration */
  {
    RTWSfcnInfo *sfcnInfo = &ds_modelica_constant_M->NonInlinedSFcns.sfcnInfo;
    ds_modelica_constant_M->sfcnInfo = (sfcnInfo);
    rtssSetErrorStatusPtr(sfcnInfo, (&rtmGetErrorStatus(ds_modelica_constant_M)));
    rtssSetNumRootSampTimesPtr(sfcnInfo,
      &ds_modelica_constant_M->Sizes.numSampTimes);
    ds_modelica_constant_M->NonInlinedSFcns.taskTimePtrs[0] = &(rtmGetTPtr
      (ds_modelica_constant_M)[0]);
    ds_modelica_constant_M->NonInlinedSFcns.taskTimePtrs[1] = &(rtmGetTPtr
      (ds_modelica_constant_M)[1]);
    rtssSetTPtrPtr(sfcnInfo,ds_modelica_constant_M->NonInlinedSFcns.taskTimePtrs);
    rtssSetTStartPtr(sfcnInfo, &rtmGetTStart(ds_modelica_constant_M));
    rtssSetTFinalPtr(sfcnInfo, &rtmGetTFinal(ds_modelica_constant_M));
    rtssSetTimeOfLastOutputPtr(sfcnInfo, &rtmGetTimeOfLastOutput
      (ds_modelica_constant_M));
    rtssSetStepSizePtr(sfcnInfo, &ds_modelica_constant_M->Timing.stepSize);
    rtssSetStopRequestedPtr(sfcnInfo, &rtmGetStopRequested
      (ds_modelica_constant_M));
    rtssSetDerivCacheNeedsResetPtr(sfcnInfo,
      &ds_modelica_constant_M->derivCacheNeedsReset);
    rtssSetZCCacheNeedsResetPtr(sfcnInfo,
      &ds_modelica_constant_M->zCCacheNeedsReset);
    rtssSetContTimeOutputInconsistentWithStateAtMajorStepPtr(sfcnInfo,
      &ds_modelica_constant_M->CTOutputIncnstWithState);
    rtssSetSampleHitsPtr(sfcnInfo, &ds_modelica_constant_M->Timing.sampleHits);
    rtssSetPerTaskSampleHitsPtr(sfcnInfo,
      &ds_modelica_constant_M->Timing.perTaskSampleHits);
    rtssSetSimModePtr(sfcnInfo, &ds_modelica_constant_M->simMode);
    rtssSetSolverInfoPtr(sfcnInfo, &ds_modelica_constant_M->solverInfoPtr);
  }

  ds_modelica_constant_M->Sizes.numSFcns = (1);

  /* register each child */
  {
    (void) memset((void *)
                  &ds_modelica_constant_M->NonInlinedSFcns.childSFunctions[0], 0,
                  1*sizeof(SimStruct));
    ds_modelica_constant_M->childSfunctions =
      (&ds_modelica_constant_M->NonInlinedSFcns.childSFunctionPtrs[0]);
    ds_modelica_constant_M->childSfunctions[0] =
      (&ds_modelica_constant_M->NonInlinedSFcns.childSFunctions[0]);

    /* Level2 S-Function Block: ds_modelica_constant/<S3>/Sfunc (dspaceexample_t_dy2600gstg0) */
    {
      SimStruct *rts = ds_modelica_constant_M->childSfunctions[0];

      /* timing info */
      time_T *sfcnPeriod =
        ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.sfcnPeriod;
      time_T *sfcnOffset =
        ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.sfcnOffset;
      int_T *sfcnTsMap = ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.sfcnTsMap;
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);

      {
        ssSetBlkInfo2Ptr(rts, &ds_modelica_constant_M->NonInlinedSFcns.blkInfo2
                         [0]);
      }

      _ssSetBlkInfo2PortInfo2Ptr(rts,
        &ds_modelica_constant_M->NonInlinedSFcns.inputOutputPortInfo2[0]);

      /* Set up the mdlInfo pointer */
      ssSetRTWSfcnInfo(rts, ds_modelica_constant_M->sfcnInfo);

      /* Allocate memory of model methods 2 */
      {
        ssSetModelMethods2(rts,
                           &ds_modelica_constant_M->NonInlinedSFcns.methods2[0]);
      }

      /* Allocate memory of model methods 3 */
      {
        ssSetModelMethods3(rts,
                           &ds_modelica_constant_M->NonInlinedSFcns.methods3[0]);
      }

      /* Allocate memory of model methods 4 */
      {
        ssSetModelMethods4(rts,
                           &ds_modelica_constant_M->NonInlinedSFcns.methods4[0]);
      }

      /* Allocate memory for states auxilliary information */
      {
        ssSetStatesInfo2(rts,
                         &ds_modelica_constant_M->NonInlinedSFcns.statesInfo2[0]);
        ssSetPeriodicStatesInfo(rts,
          &ds_modelica_constant_M->NonInlinedSFcns.periodicStatesInfo[0]);
      }

      /* outputs */
      {
        ssSetPortInfoForOutputs(rts,
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);
        _ssSetPortInfo2ForOutputUnits(rts,
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.outputPortUnits[0]);
        ssSetOutputPortUnit(rts, 0, 0);
        _ssSetPortInfo2ForOutputCoSimAttribute(rts,
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.outputPortCoSimAttribute
          [0]);
        ssSetOutputPortIsContinuousQuantity(rts, 0, 0);

        /* port 0 */
        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 1);
          ssSetOutputPortSignal(rts, 0, ((real_T *)
            &ds_modelica_constant_B.Sfunc));
        }
      }

      /* path info */
      ssSetModelName(rts, "Sfunc");
      ssSetPath(rts, "ds_modelica_constant/behavior/behavior/Sfunc");
      ssSetRTModel(rts,ds_modelica_constant_M);
      ssSetParentSS(rts, (NULL));
      ssSetRootSS(rts, rts);
      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      /* parameters */
      {
        mxArray **sfcnParams = (mxArray **)
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.params;
        ssSetSFcnParamsCount(rts, 2);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)ds_modelica_constant_P.Sfunc_P1_Size);
        ssSetSFcnParam(rts, 1, (mxArray*)ds_modelica_constant_P.Sfunc_P2_Size);
      }

      /* work vectors */
      ssSetRWork(rts, (real_T *) &ds_modelica_constant_DW.Sfunc_RWORK[0]);
      ssSetPWork(rts, (void **) &ds_modelica_constant_DW.Sfunc_PWORK);

      {
        struct _ssDWorkRecord *dWorkRecord = (struct _ssDWorkRecord *)
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.dWork;
        struct _ssDWorkAuxRecord *dWorkAuxRecord = (struct _ssDWorkAuxRecord *)
          &ds_modelica_constant_M->NonInlinedSFcns.Sfcn0.dWorkAux;
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 2);

        /* RWORK */
        ssSetDWorkWidth(rts, 0, 14);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWork(rts, 0, &ds_modelica_constant_DW.Sfunc_RWORK[0]);

        /* PWORK */
        ssSetDWorkWidth(rts, 1, 1);
        ssSetDWorkDataType(rts, 1,SS_POINTER);
        ssSetDWorkComplexSignal(rts, 1, 0);
        ssSetDWork(rts, 1, &ds_modelica_constant_DW.Sfunc_PWORK);
      }

      /* registration */
      dspaceexample_t_dy2600gstg0(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);

      /* adjust sample time */
      ssSetSampleTime(rts, 0, 0.0);
      ssSetOffsetTime(rts, 0, 0.0);
      sfcnTsMap[0] = 0;

      /* set compiled values of dynamic vector attributes */
      ssSetNumNonsampledZCs(rts, 0);

      /* Update connectivity flags for each port */
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);

      /* Update the BufferDstPort flags for each input port */
    }
  }

  {
    /* user code (registration function declaration) */
    /*Initialize global TRC pointers. */
    ds_modelica_constant_rti_init_trc_pointers();
  }

  /* InitializeConditions for S-Function (dspaceexample_t_dy2600gstg0): '<S3>/Sfunc' */
  /* Level2 S-Function Block: '<S3>/Sfunc' (dspaceexample_t_dy2600gstg0) */
  {
    SimStruct *rts = ds_modelica_constant_M->childSfunctions[0];
    sfcnInitializeConditions(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }
}

/* Model terminate function */
void ds_modelica_constant_terminate(void)
{
  /* Terminate for S-Function (dspaceexample_t_dy2600gstg0): '<S3>/Sfunc' */
  /* Level2 S-Function Block: '<S3>/Sfunc' (dspaceexample_t_dy2600gstg0) */
  {
    SimStruct *rts = ds_modelica_constant_M->childSfunctions[0];
    sfcnTerminate(rts);
  }
}
