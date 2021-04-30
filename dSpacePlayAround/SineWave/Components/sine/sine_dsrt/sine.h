/*
 * sine.h
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

#ifndef RTW_HEADER_sine_h_
#define RTW_HEADER_sine_h_
#include <math.h>
#include <string.h>
#ifndef sine_COMMON_INCLUDES_
# define sine_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "sine_dsmpbap.h"
#endif                                 /* sine_COMMON_INCLUDES_ */

#include "sine_types.h"

/* Shared type includes */
#include "multiword_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block signals (default storage) */
typedef struct {
  real_T sine_o;                       /* '<S1>/sine' */
} B_sine_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T lastSin;                      /* '<S1>/sine' */
  real_T lastCos;                      /* '<S1>/sine' */
  int32_T systemEnable;                /* '<S1>/sine' */
} DW_sine_T;

/* Parameters (default storage) */
struct P_sine_T_ {
  real_T sine_Amp;                     /* Expression: 10
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_Bias;                    /* Expression: 0
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_Freq;                    /* Expression: 1/60
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_Hsin;                    /* Computed Parameter: sine_Hsin
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_HCos;                    /* Computed Parameter: sine_HCos
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_PSin;                    /* Computed Parameter: sine_PSin
                                        * Referenced by: '<S1>/sine'
                                        */
  real_T sine_PCos;                    /* Computed Parameter: sine_PCos
                                        * Referenced by: '<S1>/sine'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_sine_T {
  const char_T *errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
  } Timing;
};

/* Block parameters (default storage) */
extern P_sine_T sine_P;

/* Block signals (default storage) */
extern B_sine_T sine_B;

/* Block states (default storage) */
extern DW_sine_T sine_DW;

/* Model entry point functions */
extern void sine_initialize(void);
extern void sine_output(void);
extern void sine_update(void);
extern void sine_terminate(void);

/* Real-time Model object */
extern RT_MODEL_sine_T *const sine_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'sine'
 * '<S1>'   : 'sine/behavior'
 * '<S2>'   : 'sine/outputs'
 * '<S3>'   : 'sine/outputs/VoltageOut'
 */
#endif                                 /* RTW_HEADER_sine_h_ */
