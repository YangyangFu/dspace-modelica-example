/*
 * ds_fivezoneg36_dsrt.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "ds_fivezoneg36_dsrt".
 *
 * Model version              : 1.3
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C source code generated on : Wed Oct  6 14:22:41 2021
 *
 * Target selection: dsrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Custom Processor->Custom
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ds_fivezoneg36_dsrt_dsrtvdf.h"
#include "ds_fivezoneg36_dsrt.h"
#include "ds_fivezoneg36_dsrt_private.h"

/* Block signals (default storage) */
B_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_B;

/* Block states (default storage) */
DW_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_DW;

/* Real-time model */
RT_MODEL_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_M_;
RT_MODEL_ds_fivezoneg36_dsrt_T *const ds_fivezoneg36_dsrt_M =
  &ds_fivezoneg36_dsrt_M_;
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
  (ds_fivezoneg36_dsrt_M->Timing.TaskCounters.TID[2])++;
  if ((ds_fivezoneg36_dsrt_M->Timing.TaskCounters.TID[2]) > 9) {/* Sample time: [0.01s, 0.0s] */
    ds_fivezoneg36_dsrt_M->Timing.TaskCounters.TID[2] = 0;
  }

  ds_fivezoneg36_dsrt_M->Timing.sampleHits[2] =
    (ds_fivezoneg36_dsrt_M->Timing.TaskCounters.TID[2] == 0);
}

/* Model output function */
void ds_fivezoneg36_dsrt_output(void)
{
  real_T tmp;

  /* user code (Output function Body) */
  if (rtmIsMajorTimeStep(ds_fivezoneg36_dsrt_M)) {
    /* Function module access point of system <Root>    */
    ap_entry_ds_fivezoneg36_dsrt_SIDRoot_TID1();
  }

  if (ds_fivezoneg36_dsrt_M->Timing.TaskCounters.TID[2] == 0) {
    /* Constant: '<S2>/Constant' */
    ds_fivezoneg36_dsrt_B.Constant = ds_fivezoneg36_dsrt_P.Constant_Value;

    /* Constant: '<S2>/Constant1' */
    ds_fivezoneg36_dsrt_B.Constant1 = ds_fivezoneg36_dsrt_P.Constant1_Value;
  }

  /* SignalConversion generated from: '<S4>/Sfunc' */
  ds_fivezoneg36_dsrt_B.TmpSignalConversionAtSfuncInpor[0] =
    ds_fivezoneg36_dsrt_B.Constant;
  ds_fivezoneg36_dsrt_B.TmpSignalConversionAtSfuncInpor[1] =
    ds_fivezoneg36_dsrt_B.Constant1;

  /* S-Function (dspaceexample_f_dy975f7hqu): '<S4>/Sfunc' */

  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_f_dy975f7hqu) */
  {
    SimStruct *rts = ds_fivezoneg36_dsrt_M->childSfunctions[0];
    sfcnOutputs(rts,0);
  }

  /* Sum: '<S5>/KtoC' incorporates:
   *  Constant: '<S5>/zerC'
   */
  ds_fivezoneg36_dsrt_B.KtoC = ds_fivezoneg36_dsrt_B.Sfunc[0] -
    ds_fivezoneg36_dsrt_P.zerC_Value;

  /* Gain: '<S5>/Gain' */
  ds_fivezoneg36_dsrt_B.Gain = ds_fivezoneg36_dsrt_P.Gain_Gain *
    ds_fivezoneg36_dsrt_B.KtoC;

  /* Bias: '<S5>/Bias' */
  ds_fivezoneg36_dsrt_B.Bias = ds_fivezoneg36_dsrt_B.Gain +
    ds_fivezoneg36_dsrt_P.Bias_Bias;

  /* Bias: '<S13>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.TRooCorFtoV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx = ds_fivezoneg36_dsrt_B.Bias + tmp;

  /* Gain: '<S13>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.TRooCorFtoV_ymax -
         ds_fivezoneg36_dsrt_P.TRooCorFtoV_ymin) /
    (ds_fivezoneg36_dsrt_P.TRooCorFtoV_xmax -
     ds_fivezoneg36_dsrt_P.TRooCorFtoV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex = tmp * ds_fivezoneg36_dsrt_B.Subtractminx;

  /* Bias: '<S13>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy = ds_fivezoneg36_dsrt_B.rangeyrangex +
    ds_fivezoneg36_dsrt_P.TRooCorFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S20>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/TRooCor non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport1_P1_S1(&ds_fivezoneg36_dsrt_B.Addminy);

  /* Sum: '<S6>/KtoC' incorporates:
   *  Constant: '<S6>/zerC'
   */
  ds_fivezoneg36_dsrt_B.KtoC_o = ds_fivezoneg36_dsrt_B.Sfunc[1] -
    ds_fivezoneg36_dsrt_P.zerC_Value_n;

  /* Gain: '<S6>/Gain' */
  ds_fivezoneg36_dsrt_B.Gain_l = ds_fivezoneg36_dsrt_P.Gain_Gain_a *
    ds_fivezoneg36_dsrt_B.KtoC_o;

  /* Bias: '<S6>/Bias' */
  ds_fivezoneg36_dsrt_B.Bias_n = ds_fivezoneg36_dsrt_B.Gain_l +
    ds_fivezoneg36_dsrt_P.Bias_Bias_c;

  /* Bias: '<S14>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.TRooSouFtoV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_j = ds_fivezoneg36_dsrt_B.Bias_n + tmp;

  /* Gain: '<S14>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.TRooSouFtoV_ymax -
         ds_fivezoneg36_dsrt_P.TRooSouFtoV_ymin) /
    (ds_fivezoneg36_dsrt_P.TRooSouFtoV_xmax -
     ds_fivezoneg36_dsrt_P.TRooSouFtoV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_b = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_j;

  /* Bias: '<S14>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_i = ds_fivezoneg36_dsrt_B.rangeyrangex_b +
    ds_fivezoneg36_dsrt_P.TRooSouFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S21>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/TRooSou non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport2_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_i);

  /* Sum: '<S7>/KtoC' incorporates:
   *  Constant: '<S7>/zerC'
   */
  ds_fivezoneg36_dsrt_B.KtoC_g = ds_fivezoneg36_dsrt_B.Sfunc[2] -
    ds_fivezoneg36_dsrt_P.zerC_Value_f;

  /* Gain: '<S7>/Gain' */
  ds_fivezoneg36_dsrt_B.Gain_p = ds_fivezoneg36_dsrt_P.Gain_Gain_c *
    ds_fivezoneg36_dsrt_B.KtoC_g;

  /* Bias: '<S7>/Bias' */
  ds_fivezoneg36_dsrt_B.Bias_i = ds_fivezoneg36_dsrt_B.Gain_p +
    ds_fivezoneg36_dsrt_P.Bias_Bias_d;

  /* Bias: '<S10>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.TDisCorFtoV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_k = ds_fivezoneg36_dsrt_B.Bias_i + tmp;

  /* Gain: '<S10>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.TDisCorFtoV_ymax -
         ds_fivezoneg36_dsrt_P.TDisCorFtoV_ymin) /
    (ds_fivezoneg36_dsrt_P.TDisCorFtoV_xmax -
     ds_fivezoneg36_dsrt_P.TDisCorFtoV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_k = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_k;

  /* Bias: '<S10>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_n = ds_fivezoneg36_dsrt_B.rangeyrangex_k +
    ds_fivezoneg36_dsrt_P.TDisCorFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S17>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/TDisCor non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport3_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_n);

  /* Sum: '<S8>/KtoC' incorporates:
   *  Constant: '<S8>/zerC'
   */
  ds_fivezoneg36_dsrt_B.KtoC_a = ds_fivezoneg36_dsrt_B.Sfunc[3] -
    ds_fivezoneg36_dsrt_P.zerC_Value_k;

  /* Gain: '<S8>/Gain' */
  ds_fivezoneg36_dsrt_B.Gain_i = ds_fivezoneg36_dsrt_P.Gain_Gain_p *
    ds_fivezoneg36_dsrt_B.KtoC_a;

  /* Bias: '<S8>/Bias' */
  ds_fivezoneg36_dsrt_B.Bias_g = ds_fivezoneg36_dsrt_B.Gain_i +
    ds_fivezoneg36_dsrt_P.Bias_Bias_i;

  /* Bias: '<S11>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.TDisSouFtoV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_p = ds_fivezoneg36_dsrt_B.Bias_g + tmp;

  /* Gain: '<S11>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.TDisSouFtoV_ymax -
         ds_fivezoneg36_dsrt_P.TDisSouFtoV_ymin) /
    (ds_fivezoneg36_dsrt_P.TDisSouFtoV_xmax -
     ds_fivezoneg36_dsrt_P.TDisSouFtoV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_j = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_p;

  /* Bias: '<S11>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_m = ds_fivezoneg36_dsrt_B.rangeyrangex_j +
    ds_fivezoneg36_dsrt_P.TDisSouFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S18>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/TDisSou non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport4_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_m);

  /* S-Function (dsmpb_dataoutport): '<S24>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/fanOnSta non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport5_P1_S1(&ds_fivezoneg36_dsrt_B.Sfunc[4]);

  /* Gain: '<S1>/toCFM' */
  ds_fivezoneg36_dsrt_B.toCFM = ds_fivezoneg36_dsrt_P.toCFM_Gain *
    ds_fivezoneg36_dsrt_B.Sfunc[5];

  /* Bias: '<S15>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.VDisCorToV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_n = ds_fivezoneg36_dsrt_B.toCFM + tmp;

  /* Gain: '<S15>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.VDisCorToV_ymax -
         ds_fivezoneg36_dsrt_P.VDisCorToV_ymin) /
    (ds_fivezoneg36_dsrt_P.VDisCorToV_xmax -
     ds_fivezoneg36_dsrt_P.VDisCorToV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_je = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_n;

  /* Bias: '<S15>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_b = ds_fivezoneg36_dsrt_B.rangeyrangex_je +
    ds_fivezoneg36_dsrt_P.VDisCorToV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S22>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/VFloCor non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport6_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_b);

  /* Gain: '<S1>/toCFM1' */
  ds_fivezoneg36_dsrt_B.toCFM1 = ds_fivezoneg36_dsrt_P.toCFM1_Gain *
    ds_fivezoneg36_dsrt_B.Sfunc[6];

  /* Bias: '<S16>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.VDisSouToV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_m = ds_fivezoneg36_dsrt_B.toCFM1 + tmp;

  /* Gain: '<S16>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.VDisSouToV_ymax -
         ds_fivezoneg36_dsrt_P.VDisSouToV_ymin) /
    (ds_fivezoneg36_dsrt_P.VDisSouToV_xmax -
     ds_fivezoneg36_dsrt_P.VDisSouToV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_o = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_m;

  /* Bias: '<S16>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_k = ds_fivezoneg36_dsrt_B.rangeyrangex_o +
    ds_fivezoneg36_dsrt_P.VDisSouToV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S23>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/VFloSou non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport7_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_k);

  /* Sum: '<S9>/KtoC' incorporates:
   *  Constant: '<S9>/zerC'
   */
  ds_fivezoneg36_dsrt_B.KtoC_l = ds_fivezoneg36_dsrt_B.Sfunc[7] -
    ds_fivezoneg36_dsrt_P.zerC_Value_o;

  /* Gain: '<S9>/Gain' */
  ds_fivezoneg36_dsrt_B.Gain_h = ds_fivezoneg36_dsrt_P.Gain_Gain_aw *
    ds_fivezoneg36_dsrt_B.KtoC_l;

  /* Bias: '<S9>/Bias' */
  ds_fivezoneg36_dsrt_B.Bias_j = ds_fivezoneg36_dsrt_B.Gain_h +
    ds_fivezoneg36_dsrt_P.Bias_Bias_ch;

  /* Bias: '<S12>/Subtract min x' */
  tmp = -ds_fivezoneg36_dsrt_P.TOutFtoV_xmin;
  ds_fivezoneg36_dsrt_B.Subtractminx_d = ds_fivezoneg36_dsrt_B.Bias_j + tmp;

  /* Gain: '<S12>/range y // range x' */
  tmp = (ds_fivezoneg36_dsrt_P.TOutFtoV_ymax -
         ds_fivezoneg36_dsrt_P.TOutFtoV_ymin) /
    (ds_fivezoneg36_dsrt_P.TOutFtoV_xmax - ds_fivezoneg36_dsrt_P.TOutFtoV_xmin);
  ds_fivezoneg36_dsrt_B.rangeyrangex_d = tmp *
    ds_fivezoneg36_dsrt_B.Subtractminx_d;

  /* Bias: '<S12>/Add min y' */
  ds_fivezoneg36_dsrt_B.Addminy_l = ds_fivezoneg36_dsrt_B.rangeyrangex_d +
    ds_fivezoneg36_dsrt_P.TOutFtoV_ymin;

  /* S-Function (dsmpb_dataoutport): '<S19>/Data Outport S-Fcn' */

  /* Write access point of block ds_fivezoneg36_dsrt/outputs/TOut non-bus port 1 */
  ap_write_ds_fivezoneg36_dsrt_DataOutport8_P1_S1
    (&ds_fivezoneg36_dsrt_B.Addminy_l);

  /* user code (Output function Trailer) */
  if (rtmIsMajorTimeStep(ds_fivezoneg36_dsrt_M)) {
    /* Function module access point of system <Root>    */
    ap_exit_ds_fivezoneg36_dsrt_SIDRoot_TID1();
  }
}

/* Model update function */
void ds_fivezoneg36_dsrt_update(void)
{
  /* Update for S-Function (dspaceexample_f_dy975f7hqu): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_f_dy975f7hqu) */
  {
    SimStruct *rts = ds_fivezoneg36_dsrt_M->childSfunctions[0];
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
  if (!(++ds_fivezoneg36_dsrt_M->Timing.clockTick0)) {
    ++ds_fivezoneg36_dsrt_M->Timing.clockTickH0;
  }

  ds_fivezoneg36_dsrt_M->Timing.t[0] = ds_fivezoneg36_dsrt_M->Timing.clockTick0 *
    ds_fivezoneg36_dsrt_M->Timing.stepSize0 +
    ds_fivezoneg36_dsrt_M->Timing.clockTickH0 *
    ds_fivezoneg36_dsrt_M->Timing.stepSize0 * 4294967296.0;

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
    ds_fivezoneg36_dsrt_M->Timing.clockTick1++;
    if (!ds_fivezoneg36_dsrt_M->Timing.clockTick1) {
      ds_fivezoneg36_dsrt_M->Timing.clockTickH1++;
    }
  }

  rate_scheduler();
}

/* Model initialize function */
void ds_fivezoneg36_dsrt_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)ds_fivezoneg36_dsrt_M, 0,
                sizeof(RT_MODEL_ds_fivezoneg36_dsrt_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&ds_fivezoneg36_dsrt_M->solverInfo,
                          &ds_fivezoneg36_dsrt_M->Timing.simTimeStep);
    rtsiSetTPtr(&ds_fivezoneg36_dsrt_M->solverInfo, &rtmGetTPtr
                (ds_fivezoneg36_dsrt_M));
    rtsiSetStepSizePtr(&ds_fivezoneg36_dsrt_M->solverInfo,
                       &ds_fivezoneg36_dsrt_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&ds_fivezoneg36_dsrt_M->solverInfo,
                          (&rtmGetErrorStatus(ds_fivezoneg36_dsrt_M)));
    rtsiSetRTModelPtr(&ds_fivezoneg36_dsrt_M->solverInfo, ds_fivezoneg36_dsrt_M);
  }

  rtsiSetSimTimeStep(&ds_fivezoneg36_dsrt_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&ds_fivezoneg36_dsrt_M->solverInfo,"FixedStepDiscrete");
  ds_fivezoneg36_dsrt_M->solverInfoPtr = (&ds_fivezoneg36_dsrt_M->solverInfo);

  /* Initialize timing info */
  {
    int_T *mdlTsMap = ds_fivezoneg36_dsrt_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    mdlTsMap[2] = 2;
    ds_fivezoneg36_dsrt_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    ds_fivezoneg36_dsrt_M->Timing.sampleTimes =
      (&ds_fivezoneg36_dsrt_M->Timing.sampleTimesArray[0]);
    ds_fivezoneg36_dsrt_M->Timing.offsetTimes =
      (&ds_fivezoneg36_dsrt_M->Timing.offsetTimesArray[0]);

    /* task periods */
    ds_fivezoneg36_dsrt_M->Timing.sampleTimes[0] = (0.0);
    ds_fivezoneg36_dsrt_M->Timing.sampleTimes[1] = (0.001);
    ds_fivezoneg36_dsrt_M->Timing.sampleTimes[2] = (0.01);

    /* task offsets */
    ds_fivezoneg36_dsrt_M->Timing.offsetTimes[0] = (0.0);
    ds_fivezoneg36_dsrt_M->Timing.offsetTimes[1] = (0.0);
    ds_fivezoneg36_dsrt_M->Timing.offsetTimes[2] = (0.0);
  }

  rtmSetTPtr(ds_fivezoneg36_dsrt_M, &ds_fivezoneg36_dsrt_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = ds_fivezoneg36_dsrt_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    mdlSampleHits[2] = 1;
    ds_fivezoneg36_dsrt_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(ds_fivezoneg36_dsrt_M, -1);
  ds_fivezoneg36_dsrt_M->Timing.stepSize0 = 0.001;
  ds_fivezoneg36_dsrt_M->solverInfoPtr = (&ds_fivezoneg36_dsrt_M->solverInfo);
  ds_fivezoneg36_dsrt_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&ds_fivezoneg36_dsrt_M->solverInfo, 0.001);
  rtsiSetSolverMode(&ds_fivezoneg36_dsrt_M->solverInfo,
                    SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &ds_fivezoneg36_dsrt_B), 0,
                sizeof(B_ds_fivezoneg36_dsrt_T));

  /* states (dwork) */
  (void) memset((void *)&ds_fivezoneg36_dsrt_DW, 0,
                sizeof(DW_ds_fivezoneg36_dsrt_T));

  /* child S-Function registration */
  {
    RTWSfcnInfo *sfcnInfo = &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.sfcnInfo;
    ds_fivezoneg36_dsrt_M->sfcnInfo = (sfcnInfo);
    rtssSetErrorStatusPtr(sfcnInfo, (&rtmGetErrorStatus(ds_fivezoneg36_dsrt_M)));
    rtssSetNumRootSampTimesPtr(sfcnInfo,
      &ds_fivezoneg36_dsrt_M->Sizes.numSampTimes);
    ds_fivezoneg36_dsrt_M->NonInlinedSFcns.taskTimePtrs[0] = &(rtmGetTPtr
      (ds_fivezoneg36_dsrt_M)[0]);
    ds_fivezoneg36_dsrt_M->NonInlinedSFcns.taskTimePtrs[1] = &(rtmGetTPtr
      (ds_fivezoneg36_dsrt_M)[1]);
    ds_fivezoneg36_dsrt_M->NonInlinedSFcns.taskTimePtrs[2] = &(rtmGetTPtr
      (ds_fivezoneg36_dsrt_M)[2]);
    rtssSetTPtrPtr(sfcnInfo,ds_fivezoneg36_dsrt_M->NonInlinedSFcns.taskTimePtrs);
    rtssSetTStartPtr(sfcnInfo, &rtmGetTStart(ds_fivezoneg36_dsrt_M));
    rtssSetTFinalPtr(sfcnInfo, &rtmGetTFinal(ds_fivezoneg36_dsrt_M));
    rtssSetTimeOfLastOutputPtr(sfcnInfo, &rtmGetTimeOfLastOutput
      (ds_fivezoneg36_dsrt_M));
    rtssSetStepSizePtr(sfcnInfo, &ds_fivezoneg36_dsrt_M->Timing.stepSize);
    rtssSetStopRequestedPtr(sfcnInfo, &rtmGetStopRequested(ds_fivezoneg36_dsrt_M));
    rtssSetDerivCacheNeedsResetPtr(sfcnInfo,
      &ds_fivezoneg36_dsrt_M->derivCacheNeedsReset);
    rtssSetZCCacheNeedsResetPtr(sfcnInfo,
      &ds_fivezoneg36_dsrt_M->zCCacheNeedsReset);
    rtssSetContTimeOutputInconsistentWithStateAtMajorStepPtr(sfcnInfo,
      &ds_fivezoneg36_dsrt_M->CTOutputIncnstWithState);
    rtssSetSampleHitsPtr(sfcnInfo, &ds_fivezoneg36_dsrt_M->Timing.sampleHits);
    rtssSetPerTaskSampleHitsPtr(sfcnInfo,
      &ds_fivezoneg36_dsrt_M->Timing.perTaskSampleHits);
    rtssSetSimModePtr(sfcnInfo, &ds_fivezoneg36_dsrt_M->simMode);
    rtssSetSolverInfoPtr(sfcnInfo, &ds_fivezoneg36_dsrt_M->solverInfoPtr);
  }

  ds_fivezoneg36_dsrt_M->Sizes.numSFcns = (1);

  /* register each child */
  {
    (void) memset((void *)
                  &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.childSFunctions[0], 0,
                  1*sizeof(SimStruct));
    ds_fivezoneg36_dsrt_M->childSfunctions =
      (&ds_fivezoneg36_dsrt_M->NonInlinedSFcns.childSFunctionPtrs[0]);
    ds_fivezoneg36_dsrt_M->childSfunctions[0] =
      (&ds_fivezoneg36_dsrt_M->NonInlinedSFcns.childSFunctions[0]);

    /* Level2 S-Function Block: ds_fivezoneg36_dsrt/<S4>/Sfunc (dspaceexample_f_dy975f7hqu) */
    {
      SimStruct *rts = ds_fivezoneg36_dsrt_M->childSfunctions[0];

      /* timing info */
      time_T *sfcnPeriod =
        ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.sfcnPeriod;
      time_T *sfcnOffset =
        ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.sfcnOffset;
      int_T *sfcnTsMap = ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.sfcnTsMap;
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);

      {
        ssSetBlkInfo2Ptr(rts, &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.blkInfo2[0]);
      }

      _ssSetBlkInfo2PortInfo2Ptr(rts,
        &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.inputOutputPortInfo2[0]);

      /* Set up the mdlInfo pointer */
      ssSetRTWSfcnInfo(rts, ds_fivezoneg36_dsrt_M->sfcnInfo);

      /* Allocate memory of model methods 2 */
      {
        ssSetModelMethods2(rts, &ds_fivezoneg36_dsrt_M->
                           NonInlinedSFcns.methods2[0]);
      }

      /* Allocate memory of model methods 3 */
      {
        ssSetModelMethods3(rts, &ds_fivezoneg36_dsrt_M->
                           NonInlinedSFcns.methods3[0]);
      }

      /* Allocate memory of model methods 4 */
      {
        ssSetModelMethods4(rts, &ds_fivezoneg36_dsrt_M->
                           NonInlinedSFcns.methods4[0]);
      }

      /* Allocate memory for states auxilliary information */
      {
        ssSetStatesInfo2(rts,
                         &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.statesInfo2[0]);
        ssSetPeriodicStatesInfo(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.periodicStatesInfo[0]);
      }

      /* inputs */
      {
        _ssSetNumInputPorts(rts, 1);
        ssSetPortInfoForInputs(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.inputPortInfo[0]);
        _ssSetPortInfo2ForInputUnits(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.inputPortUnits[0]);
        ssSetInputPortUnit(rts, 0, 0);
        _ssSetPortInfo2ForInputCoSimAttribute(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.inputPortCoSimAttribute
          [0]);
        ssSetInputPortIsContinuousQuantity(rts, 0, 0);

        /* port 0 */
        {
          ssSetInputPortRequiredContiguous(rts, 0, 1);
          ssSetInputPortSignal(rts, 0,
                               ds_fivezoneg36_dsrt_B.TmpSignalConversionAtSfuncInpor);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 2);
        }
      }

      /* outputs */
      {
        ssSetPortInfoForOutputs(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);
        _ssSetPortInfo2ForOutputUnits(rts,
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.outputPortUnits[0]);
        ssSetOutputPortUnit(rts, 0, 0);
        _ssSetPortInfo2ForOutputCoSimAttribute(rts,
          &ds_fivezoneg36_dsrt_M->
          NonInlinedSFcns.Sfcn0.outputPortCoSimAttribute[0]);
        ssSetOutputPortIsContinuousQuantity(rts, 0, 0);

        /* port 0 */
        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 30);
          ssSetOutputPortSignal(rts, 0, ((real_T *) ds_fivezoneg36_dsrt_B.Sfunc));
        }
      }

      /* states */
      ssSetDiscStates(rts, (real_T *) &ds_fivezoneg36_dsrt_DW.Sfunc_DSTATE);

      /* path info */
      ssSetModelName(rts, "Sfunc");
      ssSetPath(rts, "ds_fivezoneg36_dsrt/behavior/DymolaBlock/Sfunc");
      ssSetRTModel(rts,ds_fivezoneg36_dsrt_M);
      ssSetParentSS(rts, (NULL));
      ssSetRootSS(rts, rts);
      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      /* parameters */
      {
        mxArray **sfcnParams = (mxArray **)
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.params;
        ssSetSFcnParamsCount(rts, 2);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)ds_fivezoneg36_dsrt_P.Sfunc_P1_Size);
        ssSetSFcnParam(rts, 1, (mxArray*)ds_fivezoneg36_dsrt_P.Sfunc_P2_Size);
      }

      /* work vectors */
      ssSetRWork(rts, (real_T *) &ds_fivezoneg36_dsrt_DW.Sfunc_RWORK[0]);
      ssSetPWork(rts, (void **) &ds_fivezoneg36_dsrt_DW.Sfunc_PWORK);

      {
        struct _ssDWorkRecord *dWorkRecord = (struct _ssDWorkRecord *)
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.dWork;
        struct _ssDWorkAuxRecord *dWorkAuxRecord = (struct _ssDWorkAuxRecord *)
          &ds_fivezoneg36_dsrt_M->NonInlinedSFcns.Sfcn0.dWorkAux;
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 3);

        /* RWORK */
        ssSetDWorkWidth(rts, 0, 39101);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWork(rts, 0, &ds_fivezoneg36_dsrt_DW.Sfunc_RWORK[0]);

        /* PWORK */
        ssSetDWorkWidth(rts, 1, 1);
        ssSetDWorkDataType(rts, 1,SS_POINTER);
        ssSetDWorkComplexSignal(rts, 1, 0);
        ssSetDWork(rts, 1, &ds_fivezoneg36_dsrt_DW.Sfunc_PWORK);

        /* DSTATE */
        ssSetDWorkWidth(rts, 2, 1);
        ssSetDWorkDataType(rts, 2,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 2, 0);
        ssSetDWorkUsedAsDState(rts, 2, 1);
        ssSetDWork(rts, 2, &ds_fivezoneg36_dsrt_DW.Sfunc_DSTATE);
      }

      /* registration */
      dspaceexample_f_dy975f7hqu(rts);
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
    ds_fivezoneg36_dsrt_rti_init_trc_pointers();
  }

  /* InitializeConditions for S-Function (dspaceexample_f_dy975f7hqu): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_f_dy975f7hqu) */
  {
    SimStruct *rts = ds_fivezoneg36_dsrt_M->childSfunctions[0];
    sfcnInitializeConditions(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }
}

/* Model terminate function */
void ds_fivezoneg36_dsrt_terminate(void)
{
  /* Terminate for S-Function (dspaceexample_f_dy975f7hqu): '<S4>/Sfunc' */
  /* Level2 S-Function Block: '<S4>/Sfunc' (dspaceexample_f_dy975f7hqu) */
  {
    SimStruct *rts = ds_fivezoneg36_dsrt_M->childSfunctions[0];
    sfcnTerminate(rts);
  }
}
