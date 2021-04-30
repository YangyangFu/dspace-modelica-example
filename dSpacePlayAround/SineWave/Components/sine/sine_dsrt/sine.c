/*
 * sine.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sine".
 *
 * Model version              : 1.21
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C source code generated on : Fri Mar 26 18:27:01 2021
 *
 * Target selection: dsrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Custom Processor->Custom
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "sine_dsrtvdf.h"
#include "sine.h"
#include "sine_private.h"

/* Block signals (default storage) */
B_sine_T sine_B;

/* Block states (default storage) */
DW_sine_T sine_DW;

/* Real-time model */
RT_MODEL_sine_T sine_M_;
RT_MODEL_sine_T *const sine_M = &sine_M_;

/* Model output function */
void sine_output(void)
{
  /* user code (Output function Body) */
  {
    /* Function module access point of system <Root>    */
    ap_entry_sine_SIDRoot_TID0();
  }

  /* Sin: '<S1>/sine' */
  if (sine_DW.systemEnable != 0) {
    sine_DW.lastSin = sin(sine_P.sine_Freq * (((sine_M->Timing.clockTick0+
      sine_M->Timing.clockTickH0* 4294967296.0)) * 0.001));
    sine_DW.lastCos = cos(sine_P.sine_Freq * (((sine_M->Timing.clockTick0+
      sine_M->Timing.clockTickH0* 4294967296.0)) * 0.001));
    sine_DW.systemEnable = 0;
  }

  sine_B.sine_o = ((sine_DW.lastSin * sine_P.sine_PCos + sine_DW.lastCos *
                    sine_P.sine_PSin) * sine_P.sine_HCos + (sine_DW.lastCos *
    sine_P.sine_PCos - sine_DW.lastSin * sine_P.sine_PSin) * sine_P.sine_Hsin) *
    sine_P.sine_Amp + sine_P.sine_Bias;

  /* End of Sin: '<S1>/sine' */

  /* S-Function (dsmpb_dataoutport): '<S3>/Data Outport S-Fcn' */

  /* Write access point of block sine/outputs/VoltageOut non-bus port 1 */
  ap_write_sine_DataOutport1_P1_S1(&sine_B.sine_o);

  /* user code (Output function Trailer) */
  {
    /* Function module access point of system <Root>    */
    ap_exit_sine_SIDRoot_TID0();
  }
}

/* Model update function */
void sine_update(void)
{
  real_T HoldSine;
  real_T HoldCosine;

  /* Update for Sin: '<S1>/sine' */
  HoldSine = sine_DW.lastSin;
  HoldCosine = sine_DW.lastCos;
  sine_DW.lastSin = HoldSine * sine_P.sine_HCos + HoldCosine * sine_P.sine_Hsin;
  sine_DW.lastCos = HoldCosine * sine_P.sine_HCos - HoldSine * sine_P.sine_Hsin;

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.001, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  sine_M->Timing.clockTick0++;
  if (!sine_M->Timing.clockTick0) {
    sine_M->Timing.clockTickH0++;
  }
}

/* Model initialize function */
void sine_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)sine_M, 0,
                sizeof(RT_MODEL_sine_T));

  /* block I/O */
  (void) memset(((void *) &sine_B), 0,
                sizeof(B_sine_T));

  /* states (dwork) */
  (void) memset((void *)&sine_DW, 0,
                sizeof(DW_sine_T));

  {
    /* user code (registration function declaration) */
    /*Initialize global TRC pointers. */
    sine_rti_init_trc_pointers();
  }

  /* Enable for Sin: '<S1>/sine' */
  sine_DW.systemEnable = 1;
}

/* Model terminate function */
void sine_terminate(void)
{
  /* (no terminate code required) */
}
