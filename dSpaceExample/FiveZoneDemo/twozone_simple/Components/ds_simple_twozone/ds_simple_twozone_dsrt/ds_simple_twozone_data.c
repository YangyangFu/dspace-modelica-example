/*
 * ds_simple_twozone_data.c
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

#include "ds_simple_twozone.h"
#include "ds_simple_twozone_private.h"

/* Block parameters (default storage) */
P_ds_simple_twozone_T ds_simple_twozone_P = {
  /* Mask Parameter: TRoo1FtoV_xmax
   * Referenced by: '<S13>/range y // range x'
   */
  150.0,

  /* Mask Parameter: TRoo2FtoV_xmax
   * Referenced by: '<S14>/range y // range x'
   */
  150.0,

  /* Mask Parameter: TDis1FtoV_xmax
   * Referenced by: '<S10>/range y // range x'
   */
  150.0,

  /* Mask Parameter: TDis2FtoV_xmax
   * Referenced by: '<S11>/range y // range x'
   */
  150.0,

  /* Mask Parameter: VDis1ToV_xmax
   * Referenced by: '<S15>/range y // range x'
   */
  20000.0,

  /* Mask Parameter: VDis2ToV_xmax
   * Referenced by: '<S16>/range y // range x'
   */
  20000.0,

  /* Mask Parameter: TOutFtoV_xmax
   * Referenced by: '<S12>/range y // range x'
   */
  150.0,

  /* Mask Parameter: TRoo1FtoV_xmin
   * Referenced by:
   *   '<S13>/Subtract min x'
   *   '<S13>/range y // range x'
   */
  -150.0,

  /* Mask Parameter: TRoo2FtoV_xmin
   * Referenced by:
   *   '<S14>/Subtract min x'
   *   '<S14>/range y // range x'
   */
  -150.0,

  /* Mask Parameter: TDis1FtoV_xmin
   * Referenced by:
   *   '<S10>/Subtract min x'
   *   '<S10>/range y // range x'
   */
  -150.0,

  /* Mask Parameter: TDis2FtoV_xmin
   * Referenced by:
   *   '<S11>/Subtract min x'
   *   '<S11>/range y // range x'
   */
  -150.0,

  /* Mask Parameter: VDis1ToV_xmin
   * Referenced by:
   *   '<S15>/Subtract min x'
   *   '<S15>/range y // range x'
   */
  0.0,

  /* Mask Parameter: VDis2ToV_xmin
   * Referenced by:
   *   '<S16>/Subtract min x'
   *   '<S16>/range y // range x'
   */
  0.0,

  /* Mask Parameter: TOutFtoV_xmin
   * Referenced by:
   *   '<S12>/Subtract min x'
   *   '<S12>/range y // range x'
   */
  -150.0,

  /* Mask Parameter: TRoo1FtoV_ymax
   * Referenced by: '<S13>/range y // range x'
   */
  10.0,

  /* Mask Parameter: TRoo2FtoV_ymax
   * Referenced by: '<S14>/range y // range x'
   */
  10.0,

  /* Mask Parameter: TDis1FtoV_ymax
   * Referenced by: '<S10>/range y // range x'
   */
  10.0,

  /* Mask Parameter: TDis2FtoV_ymax
   * Referenced by: '<S11>/range y // range x'
   */
  10.0,

  /* Mask Parameter: VDis1ToV_ymax
   * Referenced by: '<S15>/range y // range x'
   */
  10.0,

  /* Mask Parameter: VDis2ToV_ymax
   * Referenced by: '<S16>/range y // range x'
   */
  10.0,

  /* Mask Parameter: TOutFtoV_ymax
   * Referenced by: '<S12>/range y // range x'
   */
  10.0,

  /* Mask Parameter: TRoo1FtoV_ymin
   * Referenced by:
   *   '<S13>/Add min y'
   *   '<S13>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: TRoo2FtoV_ymin
   * Referenced by:
   *   '<S14>/Add min y'
   *   '<S14>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: TDis1FtoV_ymin
   * Referenced by:
   *   '<S10>/Add min y'
   *   '<S10>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: TDis2FtoV_ymin
   * Referenced by:
   *   '<S11>/Add min y'
   *   '<S11>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: VDis1ToV_ymin
   * Referenced by:
   *   '<S15>/Add min y'
   *   '<S15>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: VDis2ToV_ymin
   * Referenced by:
   *   '<S16>/Add min y'
   *   '<S16>/range y // range x'
   */
  -10.0,

  /* Mask Parameter: TOutFtoV_ymin
   * Referenced by:
   *   '<S12>/Add min y'
   *   '<S12>/range y // range x'
   */
  -10.0,

  /* Expression: 0.5
   * Referenced by: '<S2>/Constant'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S2>/Constant1'
   */
  0.5,

  /* Computed Parameter: Sfunc_P1_Size
   * Referenced by: '<S4>/Sfunc'
   */
  { 856.0, 1.0 },

  /* Expression: [VRoo;vav1_vav_sta_default_p;vav1_vav_sta_default_T;vav1_vav_sta_default_X;vav1_vav_riseTime;vav1_vav_y_start;vav1_vav_filter_gain;vav1_vav_filter_A_ripple;vav1_vav_filter_f_min;vav1_vav_filter_normalize10;vav1_vav_filter_x_start;vav1_vav_filter_u_nominal;vav1_vav_use_deltaM;vav1_vav_deltaM;vav1_vav_roundDuct;vav1_vav_ReC;vav1_vav_a;vav1_vav_b;vav1_vav_yL;vav1_vav_yU;vav1_vav_k1;vav1_vav_l;vav1_vav_l2;vav1_vav_deltax;vav1_vav_y_min;vav1_terHea_bal1_preDro_s26;vav1_terHea_bal1_preDro_s27;vav1_terHea_bal1_preDro_s28;vav1_terHea_bal2_preDro_s29;vav1_terHea_bal2_preDro_s30;vav1_terHea_delta;vav1_terHea_T_a1_nominal;vav1_terHea_T_a2_nominal;vav1_terHea_r_nominal;vav1_terHea_hA_n_w;vav1_terHea_hA_n_a;vav1_terHea_hA_T0_w;vav1_terHea_hA_T0_a;vav1_sinTer_X;vav1_sinTer_p;vav1_sinTer_T;vav1_souTer_X;vav1_souTer_m_flow;vav1_souTer_T;zer_k;zon1_S_;zon1_E_;zon1_W_;zon1_N_;zon1_matExtWal_absIR_a;zon1_matExtWal_absIR_b;zon1_matExtWal_absSol_a;zon1_matExtWal_absSol_b;zon1_matExtWal_roughness_54;zon1_matFlo_absIR_ */
  { 129.6, 101325.0, 293.15, 0.01, 0.99, 120.0, 1.0, 1.0, 0.5, 0.0, 1.0, 0.0,
    0.0, 1.0, 1.0, 0.3, 0.0, 4000.0, -1.51, 9.45, 0.166666666666667,
    0.611111111111111, 0.45, 0.0001, 0.01, 0.02, 0.02, 101325.0, 293.15, 0.01,
    0.99, 300000.0, 293.15, 0.001, 289.85, 355.35, 0.666666666666667, 0.85, 0.8,
    293.15, 293.15, 1.0, 300000.0, 293.15, 1.0, 0.0, 323.15, 0.0, 0.0,
    -1.5707963267949, 1.5707963267949, 3.14159265358979, 0.9, 0.9, 0.6, 0.6, 3.0,
    0.9, 0.9, 0.6, 0.6, 3.0, 0.9, 0.9, 0.6, 0.6, 3.0, 0.003175, 1.06, 0.86156,
    0.0434, 0.0434, 0.0, 0.9, 0.9, 0.003175, 1.06, 0.86156, 0.0434, 0.0434, 0.0,
    0.9, 0.9, 0.013, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737, 0.012324,
    0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0, 0.8, 0.5,
    48.0, 283.15, 283.75, 1.0, 48.0, 1.0, 16.2, 1.0, 16.2, 1.0, 21.6, 1.0, 21.6,
    2.0, 6.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 48.0, 0.0,
    0.84, 0.84, 1.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075,
    0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737,
    0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0,
    0.8, 0.5, 48.0, 2.7, 0.0, 1.0, 3.0, 331.4, 1.0, 3.0, 10.0, 0.2, 1.0, 1.0,
    0.2, 1.0, 1.0, 0.2, 1.0, 1.0, 0.2, 1.0, 1.0, 0.0, 0.0, 0.2, 1.0, 1.0, 293.15,
    0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075, 0.0,
    0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737, 0.012324,
    0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0, 0.8, 0.5,
    0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075, 0.0,
    0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737, 0.012324,
    0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0, 0.8, 0.5,
    0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075, 0.0,
    0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737, 0.012324,
    0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0, 0.8, 0.5,
    0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075, 0.0,
    0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737, 0.012324,
    0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0, 0.8, 0.5,
    293.15, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834, 0.075, 0.075,
    0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8, 1002.737,
    0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0, 0.0, 3.0,
    0.8, 0.5, 1.0, 1.0, 1.0, 101325.0, 293.15, 0.01, 0.99, 4.0, 6.0, 2.0, 283.15,
    0.0, 101325.0, 0.018, 0.0, 101325.0, 0.0, 0.1, 28800.0, 0.1, 28800.0, 1.0,
    64800.0, 1.0, 64800.0, 0.1, 86400.0, 0.1, 1.0, 2.0, 0.0, 0.0, 1.0, 101325.0,
    293.15, 283.15, 273.15, 0.5, 1.0, 1.0, 0.0, 20000.0, 0.5, 0.5, 0.0, 203.15,
    343.15, 203.15, 343.15, 1.0, 1.0, 0.0, 0.0, 343.15, 101325.0, 293.15, 0.01,
    0.99, 0.0, -1.5707963267949, 1.5707963267949, 3.14159265358979, 0.9, 0.9,
    0.6, 0.6, 3.0, 0.9, 0.9, 0.6, 0.6, 3.0, 0.9, 0.9, 0.6, 0.6, 3.0, 0.003175,
    1.06, 0.86156, 0.0434, 0.0434, 0.0, 0.9, 0.9, 0.003175, 1.06, 0.86156,
    0.0434, 0.0434, 0.0, 0.9, 0.9, 0.013, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8,
    1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0,
    0.0, 3.0, 0.8, 0.5, 48.0, 283.15, 283.75, 1.0, 48.0, 1.0, 16.2, 1.0, 16.2,
    1.0, 21.6, 1.0, 21.6, 2.0, 6.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0,
    0.0, 0.0, 1.0, 48.0, 0.0, 0.84, 0.84, 1.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003,
    1.0, 0.834, 0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6,
    4.94E-8, 1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84,
    0.84, 0.0, 0.0, 3.0, 0.8, 0.5, 48.0, 2.7, 0.0, 1.0, 3.0, 331.4, 1.0, 3.0,
    10.0, 0.2, 1.0, 1.0, 0.2, 1.0, 1.0, 0.2, 1.0, 1.0, 0.2, 1.0, 1.0, 0.0, 0.0,
    0.2, 1.0, 1.0, 293.15, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834,
    0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8,
    1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0,
    0.0, 3.0, 0.8, 0.5, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834,
    0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8,
    1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0,
    0.0, 3.0, 0.8, 0.5, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834,
    0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8,
    1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0,
    0.0, 3.0, 0.8, 0.5, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0, 0.834,
    0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6, 4.94E-8,
    1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84, 0.84, 0.0,
    0.0, 3.0, 0.8, 0.5, 293.15, 0.0, 0.0, 0.9, 0.9, 0.5, 0.5, 3.0, 0.003, 1.0,
    0.834, 0.075, 0.075, 0.0, 0.84, 0.84, -1.0, 0.002873, 7.76E-5, 3.723E-6,
    4.94E-8, 1002.737, 0.012324, 0.02897, 101325.0, 0.1, 0.1, 0.8, 0.8, 0.84,
    0.84, 0.0, 0.0, 3.0, 0.8, 0.5, 1.0, 1.0, 1.0, 101325.0, 293.15, 0.01, 0.99,
    4.0, 6.0, 2.0, 283.15, 0.0, 101325.0, 0.018, 0.0, 101325.0, 0.0, 0.1,
    28800.0, 0.1, 28800.0, 1.0, 64800.0, 1.0, 64800.0, 0.1, 86400.0, 0.1, 1.0,
    2.0, 0.0, 0.0, 1.0, 101325.0, 293.15, 0.01, 0.99, 120.0, 1.0, 1.0, 0.5, 0.0,
    1.0, 0.0, 0.0, 1.0, 1.0, 0.3, 0.0, 4000.0, -1.51, 9.45, 0.166666666666667,
    0.611111111111111, 0.45, 0.0001, 0.01, 0.02, 0.02, 101325.0, 293.15, 0.01,
    0.99, 300000.0, 293.15, 0.001, 289.85, 355.35, 0.666666666666667, 0.85, 0.8,
    293.15, 293.15, 1.0, 300000.0, 293.15, 1.0, 0.0, 323.15, 0.01, 0.99, 285.15,
    101325.0, 293.15, 0.01, 0.99, 293.15, 101325.0, 0.01, 0.99, 293.15, 101325.0,
    0.01, 0.99, 293.15, 293.15, 1200.0, 293.15, 293.15, 1200.0, 293.15, 293.15,
    293.15, 293.15, 293.15, 293.15 },

  /* Computed Parameter: Sfunc_P2_Size
   * Referenced by: '<S4>/Sfunc'
   */
  { 0.0, 0.0 },

  /* Expression: 273.15
   * Referenced by: '<S5>/zerC'
   */
  273.15,

  /* Expression: 9/5
   * Referenced by: '<S5>/Gain'
   */
  1.8,

  /* Expression: 32
   * Referenced by: '<S5>/Bias'
   */
  32.0,

  /* Expression: 273.15
   * Referenced by: '<S6>/zerC'
   */
  273.15,

  /* Expression: 9/5
   * Referenced by: '<S6>/Gain'
   */
  1.8,

  /* Expression: 32
   * Referenced by: '<S6>/Bias'
   */
  32.0,

  /* Expression: 273.15
   * Referenced by: '<S7>/zerC'
   */
  273.15,

  /* Expression: 9/5
   * Referenced by: '<S7>/Gain'
   */
  1.8,

  /* Expression: 32
   * Referenced by: '<S7>/Bias'
   */
  32.0,

  /* Expression: 273.15
   * Referenced by: '<S8>/zerC'
   */
  273.15,

  /* Expression: 9/5
   * Referenced by: '<S8>/Gain'
   */
  1.8,

  /* Expression: 32
   * Referenced by: '<S8>/Bias'
   */
  32.0,

  /* Expression: 2118.8799727597
   * Referenced by: '<S1>/toCFM'
   */
  2118.8799727597,

  /* Expression: 2118.8799727597
   * Referenced by: '<S1>/toCFM1'
   */
  2118.8799727597,

  /* Expression: 273.15
   * Referenced by: '<S9>/zerC'
   */
  273.15,

  /* Expression: 9/5
   * Referenced by: '<S9>/Gain'
   */
  1.8,

  /* Expression: 32
   * Referenced by: '<S9>/Bias'
   */
  32.0
};
