/*
 * ds_simple_twozone.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "ds_simple_twozone".
 *
 * Model version              : 1.11
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C source code generated on : Mon Oct 11 17:55:19 2021
 *
 * Target selection: dsrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Custom Processor->Custom
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ds_simple_twozone_dsrtvdf.h"
#include "ds_simple_twozone.h"
#include "ds_simple_twozone_private.h"

/* Block signals (default storage) */
B_ds_simple_twozone_T ds_simple_twozone_B;

/* Block states (default storage) */
DW_ds_simple_twozone_T ds_simple_twozone_DW;

/* Real-time model */
RT_MODEL_ds_simple_twozone_T ds_simple_twozone_M_;
RT_MODEL_ds_simple_twozone_T *const ds_simple_twozone_M = &ds_simple_twozone_M_;
static void rate_scheduler(void);

/*
 *   This function updates active task flag for each subrate.
 * The function is called at model base rate, hence the
 * generated code self-manages all its subrates.
 */
static void rate_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (ds_simple_twozone_M->Timing.TaskCounters.TID[2])++;
  if ((ds_simple_twozone_M->Timing.TaskCounters.TID[2]) > 9) {/* Sample time: [0.01s, 0.0s] */
    ds_simple_twozone_M->Timing.TaskCounters.TID[2] = 0;
  }

  ds_simple_twozone_M->Timing.sampleHits[2] =
    (ds_simple_twozone_M->Timing.TaskCounters.TID[2] == 0);
}

/* Model output function */
void ds_simple_twozone_output(void)
{
  real_T tmp;

  /* user code (Output function Body) */
  if (rtmIsMajorTimeStep(ds_simple_twozone_M)) {
    /* Function module access point of system <Root>    */
    ap_entry_ds_simple_twozone_SIDRoot_TID1();
  }

  if (ds_simple_twozone_M->Timing.TaskCounters.TID[2] == 0) {
    /* Constant: '<S2>/Constant' */
    ds_simple_twozone_B.Constant = ds_simple_twozone_P.Constant_Value;

    /* Constant: '<S2>/Constant1' */
    ds_simple_twozone_B.Constant1 = ds_simple_twozone_P.Constant1_Value;
  }

  /* SignalConversion generated from: '<S4>/Sfunc' */
  ds_simple_twozone_B.TmpSignalConversionAtSfuncInpor[0] =
    ds_simple_twozone_B.Constant;
  ds_simple_twozone_B.TmpSignalConversionAtSfuncInpor[1] =
    ds_simple_twozone_B.Constant1;

  /* S-Function (dspaceexample_s_dy4854h2b34): '<S4>/Sfunc' */

  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_s_dy4854h2b34) */
  {
    SimStruct *rts = ds_simple_twozone_M->childSfunctions[0];
    sfcnOutputs(rts,0);
  }

  /* Sum: '<S5>/KtoC' incorporates:
   *  Constant: '<S5>/zerC'
   */
  ds_simple_twozone_B.KtoC = ds_simple_twozone_B.Sfunc[3] -
    ds_simple_twozone_P.zerC_Value;

  /* Gain: '<S5>/Gain' */
  ds_simple_twozone_B.Gain = ds_simple_twozone_P.Gain_Gain *
    ds_simple_twozone_B.KtoC;

  /* Bias: '<S5>/Bias' */
  ds_simple_twozone_B.Bias = ds_simple_twozone_B.Gain +
    ds_simple_twozone_P.Bias_Bias;

  /* Bias: '<S13>/Subtract min x' */
  tmp = -ds_simple_twozone_P.TRoo1FtoV_xmin;
  ds_simple_twozone_B.Subtractminx = ds_simple_twozone_B.Bias + tmp;

  /* Gain: '<S13>/range y // range x' */
  tmp = (ds_simple_twozone_P.TRoo1FtoV_ymax - ds_simple_twozone_P.TRoo1FtoV_ymin)
    / (ds_simple_twozone_P.TRoo1FtoV_xmax - ds_simple_twozone_P.TRoo1FtoV_xmin);
  ds_simple_twozone_B.rangeyrangex = tmp * ds_simple_twozone_B.Subtractminx;

  /* Bias: '<S13>/Add min y' */
  ds_simple_twozone_B.Addminy = ds_simple_twozone_B.rangeyrangex +
    ds_simple_twozone_P.TRoo1FtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S20>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/TRooAir1 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport1_P1_S1(&ds_simple_twozone_B.Addminy);

  /* Sum: '<S6>/KtoC' incorporates:
   *  Constant: '<S6>/zerC'
   */
  ds_simple_twozone_B.KtoC_o = ds_simple_twozone_B.Sfunc[2] -
    ds_simple_twozone_P.zerC_Value_n;

  /* Gain: '<S6>/Gain' */
  ds_simple_twozone_B.Gain_l = ds_simple_twozone_P.Gain_Gain_a *
    ds_simple_twozone_B.KtoC_o;

  /* Bias: '<S6>/Bias' */
  ds_simple_twozone_B.Bias_n = ds_simple_twozone_B.Gain_l +
    ds_simple_twozone_P.Bias_Bias_c;

  /* Bias: '<S14>/Subtract min x' */
  tmp = -ds_simple_twozone_P.TRoo2FtoV_xmin;
  ds_simple_twozone_B.Subtractminx_j = ds_simple_twozone_B.Bias_n + tmp;

  /* Gain: '<S14>/range y // range x' */
  tmp = (ds_simple_twozone_P.TRoo2FtoV_ymax - ds_simple_twozone_P.TRoo2FtoV_ymin)
    / (ds_simple_twozone_P.TRoo2FtoV_xmax - ds_simple_twozone_P.TRoo2FtoV_xmin);
  ds_simple_twozone_B.rangeyrangex_b = tmp * ds_simple_twozone_B.Subtractminx_j;

  /* Bias: '<S14>/Add min y' */
  ds_simple_twozone_B.Addminy_i = ds_simple_twozone_B.rangeyrangex_b +
    ds_simple_twozone_P.TRoo2FtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S21>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/TRooAir2 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport2_P1_S1(&ds_simple_twozone_B.Addminy_i);

  /* Sum: '<S7>/KtoC' incorporates:
   *  Constant: '<S7>/zerC'
   */
  ds_simple_twozone_B.KtoC_g = ds_simple_twozone_B.Sfunc[5] -
    ds_simple_twozone_P.zerC_Value_f;

  /* Gain: '<S7>/Gain' */
  ds_simple_twozone_B.Gain_p = ds_simple_twozone_P.Gain_Gain_c *
    ds_simple_twozone_B.KtoC_g;

  /* Bias: '<S7>/Bias' */
  ds_simple_twozone_B.Bias_i = ds_simple_twozone_B.Gain_p +
    ds_simple_twozone_P.Bias_Bias_d;

  /* Bias: '<S10>/Subtract min x' */
  tmp = -ds_simple_twozone_P.TDis1FtoV_xmin;
  ds_simple_twozone_B.Subtractminx_k = ds_simple_twozone_B.Bias_i + tmp;

  /* Gain: '<S10>/range y // range x' */
  tmp = (ds_simple_twozone_P.TDis1FtoV_ymax - ds_simple_twozone_P.TDis1FtoV_ymin)
    / (ds_simple_twozone_P.TDis1FtoV_xmax - ds_simple_twozone_P.TDis1FtoV_xmin);
  ds_simple_twozone_B.rangeyrangex_k = tmp * ds_simple_twozone_B.Subtractminx_k;

  /* Bias: '<S10>/Add min y' */
  ds_simple_twozone_B.Addminy_n = ds_simple_twozone_B.rangeyrangex_k +
    ds_simple_twozone_P.TDis1FtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S17>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/TDis1 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport3_P1_S1(&ds_simple_twozone_B.Addminy_n);

  /* Sum: '<S8>/KtoC' incorporates:
   *  Constant: '<S8>/zerC'
   */
  ds_simple_twozone_B.KtoC_a = ds_simple_twozone_B.Sfunc[4] -
    ds_simple_twozone_P.zerC_Value_k;

  /* Gain: '<S8>/Gain' */
  ds_simple_twozone_B.Gain_i = ds_simple_twozone_P.Gain_Gain_p *
    ds_simple_twozone_B.KtoC_a;

  /* Bias: '<S8>/Bias' */
  ds_simple_twozone_B.Bias_g = ds_simple_twozone_B.Gain_i +
    ds_simple_twozone_P.Bias_Bias_i;

  /* Bias: '<S11>/Subtract min x' */
  tmp = -ds_simple_twozone_P.TDis2FtoV_xmin;
  ds_simple_twozone_B.Subtractminx_p = ds_simple_twozone_B.Bias_g + tmp;

  /* Gain: '<S11>/range y // range x' */
  tmp = (ds_simple_twozone_P.TDis2FtoV_ymax - ds_simple_twozone_P.TDis2FtoV_ymin)
    / (ds_simple_twozone_P.TDis2FtoV_xmax - ds_simple_twozone_P.TDis2FtoV_xmin);
  ds_simple_twozone_B.rangeyrangex_j = tmp * ds_simple_twozone_B.Subtractminx_p;

  /* Bias: '<S11>/Add min y' */
  ds_simple_twozone_B.Addminy_m = ds_simple_twozone_B.rangeyrangex_j +
    ds_simple_twozone_P.TDis2FtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S18>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/TDis2 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport4_P1_S1(&ds_simple_twozone_B.Addminy_m);

  /* Gain: '<S1>/toCFM' */
  ds_simple_twozone_B.toCFM = ds_simple_twozone_P.toCFM_Gain *
    ds_simple_twozone_B.Sfunc[1];

  /* Bias: '<S15>/Subtract min x' */
  tmp = -ds_simple_twozone_P.VDis1ToV_xmin;
  ds_simple_twozone_B.Subtractminx_n = ds_simple_twozone_B.toCFM + tmp;

  /* Gain: '<S15>/range y // range x' */
  tmp = (ds_simple_twozone_P.VDis1ToV_ymax - ds_simple_twozone_P.VDis1ToV_ymin) /
    (ds_simple_twozone_P.VDis1ToV_xmax - ds_simple_twozone_P.VDis1ToV_xmin);
  ds_simple_twozone_B.rangeyrangex_je = tmp * ds_simple_twozone_B.Subtractminx_n;

  /* Bias: '<S15>/Add min y' */
  ds_simple_twozone_B.Addminy_b = ds_simple_twozone_B.rangeyrangex_je +
    ds_simple_twozone_P.VDis1ToV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S22>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/VFlo1 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport5_P1_S1(&ds_simple_twozone_B.Addminy_b);

  /* Gain: '<S1>/toCFM1' */
  ds_simple_twozone_B.toCFM1 = ds_simple_twozone_P.toCFM1_Gain *
    ds_simple_twozone_B.Sfunc[0];

  /* Bias: '<S16>/Subtract min x' */
  tmp = -ds_simple_twozone_P.VDis2ToV_xmin;
  ds_simple_twozone_B.Subtractminx_m = ds_simple_twozone_B.toCFM1 + tmp;

  /* Gain: '<S16>/range y // range x' */
  tmp = (ds_simple_twozone_P.VDis2ToV_ymax - ds_simple_twozone_P.VDis2ToV_ymin) /
    (ds_simple_twozone_P.VDis2ToV_xmax - ds_simple_twozone_P.VDis2ToV_xmin);
  ds_simple_twozone_B.rangeyrangex_o = tmp * ds_simple_twozone_B.Subtractminx_m;

  /* Bias: '<S16>/Add min y' */
  ds_simple_twozone_B.Addminy_k = ds_simple_twozone_B.rangeyrangex_o +
    ds_simple_twozone_P.VDis2ToV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S23>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/VFlo2 non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport6_P1_S1(&ds_simple_twozone_B.Addminy_k);

  /* Sum: '<S9>/KtoC' incorporates:
   *  Constant: '<S9>/zerC'
   */
  ds_simple_twozone_B.KtoC_l = ds_simple_twozone_B.Sfunc[12] -
    ds_simple_twozone_P.zerC_Value_o;

  /* Gain: '<S9>/Gain' */
  ds_simple_twozone_B.Gain_h = ds_simple_twozone_P.Gain_Gain_aw *
    ds_simple_twozone_B.KtoC_l;

  /* Bias: '<S9>/Bias' */
  ds_simple_twozone_B.Bias_j = ds_simple_twozone_B.Gain_h +
    ds_simple_twozone_P.Bias_Bias_ch;

  /* Bias: '<S12>/Subtract min x' */
  tmp = -ds_simple_twozone_P.TOutFtoV_xmin;
  ds_simple_twozone_B.Subtractminx_d = ds_simple_twozone_B.Bias_j + tmp;

  /* Gain: '<S12>/range y // range x' */
  tmp = (ds_simple_twozone_P.TOutFtoV_ymax - ds_simple_twozone_P.TOutFtoV_ymin) /
    (ds_simple_twozone_P.TOutFtoV_xmax - ds_simple_twozone_P.TOutFtoV_xmin);
  ds_simple_twozone_B.rangeyrangex_d = tmp * ds_simple_twozone_B.Subtractminx_d;

  /* Bias: '<S12>/Add min y' */
  ds_simple_twozone_B.Addminy_l = ds_simple_twozone_B.rangeyrangex_d +
    ds_simple_twozone_P.TOutFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S19>/Data Outport S-Fcn' */

  /* Write access point of block ds_simple_twozone/outputs/TOut non-bus port 1 */
  ap_write_ds_simple_twozone_DataOutport7_P1_S1(&ds_simple_twozone_B.Addminy_l);

  /* user code (Output function Trailer) */
  if (rtmIsMajorTimeStep(ds_simple_twozone_M)) {
    /* Function module access point of system <Root>    */
    ap_exit_ds_simple_twozone_SIDRoot_TID1();
  }
}

/* Model update function */
void ds_simple_twozone_update(void)
{
  /* Update for S-Function (dspaceexample_s_dy4854h2b34): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_s_dy4854h2b34) */
  {
    SimStruct *rts = ds_simple_twozone_M->childSfunctions[0];
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
  if (!(++ds_simple_twozone_M->Timing.clockTick0)) {
    ++ds_simple_twozone_M->Timing.clockTickH0;
  }

  ds_simple_twozone_M->Timing.t[0] = ds_simple_twozone_M->Timing.clockTick0 *
    ds_simple_twozone_M->Timing.stepSize0 +
    ds_simple_twozone_M->Timing.clockTickH0 *
    ds_simple_twozone_M->Timing.stepSize0 * 4294967296.0;

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
    ds_simple_twozone_M->Timing.clockTick1++;
    if (!ds_simple_twozone_M->Timing.clockTick1) {
      ds_simple_twozone_M->Timing.clockTickH1++;
    }
  }

  rate_scheduler();
}

/* Model initialize function */
void ds_simple_twozone_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)ds_simple_twozone_M, 0,
                sizeof(RT_MODEL_ds_simple_twozone_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&ds_simple_twozone_M->solverInfo,
                          &ds_simple_twozone_M->Timing.simTimeStep);
    rtsiSetTPtr(&ds_simple_twozone_M->solverInfo, &rtmGetTPtr
                (ds_simple_twozone_M));
    rtsiSetStepSizePtr(&ds_simple_twozone_M->solverInfo,
                       &ds_simple_twozone_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&ds_simple_twozone_M->solverInfo, (&rtmGetErrorStatus
      (ds_simple_twozone_M)));
    rtsiSetRTModelPtr(&ds_simple_twozone_M->solverInfo, ds_simple_twozone_M);
  }

  rtsiSetSimTimeStep(&ds_simple_twozone_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&ds_simple_twozone_M->solverInfo,"FixedStepDiscrete");
  ds_simple_twozone_M->solverInfoPtr = (&ds_simple_twozone_M->solverInfo);

  /* Initialize timing info */
  {
    int_T *mdlTsMap = ds_simple_twozone_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    mdlTsMap[2] = 2;
    ds_simple_twozone_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    ds_simple_twozone_M->Timing.sampleTimes =
      (&ds_simple_twozone_M->Timing.sampleTimesArray[0]);
    ds_simple_twozone_M->Timing.offsetTimes =
      (&ds_simple_twozone_M->Timing.offsetTimesArray[0]);

    /* task periods */
    ds_simple_twozone_M->Timing.sampleTimes[0] = (0.0);
    ds_simple_twozone_M->Timing.sampleTimes[1] = (0.001);
    ds_simple_twozone_M->Timing.sampleTimes[2] = (0.01);

    /* task offsets */
    ds_simple_twozone_M->Timing.offsetTimes[0] = (0.0);
    ds_simple_twozone_M->Timing.offsetTimes[1] = (0.0);
    ds_simple_twozone_M->Timing.offsetTimes[2] = (0.0);
  }

  rtmSetTPtr(ds_simple_twozone_M, &ds_simple_twozone_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = ds_simple_twozone_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    mdlSampleHits[2] = 1;
    ds_simple_twozone_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(ds_simple_twozone_M, -1);
  ds_simple_twozone_M->Timing.stepSize0 = 0.001;
  ds_simple_twozone_M->solverInfoPtr = (&ds_simple_twozone_M->solverInfo);
  ds_simple_twozone_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&ds_simple_twozone_M->solverInfo, 0.001);
  rtsiSetSolverMode(&ds_simple_twozone_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &ds_simple_twozone_B), 0,
                sizeof(B_ds_simple_twozone_T));

  /* states (dwork) */
  (void) memset((void *)&ds_simple_twozone_DW, 0,
                sizeof(DW_ds_simple_twozone_T));

  /* child S-Function registration */
  {
    RTWSfcnInfo *sfcnInfo = &ds_simple_twozone_M->NonInlinedSFcns.sfcnInfo;
    ds_simple_twozone_M->sfcnInfo = (sfcnInfo);
    rtssSetErrorStatusPtr(sfcnInfo, (&rtmGetErrorStatus(ds_simple_twozone_M)));
    rtssSetNumRootSampTimesPtr(sfcnInfo,
      &ds_simple_twozone_M->Sizes.numSampTimes);
    ds_simple_twozone_M->NonInlinedSFcns.taskTimePtrs[0] = &(rtmGetTPtr
      (ds_simple_twozone_M)[0]);
    ds_simple_twozone_M->NonInlinedSFcns.taskTimePtrs[1] = &(rtmGetTPtr
      (ds_simple_twozone_M)[1]);
    ds_simple_twozone_M->NonInlinedSFcns.taskTimePtrs[2] = &(rtmGetTPtr
      (ds_simple_twozone_M)[2]);
    rtssSetTPtrPtr(sfcnInfo,ds_simple_twozone_M->NonInlinedSFcns.taskTimePtrs);
    rtssSetTStartPtr(sfcnInfo, &rtmGetTStart(ds_simple_twozone_M));
    rtssSetTFinalPtr(sfcnInfo, &rtmGetTFinal(ds_simple_twozone_M));
    rtssSetTimeOfLastOutputPtr(sfcnInfo, &rtmGetTimeOfLastOutput
      (ds_simple_twozone_M));
    rtssSetStepSizePtr(sfcnInfo, &ds_simple_twozone_M->Timing.stepSize);
    rtssSetStopRequestedPtr(sfcnInfo, &rtmGetStopRequested(ds_simple_twozone_M));
    rtssSetDerivCacheNeedsResetPtr(sfcnInfo,
      &ds_simple_twozone_M->derivCacheNeedsReset);
    rtssSetZCCacheNeedsResetPtr(sfcnInfo,
      &ds_simple_twozone_M->zCCacheNeedsReset);
    rtssSetContTimeOutputInconsistentWithStateAtMajorStepPtr(sfcnInfo,
      &ds_simple_twozone_M->CTOutputIncnstWithState);
    rtssSetSampleHitsPtr(sfcnInfo, &ds_simple_twozone_M->Timing.sampleHits);
    rtssSetPerTaskSampleHitsPtr(sfcnInfo,
      &ds_simple_twozone_M->Timing.perTaskSampleHits);
    rtssSetSimModePtr(sfcnInfo, &ds_simple_twozone_M->simMode);
    rtssSetSolverInfoPtr(sfcnInfo, &ds_simple_twozone_M->solverInfoPtr);
  }

  ds_simple_twozone_M->Sizes.numSFcns = (1);

  /* register each child */
  {
    (void) memset((void *)&ds_simple_twozone_M->NonInlinedSFcns.childSFunctions
                  [0], 0,
                  1*sizeof(SimStruct));
    ds_simple_twozone_M->childSfunctions =
      (&ds_simple_twozone_M->NonInlinedSFcns.childSFunctionPtrs[0]);
    ds_simple_twozone_M->childSfunctions[0] =
      (&ds_simple_twozone_M->NonInlinedSFcns.childSFunctions[0]);

    /* Level2 S-Function Block: ds_simple_twozone/<S4>/Sfunc (dspaceexample_s_dy4854h2b34) */
    {
      SimStruct *rts = ds_simple_twozone_M->childSfunctions[0];

      /* timing info */
      time_T *sfcnPeriod = ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.sfcnPeriod;
      time_T *sfcnOffset = ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.sfcnOffset;
      int_T *sfcnTsMap = ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.sfcnTsMap;
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);

      {
        ssSetBlkInfo2Ptr(rts, &ds_simple_twozone_M->NonInlinedSFcns.blkInfo2[0]);
      }

      _ssSetBlkInfo2PortInfo2Ptr(rts,
        &ds_simple_twozone_M->NonInlinedSFcns.inputOutputPortInfo2[0]);

      /* Set up the mdlInfo pointer */
      ssSetRTWSfcnInfo(rts, ds_simple_twozone_M->sfcnInfo);

      /* Allocate memory of model methods 2 */
      {
        ssSetModelMethods2(rts, &ds_simple_twozone_M->NonInlinedSFcns.methods2[0]);
      }

      /* Allocate memory of model methods 3 */
      {
        ssSetModelMethods3(rts, &ds_simple_twozone_M->NonInlinedSFcns.methods3[0]);
      }

      /* Allocate memory of model methods 4 */
      {
        ssSetModelMethods4(rts, &ds_simple_twozone_M->NonInlinedSFcns.methods4[0]);
      }

      /* Allocate memory for states auxilliary information */
      {
        ssSetStatesInfo2(rts, &ds_simple_twozone_M->NonInlinedSFcns.statesInfo2
                         [0]);
        ssSetPeriodicStatesInfo(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.periodicStatesInfo[0]);
      }

      /* inputs */
      {
        _ssSetNumInputPorts(rts, 1);
        ssSetPortInfoForInputs(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.inputPortInfo[0]);
        _ssSetPortInfo2ForInputUnits(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.inputPortUnits[0]);
        ssSetInputPortUnit(rts, 0, 0);
        _ssSetPortInfo2ForInputCoSimAttribute(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.inputPortCoSimAttribute[0]);
        ssSetInputPortIsContinuousQuantity(rts, 0, 0);

        /* port 0 */
        {
          ssSetInputPortRequiredContiguous(rts, 0, 1);
          ssSetInputPortSignal(rts, 0,
                               ds_simple_twozone_B.TmpSignalConversionAtSfuncInpor);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 2);
        }
      }

      /* outputs */
      {
        ssSetPortInfoForOutputs(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);
        _ssSetPortInfo2ForOutputUnits(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.outputPortUnits[0]);
        ssSetOutputPortUnit(rts, 0, 0);
        _ssSetPortInfo2ForOutputCoSimAttribute(rts,
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.outputPortCoSimAttribute[0]);
        ssSetOutputPortIsContinuousQuantity(rts, 0, 0);

        /* port 0 */
        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 28);
          ssSetOutputPortSignal(rts, 0, ((real_T *) ds_simple_twozone_B.Sfunc));
        }
      }

      /* states */
      ssSetDiscStates(rts, (real_T *) &ds_simple_twozone_DW.Sfunc_DSTATE);

      /* path info */
      ssSetModelName(rts, "Sfunc");
      ssSetPath(rts, "ds_simple_twozone/behavior/DymolaBlock/Sfunc");
      ssSetRTModel(rts,ds_simple_twozone_M);
      ssSetParentSS(rts, (NULL));
      ssSetRootSS(rts, rts);
      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      /* parameters */
      {
        mxArray **sfcnParams = (mxArray **)
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.params;
        ssSetSFcnParamsCount(rts, 2);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)ds_simple_twozone_P.Sfunc_P1_Size);
        ssSetSFcnParam(rts, 1, (mxArray*)ds_simple_twozone_P.Sfunc_P2_Size);
      }

      /* work vectors */
      ssSetRWork(rts, (real_T *) &ds_simple_twozone_DW.Sfunc_RWORK[0]);
      ssSetPWork(rts, (void **) &ds_simple_twozone_DW.Sfunc_PWORK);

      {
        struct _ssDWorkRecord *dWorkRecord = (struct _ssDWorkRecord *)
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.dWork;
        struct _ssDWorkAuxRecord *dWorkAuxRecord = (struct _ssDWorkAuxRecord *)
          &ds_simple_twozone_M->NonInlinedSFcns.Sfcn0.dWorkAux;
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 3);

        /* RWORK */
        ssSetDWorkWidth(rts, 0, 19117);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWork(rts, 0, &ds_simple_twozone_DW.Sfunc_RWORK[0]);

        /* PWORK */
        ssSetDWorkWidth(rts, 1, 1);
        ssSetDWorkDataType(rts, 1,SS_POINTER);
        ssSetDWorkComplexSignal(rts, 1, 0);
        ssSetDWork(rts, 1, &ds_simple_twozone_DW.Sfunc_PWORK);

        /* DSTATE */
        ssSetDWorkWidth(rts, 2, 1);
        ssSetDWorkDataType(rts, 2,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 2, 0);
        ssSetDWorkUsedAsDState(rts, 2, 1);
        ssSetDWork(rts, 2, &ds_simple_twozone_DW.Sfunc_DSTATE);
      }

      /* registration */
      dspaceexample_s_dy4854h2b34(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);

      /* adjust sample time */
      ssSetSampleTime(rts, 0, 0.0);
      ssSetOffsetTime(rts, 0, 0.0);
      sfcnTsMap[0] = 0;

      /* set compiled values of dynamic vector attributes */
      ssSetNumNonsampledZCs(rts, 0);

      /* Update connectivity flags for each port */
      _ssSetInputPortConnected(rts, 0, 1);
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);

      /* Update the BufferDstPort flags for each input port */
      ssSetInputPortBufferDstPort(rts, 0, -1);
    }
  }

  {
    /* user code (registration function declaration) */
    /*Initialize global TRC pointers. */
    ds_simple_twozone_rti_init_trc_pointers();
  }

  /* InitializeConditions for S-Function (dspaceexample_s_dy4854h2b34): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_s_dy4854h2b34) */
  {
    SimStruct *rts = ds_simple_twozone_M->childSfunctions[0];
    sfcnInitializeConditions(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }
}

/* Model terminate function */
void ds_simple_twozone_terminate(void)
{
  /* Terminate for S-Function (dspaceexample_s_dy4854h2b34): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_s_dy4854h2b34) */
  {
    SimStruct *rts = ds_simple_twozone_M->childSfunctions[0];
    sfcnTerminate(rts);
  }
}
