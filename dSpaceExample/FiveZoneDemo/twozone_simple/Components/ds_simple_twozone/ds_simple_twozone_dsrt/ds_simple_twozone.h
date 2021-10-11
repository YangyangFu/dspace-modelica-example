/*
 * ds_simple_twozone.h
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

#ifndef RTW_HEADER_ds_simple_twozone_h_
#define RTW_HEADER_ds_simple_twozone_h_
#include <stddef.h>
#include <string.h>
#ifndef ds_simple_twozone_COMMON_INCLUDES_
# define ds_simple_twozone_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "ds_simple_twozone_dsmpbap.h"
#endif                                 /* ds_simple_twozone_COMMON_INCLUDES_ */

#include "ds_simple_twozone_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
# define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
# define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
# define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
# define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetSampleHitArray
# define rtmGetSampleHitArray(rtm)     ((rtm)->Timing.sampleHitArray)
#endif

#ifndef rtmGetStepSize
# define rtmGetStepSize(rtm)           ((rtm)->Timing.stepSize)
#endif

#ifndef rtmGetZCCacheNeedsReset
# define rtmGetZCCacheNeedsReset(rtm)  ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
# define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGet_TimeOfLastOutput
# define rtmGet_TimeOfLastOutput(rtm)  ((rtm)->Timing.timeOfLastOutput)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

#ifndef rtmGetTStart
# define rtmGetTStart(rtm)             ((rtm)->Timing.tStart)
#endif

#ifndef rtmGetTimeOfLastOutput
# define rtmGetTimeOfLastOutput(rtm)   ((rtm)->Timing.timeOfLastOutput)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T Constant;                     /* '<S2>/Constant' */
  real_T Constant1;                    /* '<S2>/Constant1' */
  real_T TmpSignalConversionAtSfuncInpor[2];
  real_T Sfunc[28];                    /* '<S4>/Sfunc' */
  real_T KtoC;                         /* '<S5>/KtoC' */
  real_T Gain;                         /* '<S5>/Gain' */
  real_T Bias;                         /* '<S5>/Bias' */
  real_T Subtractminx;                 /* '<S13>/Subtract min x' */
  real_T rangeyrangex;                 /* '<S13>/range y // range x' */
  real_T Addminy;                      /* '<S13>/Add min y' */
  real_T KtoC_o;                       /* '<S6>/KtoC' */
  real_T Gain_l;                       /* '<S6>/Gain' */
  real_T Bias_n;                       /* '<S6>/Bias' */
  real_T Subtractminx_j;               /* '<S14>/Subtract min x' */
  real_T rangeyrangex_b;               /* '<S14>/range y // range x' */
  real_T Addminy_i;                    /* '<S14>/Add min y' */
  real_T KtoC_g;                       /* '<S7>/KtoC' */
  real_T Gain_p;                       /* '<S7>/Gain' */
  real_T Bias_i;                       /* '<S7>/Bias' */
  real_T Subtractminx_k;               /* '<S10>/Subtract min x' */
  real_T rangeyrangex_k;               /* '<S10>/range y // range x' */
  real_T Addminy_n;                    /* '<S10>/Add min y' */
  real_T KtoC_a;                       /* '<S8>/KtoC' */
  real_T Gain_i;                       /* '<S8>/Gain' */
  real_T Bias_g;                       /* '<S8>/Bias' */
  real_T Subtractminx_p;               /* '<S11>/Subtract min x' */
  real_T rangeyrangex_j;               /* '<S11>/range y // range x' */
  real_T Addminy_m;                    /* '<S11>/Add min y' */
  real_T toCFM;                        /* '<S1>/toCFM' */
  real_T Subtractminx_n;               /* '<S15>/Subtract min x' */
  real_T rangeyrangex_je;              /* '<S15>/range y // range x' */
  real_T Addminy_b;                    /* '<S15>/Add min y' */
  real_T toCFM1;                       /* '<S1>/toCFM1' */
  real_T Subtractminx_m;               /* '<S16>/Subtract min x' */
  real_T rangeyrangex_o;               /* '<S16>/range y // range x' */
  real_T Addminy_k;                    /* '<S16>/Add min y' */
  real_T KtoC_l;                       /* '<S9>/KtoC' */
  real_T Gain_h;                       /* '<S9>/Gain' */
  real_T Bias_j;                       /* '<S9>/Bias' */
  real_T Subtractminx_d;               /* '<S12>/Subtract min x' */
  real_T rangeyrangex_d;               /* '<S12>/range y // range x' */
  real_T Addminy_l;                    /* '<S12>/Add min y' */
} B_ds_simple_twozone_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Sfunc_DSTATE;                 /* '<S4>/Sfunc' */
  real_T Sfunc_RWORK[19117];           /* '<S4>/Sfunc' */
  void *Sfunc_PWORK;                   /* '<S4>/Sfunc' */
} DW_ds_simple_twozone_T;

/* Parameters (default storage) */
struct P_ds_simple_twozone_T_ {
  real_T TRoo1FtoV_xmax;               /* Mask Parameter: TRoo1FtoV_xmax
                                        * Referenced by: '<S13>/range y // range x'
                                        */
  real_T TRoo2FtoV_xmax;               /* Mask Parameter: TRoo2FtoV_xmax
                                        * Referenced by: '<S14>/range y // range x'
                                        */
  real_T TDis1FtoV_xmax;               /* Mask Parameter: TDis1FtoV_xmax
                                        * Referenced by: '<S10>/range y // range x'
                                        */
  real_T TDis2FtoV_xmax;               /* Mask Parameter: TDis2FtoV_xmax
                                        * Referenced by: '<S11>/range y // range x'
                                        */
  real_T VDis1ToV_xmax;                /* Mask Parameter: VDis1ToV_xmax
                                        * Referenced by: '<S15>/range y // range x'
                                        */
  real_T VDis2ToV_xmax;                /* Mask Parameter: VDis2ToV_xmax
                                        * Referenced by: '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_xmax;                /* Mask Parameter: TOutFtoV_xmax
                                        * Referenced by: '<S12>/range y // range x'
                                        */
  real_T TRoo1FtoV_xmin;               /* Mask Parameter: TRoo1FtoV_xmin
                                        * Referenced by:
                                        *   '<S13>/Subtract min x'
                                        *   '<S13>/range y // range x'
                                        */
  real_T TRoo2FtoV_xmin;               /* Mask Parameter: TRoo2FtoV_xmin
                                        * Referenced by:
                                        *   '<S14>/Subtract min x'
                                        *   '<S14>/range y // range x'
                                        */
  real_T TDis1FtoV_xmin;               /* Mask Parameter: TDis1FtoV_xmin
                                        * Referenced by:
                                        *   '<S10>/Subtract min x'
                                        *   '<S10>/range y // range x'
                                        */
  real_T TDis2FtoV_xmin;               /* Mask Parameter: TDis2FtoV_xmin
                                        * Referenced by:
                                        *   '<S11>/Subtract min x'
                                        *   '<S11>/range y // range x'
                                        */
  real_T VDis1ToV_xmin;                /* Mask Parameter: VDis1ToV_xmin
                                        * Referenced by:
                                        *   '<S15>/Subtract min x'
                                        *   '<S15>/range y // range x'
                                        */
  real_T VDis2ToV_xmin;                /* Mask Parameter: VDis2ToV_xmin
                                        * Referenced by:
                                        *   '<S16>/Subtract min x'
                                        *   '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_xmin;                /* Mask Parameter: TOutFtoV_xmin
                                        * Referenced by:
                                        *   '<S12>/Subtract min x'
                                        *   '<S12>/range y // range x'
                                        */
  real_T TRoo1FtoV_ymax;               /* Mask Parameter: TRoo1FtoV_ymax
                                        * Referenced by: '<S13>/range y // range x'
                                        */
  real_T TRoo2FtoV_ymax;               /* Mask Parameter: TRoo2FtoV_ymax
                                        * Referenced by: '<S14>/range y // range x'
                                        */
  real_T TDis1FtoV_ymax;               /* Mask Parameter: TDis1FtoV_ymax
                                        * Referenced by: '<S10>/range y // range x'
                                        */
  real_T TDis2FtoV_ymax;               /* Mask Parameter: TDis2FtoV_ymax
                                        * Referenced by: '<S11>/range y // range x'
                                        */
  real_T VDis1ToV_ymax;                /* Mask Parameter: VDis1ToV_ymax
                                        * Referenced by: '<S15>/range y // range x'
                                        */
  real_T VDis2ToV_ymax;                /* Mask Parameter: VDis2ToV_ymax
                                        * Referenced by: '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_ymax;                /* Mask Parameter: TOutFtoV_ymax
                                        * Referenced by: '<S12>/range y // range x'
                                        */
  real_T TRoo1FtoV_ymin;               /* Mask Parameter: TRoo1FtoV_ymin
                                        * Referenced by:
                                        *   '<S13>/Add min y'
                                        *   '<S13>/range y // range x'
                                        */
  real_T TRoo2FtoV_ymin;               /* Mask Parameter: TRoo2FtoV_ymin
                                        * Referenced by:
                                        *   '<S14>/Add min y'
                                        *   '<S14>/range y // range x'
                                        */
  real_T TDis1FtoV_ymin;               /* Mask Parameter: TDis1FtoV_ymin
                                        * Referenced by:
                                        *   '<S10>/Add min y'
                                        *   '<S10>/range y // range x'
                                        */
  real_T TDis2FtoV_ymin;               /* Mask Parameter: TDis2FtoV_ymin
                                        * Referenced by:
                                        *   '<S11>/Add min y'
                                        *   '<S11>/range y // range x'
                                        */
  real_T VDis1ToV_ymin;                /* Mask Parameter: VDis1ToV_ymin
                                        * Referenced by:
                                        *   '<S15>/Add min y'
                                        *   '<S15>/range y // range x'
                                        */
  real_T VDis2ToV_ymin;                /* Mask Parameter: VDis2ToV_ymin
                                        * Referenced by:
                                        *   '<S16>/Add min y'
                                        *   '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_ymin;                /* Mask Parameter: TOutFtoV_ymin
                                        * Referenced by:
                                        *   '<S12>/Add min y'
                                        *   '<S12>/range y // range x'
                                        */
  real_T Constant_Value;               /* Expression: 0.5
                                        * Referenced by: '<S2>/Constant'
                                        */
  real_T Constant1_Value;              /* Expression: 0.5
                                        * Referenced by: '<S2>/Constant1'
                                        */
  real_T Sfunc_P1_Size[2];             /* Computed Parameter: Sfunc_P1_Size
                                        * Referenced by: '<S4>/Sfunc'
                                        */
  real_T Sfunc_P1[856];
  /* Expression: [VRoo;vav1_vav_sta_default_p;vav1_vav_sta_default_T;vav1_vav_sta_default_X;vav1_vav_riseTime;vav1_vav_y_start;vav1_vav_filter_gain;vav1_vav_filter_A_ripple;vav1_vav_filter_f_min;vav1_vav_filter_normalize10;vav1_vav_filter_x_start;vav1_vav_filter_u_nominal;vav1_vav_use_deltaM;vav1_vav_deltaM;vav1_vav_roundDuct;vav1_vav_ReC;vav1_vav_a;vav1_vav_b;vav1_vav_yL;vav1_vav_yU;vav1_vav_k1;vav1_vav_l;vav1_vav_l2;vav1_vav_deltax;vav1_vav_y_min;vav1_terHea_bal1_preDro_s26;vav1_terHea_bal1_preDro_s27;vav1_terHea_bal1_preDro_s28;vav1_terHea_bal2_preDro_s29;vav1_terHea_bal2_preDro_s30;vav1_terHea_delta;vav1_terHea_T_a1_nominal;vav1_terHea_T_a2_nominal;vav1_terHea_r_nominal;vav1_terHea_hA_n_w;vav1_terHea_hA_n_a;vav1_terHea_hA_T0_w;vav1_terHea_hA_T0_a;vav1_sinTer_X;vav1_sinTer_p;vav1_sinTer_T;vav1_souTer_X;vav1_souTer_m_flow;vav1_souTer_T;zer_k;zon1_S_;zon1_E_;zon1_W_;zon1_N_;zon1_matExtWal_absIR_a;zon1_matExtWal_absIR_b;zon1_matExtWal_absSol_a;zon1_matExtWal_absSol_b;zon1_matExtWal_roughness_54;zon1_matFlo_absIR_a;zon1_matFlo_absIR_b;zon1_matFlo_absSol_a;zon1_matFlo_absSol_b;zon1_matFlo_roughness_a;zon1_roof_absIR_a;zon1_roof_absIR_b;zon1_roof_absSol_a;zon1_roof_absSol_b;zon1_roof_roughness_a;zon1_window600_glass_1__x;zon1_window600_glass_1__k;zon1_window600_glass_1__t67;zon1_window600_glass_1__r68;zon1_window600_glass_1__r69;zon1_window600_glass_1__t70;zon1_window600_glass_1__a71;zon1_window600_glass_1__a72;zon1_window600_glass_2__x;zon1_window600_glass_2__k;zon1_window600_glass_2__t75;zon1_window600_glass_2__r76;zon1_window600_glass_2__r77;zon1_window600_glass_2__t78;zon1_window600_glass_2__a79;zon1_window600_glass_2__a80;zon1_window600_gas_1__x;zon1_window600_gas_1__a_k;zon1_window600_gas_1__b_k;zon1_window600_gas_1__a_m84;zon1_window600_gas_1__b_m85;zon1_window600_gas_1__a_c;zon1_window600_gas_1__b_c;zon1_window600_gas_1__MM;zon1_window600_gas_1__P0;zon1_window600_shade_tauS90;zon1_window600_shade_tauS91;zon1_window600_shade_rhoS92;zon1_window600_shade_rhoS93;zon1_window600_shade_absI94;zon1_window600_shade_absI95;zon1_window600_shade_tauI96;zon1_window600_shade_tauI97;zon1_window600_UFra;zon1_window600_absIRFra;zon1_window600_absSolFra;zon1_soi_A;zon1_soi_T_a_start;zon1_soi_T_b_start;zon1_roo_datConExt_1__bou104;zon1_roo_datConExt_1__A;zon1_roo_datConExt_2__bou106;zon1_roo_datConExt_2__A;zon1_roo_datConExt_3__bou108;zon1_roo_datConExt_3__A;zon1_roo_datConExt_4__bou110;zon1_roo_datConExt_4__A;zon1_roo_datConExtWin_1__112;zon1_roo_datConExtWin_1__113;zon1_roo_datConExtWin_1__114;zon1_roo_datConExtWin_1__115;zon1_roo_datConExtWin_1__116;zon1_roo_datConExtWin_1__117;zon1_roo_datConExtWin_1__118;zon1_roo_datConExtWin_1__119;zon1_roo_datConExtWin_1__120;zon1_roo_datConExtWin_1__121;zon1_roo_datConPar_1__azi;zon1_roo_datConPar_1__bou123;zon1_roo_datConPar_1__A;zon1_roo_datConBou_1__azi;zon1_roo_datConBou_1__bou126;zon1_roo_datConBou_1__A;zon1_roo_surBou_1__A;zon1_roo_surBou_1__absIR;zon1_roo_surBou_1__absSol;zon1_roo_surBou_1__bounda131;zon1_roo_dummyCon_absIR_a;zon1_roo_dummyCon_absIR_b;zon1_roo_dummyCon_absSol_134;zon1_roo_dummyCon_absSol_135;zon1_roo_dummyCon_roughne136;zon1_roo_dummyGlaSys_glas137;zon1_roo_dummyGlaSys_glas138;zon1_roo_dummyGlaSys_glas139;zon1_roo_dummyGlaSys_glas140;zon1_roo_dummyGlaSys_glas141;zon1_roo_dummyGlaSys_glas142;zon1_roo_dummyGlaSys_glas143;zon1_roo_dummyGlaSys_glas144;zon1_roo_dummyGlaSys_gas_145;zon1_roo_dummyGlaSys_gas_146;zon1_roo_dummyGlaSys_gas_147;zon1_roo_dummyGlaSys_gas_148;zon1_roo_dummyGlaSys_gas_149;zon1_roo_dummyGlaSys_gas_150;zon1_roo_dummyGlaSys_gas_151;zon1_roo_dummyGlaSys_gas_152;zon1_roo_dummyGlaSys_gas_153;zon1_roo_dummyGlaSys_shad154;zon1_roo_dummyGlaSys_shad155;zon1_roo_dummyGlaSys_shad156;zon1_roo_dummyGlaSys_shad157;zon1_roo_dummyGlaSys_shad158;zon1_roo_dummyGlaSys_shad159;zon1_roo_dummyGlaSys_shad160;zon1_roo_dummyGlaSys_shad161;zon1_roo_dummyGlaSys_UFra;zon1_roo_dummyGlaSys_absI163;zon1_roo_dummyGlaSys_absS164;zon1_roo_AFlo;zon1_roo_hRoo;zon1_roo_conExtWin_1__gla167;zon1_roo_conExtWin_1__win168;zon1_roo_conExtWin_1__win169;zon1_roo_conExtWin_1__win170;zon1_roo_conExtWin_1__win171;zon1_roo_hIntFixed;zon1_roo_hExtFixed;zon1_roo_bouConExt_HDifTi174;zon1_roo_bouConExt_HDifTi175;zon1_roo_bouConExt_HDifTi176;zon1_roo_bouConExt_HDifTi177;zon1_roo_bouConExt_HDifTi178;zon1_roo_bouConExt_HDifTi179;zon1_roo_bouConExt_HDifTi180;zon1_roo_bouConExt_HDifTi181;zon1_roo_bouConExt_HDifTi182;zon1_roo_bouConExt_HDifTi183;zon1_roo_bouConExt_HDifTi184;zon1_roo_bouConExt_HDifTi185;zon1_roo_bouConExtWin_con186;zon1_roo_bouConExtWin_con187;zon1_roo_bouConExtWin_HDi188;zon1_roo_bouConExtWin_HDi189;zon1_roo_bouConExtWin_HDi190;zon1_roo_bouConExtWin_con191;zon1_roo_air_datConExtWin192;zon1_roo_air_datConExtWin193;zon1_roo_air_dummyCon_abs194;zon1_roo_air_dummyCon_abs195;zon1_roo_air_dummyCon_abs196;zon1_roo_air_dummyCon_abs197;zon1_roo_air_dummyCon_rou198;zon1_roo_air_dummyGlaSys_199;zon1_roo_air_dummyGlaSys_200;zon1_roo_air_dummyGlaSys_201;zon1_roo_air_dummyGlaSys_202;zon1_roo_air_dummyGlaSys_203;zon1_roo_air_dummyGlaSys_204;zon1_roo_air_dummyGlaSys_205;zon1_roo_air_dummyGlaSys_206;zon1_roo_air_dummyGlaSys_207;zon1_roo_air_dummyGlaSys_208;zon1_roo_air_dummyGlaSys_209;zon1_roo_air_dummyGlaSys_210;zon1_roo_air_dummyGlaSys_211;zon1_roo_air_dummyGlaSys_212;zon1_roo_air_dummyGlaSys_213;zon1_roo_air_dummyGlaSys_214;zon1_roo_air_dummyGlaSys_215;zon1_roo_air_dummyGlaSys_216;zon1_roo_air_dummyGlaSys_217;zon1_roo_air_dummyGlaSys_218;zon1_roo_air_dummyGlaSys_219;zon1_roo_air_dummyGlaSys_220;zon1_roo_air_dummyGlaSys_221;zon1_roo_air_dummyGlaSys_222;zon1_roo_air_dummyGlaSys_223;zon1_roo_air_dummyGlaSys_224;zon1_roo_air_dummyGlaSys_225;zon1_roo_air_dummyGlaSys_226;zon1_roo_solRadExc_datCon227;zon1_roo_solRadExc_datCon228;zon1_roo_solRadExc_dummyC229;zon1_roo_solRadExc_dummyC230;zon1_roo_solRadExc_dummyC231;zon1_roo_solRadExc_dummyC232;zon1_roo_solRadExc_dummyC233;zon1_roo_solRadExc_dummyG234;zon1_roo_solRadExc_dummyG235;zon1_roo_solRadExc_dummyG236;zon1_roo_solRadExc_dummyG237;zon1_roo_solRadExc_dummyG238;zon1_roo_solRadExc_dummyG239;zon1_roo_solRadExc_dummyG240;zon1_roo_solRadExc_dummyG241;zon1_roo_solRadExc_dummyG242;zon1_roo_solRadExc_dummyG243;zon1_roo_solRadExc_dummyG244;zon1_roo_solRadExc_dummyG245;zon1_roo_solRadExc_dummyG246;zon1_roo_solRadExc_dummyG247;zon1_roo_solRadExc_dummyG248;zon1_roo_solRadExc_dummyG249;zon1_roo_solRadExc_dummyG250;zon1_roo_solRadExc_dummyG251;zon1_roo_solRadExc_dummyG252;zon1_roo_solRadExc_dummyG253;zon1_roo_solRadExc_dummyG254;zon1_roo_solRadExc_dummyG255;zon1_roo_solRadExc_dummyG256;zon1_roo_solRadExc_dummyG257;zon1_roo_solRadExc_dummyG258;zon1_roo_solRadExc_dummyG259;zon1_roo_solRadExc_dummyG260;zon1_roo_solRadExc_dummyG261;zon1_roo_irRadGai_datConE262;zon1_roo_irRadGai_datConE263;zon1_roo_irRadGai_dummyCo264;zon1_roo_irRadGai_dummyCo265;zon1_roo_irRadGai_dummyCo266;zon1_roo_irRadGai_dummyCo267;zon1_roo_irRadGai_dummyCo268;zon1_roo_irRadGai_dummyGl269;zon1_roo_irRadGai_dummyGl270;zon1_roo_irRadGai_dummyGl271;zon1_roo_irRadGai_dummyGl272;zon1_roo_irRadGai_dummyGl273;zon1_roo_irRadGai_dummyGl274;zon1_roo_irRadGai_dummyGl275;zon1_roo_irRadGai_dummyGl276;zon1_roo_irRadGai_dummyGl277;zon1_roo_irRadGai_dummyGl278;zon1_roo_irRadGai_dummyGl279;zon1_roo_irRadGai_dummyGl280;zon1_roo_irRadGai_dummyGl281;zon1_roo_irRadGai_dummyGl282;zon1_roo_irRadGai_dummyGl283;zon1_roo_irRadGai_dummyGl284;zon1_roo_irRadGai_dummyGl285;zon1_roo_irRadGai_dummyGl286;zon1_roo_irRadGai_dummyGl287;zon1_roo_irRadGai_dummyGl288;zon1_roo_irRadGai_dummyGl289;zon1_roo_irRadGai_dummyGl290;zon1_roo_irRadGai_dummyGl291;zon1_roo_irRadGai_dummyGl292;zon1_roo_irRadGai_dummyGl293;zon1_roo_irRadGai_dummyGl294;zon1_roo_irRadGai_dummyGl295;zon1_roo_irRadGai_dummyGl296;zon1_roo_irRadExc_datConE297;zon1_roo_irRadExc_datConE298;zon1_roo_irRadExc_dummyCo299;zon1_roo_irRadExc_dummyCo300;zon1_roo_irRadExc_dummyCo301;zon1_roo_irRadExc_dummyCo302;zon1_roo_irRadExc_dummyCo303;zon1_roo_irRadExc_dummyGl304;zon1_roo_irRadExc_dummyGl305;zon1_roo_irRadExc_dummyGl306;zon1_roo_irRadExc_dummyGl307;zon1_roo_irRadExc_dummyGl308;zon1_roo_irRadExc_dummyGl309;zon1_roo_irRadExc_dummyGl310;zon1_roo_irRadExc_dummyGl311;zon1_roo_irRadExc_dummyGl312;zon1_roo_irRadExc_dummyGl313;zon1_roo_irRadExc_dummyGl314;zon1_roo_irRadExc_dummyGl315;zon1_roo_irRadExc_dummyGl316;zon1_roo_irRadExc_dummyGl317;zon1_roo_irRadExc_dummyGl318;zon1_roo_irRadExc_dummyGl319;zon1_roo_irRadExc_dummyGl320;zon1_roo_irRadExc_dummyGl321;zon1_roo_irRadExc_dummyGl322;zon1_roo_irRadExc_dummyGl323;zon1_roo_irRadExc_dummyGl324;zon1_roo_irRadExc_dummyGl325;zon1_roo_irRadExc_dummyGl326;zon1_roo_irRadExc_dummyGl327;zon1_roo_irRadExc_dummyGl328;zon1_roo_irRadExc_dummyGl329;zon1_roo_irRadExc_dummyGl330;zon1_roo_irRadExc_dummyGl331;zon1_roo_irRadExc_T0;zon1_roo_radTem_datConExt333;zon1_roo_radTem_datConExt334;zon1_roo_radTem_dummyCon_335;zon1_roo_radTem_dummyCon_336;zon1_roo_radTem_dummyCon_337;zon1_roo_radTem_dummyCon_338;zon1_roo_radTem_dummyCon_339;zon1_roo_radTem_dummyGlaS340;zon1_roo_radTem_dummyGlaS341;zon1_roo_radTem_dummyGlaS342;zon1_roo_radTem_dummyGlaS343;zon1_roo_radTem_dummyGlaS344;zon1_roo_radTem_dummyGlaS345;zon1_roo_radTem_dummyGlaS346;zon1_roo_radTem_dummyGlaS347;zon1_roo_radTem_dummyGlaS348;zon1_roo_radTem_dummyGlaS349;zon1_roo_radTem_dummyGlaS350;zon1_roo_radTem_dummyGlaS351;zon1_roo_radTem_dummyGlaS352;zon1_roo_radTem_dummyGlaS353;zon1_roo_radTem_dummyGlaS354;zon1_roo_radTem_dummyGlaS355;zon1_roo_radTem_dummyGlaS356;zon1_roo_radTem_dummyGlaS357;zon1_roo_radTem_dummyGlaS358;zon1_roo_radTem_dummyGlaS359;zon1_roo_radTem_dummyGlaS360;zon1_roo_radTem_dummyGlaS361;zon1_roo_radTem_dummyGlaS362;zon1_roo_radTem_dummyGlaS363;zon1_roo_radTem_dummyGlaS364;zon1_roo_radTem_dummyGlaS365;zon1_roo_radTem_dummyGlaS366;zon1_roo_radTem_dummyGlaS367;zon1_roo_add_k1;zon1_roo_add_k2;zon1_roo_sumJFroWin_1__k;zon1_roo_p_start;zon1_roo_T_start;zon1_roo_X_start;zon1_qConGai_flow_k;zon1_qRadGai_flow_k;zon1_qLatGai_flow_k;zon1_TSoi_1__T;zon1_sinInf_m_flow;zon1_sinInf_x_pTphi_p;zon1_InfiltrationRate_k;zon1_souInf_m_flow;zon1_souInf_x_pTphi_p;zon1_intLoad_table;zon1_intLoad_verboseRead;zon1_intLoad_columns;zon1_intLoad_offset;zon1_intLoad_startTime;zon1_intLoad_timeEvents;weaDat_pAtm;weaDat_TDryBul;weaDat_TDewPoi;weaDat_TBlaSky;weaDat_relHum;weaDat_winSpe;weaDat_winDir;weaDat_HInfHor;weaDat_ceiHei;weaDat_totSkyCov;weaDat_opaSkyCov;weaDat_datRea_verboseRead;weaDat_cheTemDryBul_TMin;weaDat_cheTemDryBul_TMax;weaDat_cheTemDewPoi_TMin;weaDat_cheTemDewPoi_TMax;weaDat_add30Min_k1;weaDat_add30Min_k2;weaDat_datRea30Min_verbos407;weaDat_cheTemBlaSky_TMin;weaDat_cheTemBlaSky_TMax;rooSin_p;rooSin_T;rooSin_X;zon2_S_;zon2_E_;zon2_W_;zon2_N_;zon2_matExtWal_absIR_a;zon2_matExtWal_absIR_b;zon2_matExtWal_absSol_a;zon2_matExtWal_absSol_b;zon2_matExtWal_roughness_421;zon2_matFlo_absIR_a;zon2_matFlo_absIR_b;zon2_matFlo_absSol_a;zon2_matFlo_absSol_b;zon2_matFlo_roughness_a;zon2_roof_absIR_a;zon2_roof_absIR_b;zon2_roof_absSol_a;zon2_roof_absSol_b;zon2_roof_roughness_a;zon2_window600_glass_1__x;zon2_window600_glass_1__k;zon2_window600_glass_1__t434;zon2_window600_glass_1__r435;zon2_window600_glass_1__r436;zon2_window600_glass_1__t437;zon2_window600_glass_1__a438;zon2_window600_glass_1__a439;zon2_window600_glass_2__x;zon2_window600_glass_2__k;zon2_window600_glass_2__t442;zon2_window600_glass_2__r443;zon2_window600_glass_2__r444;zon2_window600_glass_2__t445;zon2_window600_glass_2__a446;zon2_window600_glass_2__a447;zon2_window600_gas_1__x;zon2_window600_gas_1__a_k;zon2_window600_gas_1__b_k;zon2_window600_gas_1__a_m451;zon2_window600_gas_1__b_m452;zon2_window600_gas_1__a_c;zon2_window600_gas_1__b_c;zon2_window600_gas_1__MM;zon2_window600_gas_1__P0;zon2_window600_shade_tauS457;zon2_window600_shade_tauS458;zon2_window600_shade_rhoS459;zon2_window600_shade_rhoS460;zon2_window600_shade_absI461;zon2_window600_shade_absI462;zon2_window600_shade_tauI463;zon2_window600_shade_tauI464;zon2_window600_UFra;zon2_window600_absIRFra;zon2_window600_absSolFra;zon2_soi_A;zon2_soi_T_a_start;zon2_soi_T_b_start;zon2_roo_datConExt_1__bou471;zon2_roo_datConExt_1__A;zon2_roo_datConExt_2__bou473;zon2_roo_datConExt_2__A;zon2_roo_datConExt_3__bou475;zon2_roo_datConExt_3__A;zon2_roo_datConExt_4__bou477;zon2_roo_datConExt_4__A;zon2_roo_datConExtWin_1__479;zon2_roo_datConExtWin_1__480;zon2_roo_datConExtWin_1__481;zon2_roo_datConExtWin_1__482;zon2_roo_datConExtWin_1__483;zon2_roo_datConExtWin_1__484;zon2_roo_datConExtWin_1__485;zon2_roo_datConExtWin_1__486;zon2_roo_datConExtWin_1__487;zon2_roo_datConExtWin_1__488;zon2_roo_datConPar_1__azi;zon2_roo_datConPar_1__bou490;zon2_roo_datConPar_1__A;zon2_roo_datConBou_1__azi;zon2_roo_datConBou_1__bou493;zon2_roo_datConBou_1__A;zon2_roo_surBou_1__A;zon2_roo_surBou_1__absIR;zon2_roo_surBou_1__absSol;zon2_roo_surBou_1__bounda498;zon2_roo_dummyCon_absIR_a;zon2_roo_dummyCon_absIR_b;zon2_roo_dummyCon_absSol_501;zon2_roo_dummyCon_absSol_502;zon2_roo_dummyCon_roughne503;zon2_roo_dummyGlaSys_glas504;zon2_roo_dummyGlaSys_glas505;zon2_roo_dummyGlaSys_glas506;zon2_roo_dummyGlaSys_glas507;zon2_roo_dummyGlaSys_glas508;zon2_roo_dummyGlaSys_glas509;zon2_roo_dummyGlaSys_glas510;zon2_roo_dummyGlaSys_glas511;zon2_roo_dummyGlaSys_gas_512;zon2_roo_dummyGlaSys_gas_513;zon2_roo_dummyGlaSys_gas_514;zon2_roo_dummyGlaSys_gas_515;zon2_roo_dummyGlaSys_gas_516;zon2_roo_dummyGlaSys_gas_517;zon2_roo_dummyGlaSys_gas_518;zon2_roo_dummyGlaSys_gas_519;zon2_roo_dummyGlaSys_gas_520;zon2_roo_dummyGlaSys_shad521;zon2_roo_dummyGlaSys_shad522;zon2_roo_dummyGlaSys_shad523;zon2_roo_dummyGlaSys_shad524;zon2_roo_dummyGlaSys_shad525;zon2_roo_dummyGlaSys_shad526;zon2_roo_dummyGlaSys_shad527;zon2_roo_dummyGlaSys_shad528;zon2_roo_dummyGlaSys_UFra;zon2_roo_dummyGlaSys_absI530;zon2_roo_dummyGlaSys_absS531;zon2_roo_AFlo;zon2_roo_hRoo;zon2_roo_conExtWin_1__gla534;zon2_roo_conExtWin_1__win535;zon2_roo_conExtWin_1__win536;zon2_roo_conExtWin_1__win537;zon2_roo_conExtWin_1__win538;zon2_roo_hIntFixed;zon2_roo_hExtFixed;zon2_roo_bouConExt_HDifTi541;zon2_roo_bouConExt_HDifTi542;zon2_roo_bouConExt_HDifTi543;zon2_roo_bouConExt_HDifTi544;zon2_roo_bouConExt_HDifTi545;zon2_roo_bouConExt_HDifTi546;zon2_roo_bouConExt_HDifTi547;zon2_roo_bouConExt_HDifTi548;zon2_roo_bouConExt_HDifTi549;zon2_roo_bouConExt_HDifTi550;zon2_roo_bouConExt_HDifTi551;zon2_roo_bouConExt_HDifTi552;zon2_roo_bouConExtWin_con553;zon2_roo_bouConExtWin_con554;zon2_roo_bouConExtWin_HDi555;zon2_roo_bouConExtWin_HDi556;zon2_roo_bouConExtWin_HDi557;zon2_roo_bouConExtWin_con558;zon2_roo_air_datConExtWin559;zon2_roo_air_datConExtWin560;zon2_roo_air_dummyCon_abs561;zon2_roo_air_dummyCon_abs562;zon2_roo_air_dummyCon_abs563;zon2_roo_air_dummyCon_abs564;zon2_roo_air_dummyCon_rou565;zon2_roo_air_dummyGlaSys_566;zon2_roo_air_dummyGlaSys_567;zon2_roo_air_dummyGlaSys_568;zon2_roo_air_dummyGlaSys_569;zon2_roo_air_dummyGlaSys_570;zon2_roo_air_dummyGlaSys_571;zon2_roo_air_dummyGlaSys_572;zon2_roo_air_dummyGlaSys_573;zon2_roo_air_dummyGlaSys_574;zon2_roo_air_dummyGlaSys_575;zon2_roo_air_dummyGlaSys_576;zon2_roo_air_dummyGlaSys_577;zon2_roo_air_dummyGlaSys_578;zon2_roo_air_dummyGlaSys_579;zon2_roo_air_dummyGlaSys_580;zon2_roo_air_dummyGlaSys_581;zon2_roo_air_dummyGlaSys_582;zon2_roo_air_dummyGlaSys_583;zon2_roo_air_dummyGlaSys_584;zon2_roo_air_dummyGlaSys_585;zon2_roo_air_dummyGlaSys_586;zon2_roo_air_dummyGlaSys_587;zon2_roo_air_dummyGlaSys_588;zon2_roo_air_dummyGlaSys_589;zon2_roo_air_dummyGlaSys_590;zon2_roo_air_dummyGlaSys_591;zon2_roo_air_dummyGlaSys_592;zon2_roo_air_dummyGlaSys_593;zon2_roo_solRadExc_datCon594;zon2_roo_solRadExc_datCon595;zon2_roo_solRadExc_dummyC596;zon2_roo_solRadExc_dummyC597;zon2_roo_solRadExc_dummyC598;zon2_roo_solRadExc_dummyC599;zon2_roo_solRadExc_dummyC600;zon2_roo_solRadExc_dummyG601;zon2_roo_solRadExc_dummyG602;zon2_roo_solRadExc_dummyG603;zon2_roo_solRadExc_dummyG604;zon2_roo_solRadExc_dummyG605;zon2_roo_solRadExc_dummyG606;zon2_roo_solRadExc_dummyG607;zon2_roo_solRadExc_dummyG608;zon2_roo_solRadExc_dummyG609;zon2_roo_solRadExc_dummyG610;zon2_roo_solRadExc_dummyG611;zon2_roo_solRadExc_dummyG612;zon2_roo_solRadExc_dummyG613;zon2_roo_solRadExc_dummyG614;zon2_roo_solRadExc_dummyG615;zon2_roo_solRadExc_dummyG616;zon2_roo_solRadExc_dummyG617;zon2_roo_solRadExc_dummyG618;zon2_roo_solRadExc_dummyG619;zon2_roo_solRadExc_dummyG620;zon2_roo_solRadExc_dummyG621;zon2_roo_solRadExc_dummyG622;zon2_roo_solRadExc_dummyG623;zon2_roo_solRadExc_dummyG624;zon2_roo_solRadExc_dummyG625;zon2_roo_solRadExc_dummyG626;zon2_roo_solRadExc_dummyG627;zon2_roo_solRadExc_dummyG628;zon2_roo_irRadGai_datConE629;zon2_roo_irRadGai_datConE630;zon2_roo_irRadGai_dummyCo631;zon2_roo_irRadGai_dummyCo632;zon2_roo_irRadGai_dummyCo633;zon2_roo_irRadGai_dummyCo634;zon2_roo_irRadGai_dummyCo635;zon2_roo_irRadGai_dummyGl636;zon2_roo_irRadGai_dummyGl637;zon2_roo_irRadGai_dummyGl638;zon2_roo_irRadGai_dummyGl639;zon2_roo_irRadGai_dummyGl640;zon2_roo_irRadGai_dummyGl641;zon2_roo_irRadGai_dummyGl642;zon2_roo_irRadGai_dummyGl643;zon2_roo_irRadGai_dummyGl644;zon2_roo_irRadGai_dummyGl645;zon2_roo_irRadGai_dummyGl646;zon2_roo_irRadGai_dummyGl647;zon2_roo_irRadGai_dummyGl648;zon2_roo_irRadGai_dummyGl649;zon2_roo_irRadGai_dummyGl650;zon2_roo_irRadGai_dummyGl651;zon2_roo_irRadGai_dummyGl652;zon2_roo_irRadGai_dummyGl653;zon2_roo_irRadGai_dummyGl654;zon2_roo_irRadGai_dummyGl655;zon2_roo_irRadGai_dummyGl656;zon2_roo_irRadGai_dummyGl657;zon2_roo_irRadGai_dummyGl658;zon2_roo_irRadGai_dummyGl659;zon2_roo_irRadGai_dummyGl660;zon2_roo_irRadGai_dummyGl661;zon2_roo_irRadGai_dummyGl662;zon2_roo_irRadGai_dummyGl663;zon2_roo_irRadExc_datConE664;zon2_roo_irRadExc_datConE665;zon2_roo_irRadExc_dummyCo666;zon2_roo_irRadExc_dummyCo667;zon2_roo_irRadExc_dummyCo668;zon2_roo_irRadExc_dummyCo669;zon2_roo_irRadExc_dummyCo670;zon2_roo_irRadExc_dummyGl671;zon2_roo_irRadExc_dummyGl672;zon2_roo_irRadExc_dummyGl673;zon2_roo_irRadExc_dummyGl674;zon2_roo_irRadExc_dummyGl675;zon2_roo_irRadExc_dummyGl676;zon2_roo_irRadExc_dummyGl677;zon2_roo_irRadExc_dummyGl678;zon2_roo_irRadExc_dummyGl679;zon2_roo_irRadExc_dummyGl680;zon2_roo_irRadExc_dummyGl681;zon2_roo_irRadExc_dummyGl682;zon2_roo_irRadExc_dummyGl683;zon2_roo_irRadExc_dummyGl684;zon2_roo_irRadExc_dummyGl685;zon2_roo_irRadExc_dummyGl686;zon2_roo_irRadExc_dummyGl687;zon2_roo_irRadExc_dummyGl688;zon2_roo_irRadExc_dummyGl689;zon2_roo_irRadExc_dummyGl690;zon2_roo_irRadExc_dummyGl691;zon2_roo_irRadExc_dummyGl692;zon2_roo_irRadExc_dummyGl693;zon2_roo_irRadExc_dummyGl694;zon2_roo_irRadExc_dummyGl695;zon2_roo_irRadExc_dummyGl696;zon2_roo_irRadExc_dummyGl697;zon2_roo_irRadExc_dummyGl698;zon2_roo_irRadExc_T0;zon2_roo_radTem_datConExt700;zon2_roo_radTem_datConExt701;zon2_roo_radTem_dummyCon_702;zon2_roo_radTem_dummyCon_703;zon2_roo_radTem_dummyCon_704;zon2_roo_radTem_dummyCon_705;zon2_roo_radTem_dummyCon_706;zon2_roo_radTem_dummyGlaS707;zon2_roo_radTem_dummyGlaS708;zon2_roo_radTem_dummyGlaS709;zon2_roo_radTem_dummyGlaS710;zon2_roo_radTem_dummyGlaS711;zon2_roo_radTem_dummyGlaS712;zon2_roo_radTem_dummyGlaS713;zon2_roo_radTem_dummyGlaS714;zon2_roo_radTem_dummyGlaS715;zon2_roo_radTem_dummyGlaS716;zon2_roo_radTem_dummyGlaS717;zon2_roo_radTem_dummyGlaS718;zon2_roo_radTem_dummyGlaS719;zon2_roo_radTem_dummyGlaS720;zon2_roo_radTem_dummyGlaS721;zon2_roo_radTem_dummyGlaS722;zon2_roo_radTem_dummyGlaS723;zon2_roo_radTem_dummyGlaS724;zon2_roo_radTem_dummyGlaS725;zon2_roo_radTem_dummyGlaS726;zon2_roo_radTem_dummyGlaS727;zon2_roo_radTem_dummyGlaS728;zon2_roo_radTem_dummyGlaS729;zon2_roo_radTem_dummyGlaS730;zon2_roo_radTem_dummyGlaS731;zon2_roo_radTem_dummyGlaS732;zon2_roo_radTem_dummyGlaS733;zon2_roo_radTem_dummyGlaS734;zon2_roo_add_k1;zon2_roo_add_k2;zon2_roo_sumJFroWin_1__k;zon2_roo_p_start;zon2_roo_T_start;zon2_roo_X_start;zon2_qConGai_flow_k;zon2_qRadGai_flow_k;zon2_qLatGai_flow_k;zon2_TSoi_1__T;zon2_sinInf_m_flow;zon2_sinInf_x_pTphi_p;zon2_InfiltrationRate_k;zon2_souInf_m_flow;zon2_souInf_x_pTphi_p;zon2_intLoad_table;zon2_intLoad_verboseRead;zon2_intLoad_columns;zon2_intLoad_offset;zon2_intLoad_startTime;zon2_intLoad_timeEvents;vav2_vav_sta_default_p;vav2_vav_sta_default_T;vav2_vav_sta_default_X;vav2_vav_riseTime;vav2_vav_y_start;vav2_vav_filter_gain;vav2_vav_filter_A_ripple;vav2_vav_filter_f_min;vav2_vav_filter_normalize764;vav2_vav_filter_x_start;vav2_vav_filter_u_nominal;vav2_vav_use_deltaM;vav2_vav_deltaM;vav2_vav_roundDuct;vav2_vav_ReC;vav2_vav_a;vav2_vav_b;vav2_vav_yL;vav2_vav_yU;vav2_vav_k1;vav2_vav_l;vav2_vav_l2;vav2_vav_deltax;vav2_vav_y_min;vav2_terHea_bal1_preDro_s780;vav2_terHea_bal1_preDro_s781;vav2_terHea_bal1_preDro_s782;vav2_terHea_bal2_preDro_s783;vav2_terHea_bal2_preDro_s784;vav2_terHea_delta;vav2_terHea_T_a1_nominal;vav2_terHea_T_a2_nominal;vav2_terHea_r_nominal;vav2_terHea_hA_n_w;vav2_terHea_hA_n_a;vav2_terHea_hA_T0_w;vav2_terHea_hA_T0_a;vav2_sinTer_X;vav2_sinTer_p;vav2_sinTer_T;vav2_souTer_X;vav2_souTer_m_flow;vav2_souTer_T;coiSou_X;coiSou_T;byp_sta_default_p;byp_sta_default_T;byp_sta_default_X;VSup2_T_start;VSup2_p_start;VSup2_X_start;VSup1_T_start;VSup1_p_start;VSup1_X_start;TDisVAV1_T_start;TDisVAV1_TAmb;TDisVAV1_tauHeaTra;TDisVAV2_T_start;TDisVAV2_TAmb;TDisVAV2_tauHeaTra;zon1_roo_conExtWin_1__win816;zon1_roo_conExtWin_1__win817;zon1_roo_conExtWin_1__win818;zon2_roo_conExtWin_1__win819;zon2_roo_conExtWin_1__win820;zon2_roo_conExtWin_1__win821]
   * Referenced by: '<S4>/Sfunc'
   */
  real_T Sfunc_P2_Size[2];             /* Computed Parameter: Sfunc_P2_Size
                                        * Referenced by: '<S4>/Sfunc'
                                        */
  real_T zerC_Value;                   /* Expression: 273.15
                                        * Referenced by: '<S5>/zerC'
                                        */
  real_T Gain_Gain;                    /* Expression: 9/5
                                        * Referenced by: '<S5>/Gain'
                                        */
  real_T Bias_Bias;                    /* Expression: 32
                                        * Referenced by: '<S5>/Bias'
                                        */
  real_T zerC_Value_n;                 /* Expression: 273.15
                                        * Referenced by: '<S6>/zerC'
                                        */
  real_T Gain_Gain_a;                  /* Expression: 9/5
                                        * Referenced by: '<S6>/Gain'
                                        */
  real_T Bias_Bias_c;                  /* Expression: 32
                                        * Referenced by: '<S6>/Bias'
                                        */
  real_T zerC_Value_f;                 /* Expression: 273.15
                                        * Referenced by: '<S7>/zerC'
                                        */
  real_T Gain_Gain_c;                  /* Expression: 9/5
                                        * Referenced by: '<S7>/Gain'
                                        */
  real_T Bias_Bias_d;                  /* Expression: 32
                                        * Referenced by: '<S7>/Bias'
                                        */
  real_T zerC_Value_k;                 /* Expression: 273.15
                                        * Referenced by: '<S8>/zerC'
                                        */
  real_T Gain_Gain_p;                  /* Expression: 9/5
                                        * Referenced by: '<S8>/Gain'
                                        */
  real_T Bias_Bias_i;                  /* Expression: 32
                                        * Referenced by: '<S8>/Bias'
                                        */
  real_T toCFM_Gain;                   /* Expression: 2118.8799727597
                                        * Referenced by: '<S1>/toCFM'
                                        */
  real_T toCFM1_Gain;                  /* Expression: 2118.8799727597
                                        * Referenced by: '<S1>/toCFM1'
                                        */
  real_T zerC_Value_o;                 /* Expression: 273.15
                                        * Referenced by: '<S9>/zerC'
                                        */
  real_T Gain_Gain_aw;                 /* Expression: 9/5
                                        * Referenced by: '<S9>/Gain'
                                        */
  real_T Bias_Bias_ch;                 /* Expression: 32
                                        * Referenced by: '<S9>/Bias'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_ds_simple_twozone_T {
  struct SimStruct_tag * *childSfunctions;
  const char_T *errorStatus;
  SS_SimMode simMode;
  RTWSolverInfo solverInfo;
  RTWSolverInfo *solverInfoPtr;
  void *sfcnInfo;

  /*
   * NonInlinedSFcns:
   * The following substructure contains information regarding
   * non-inlined s-functions used in the model.
   */
  struct {
    RTWSfcnInfo sfcnInfo;
    time_T *taskTimePtrs[3];
    SimStruct childSFunctions[1];
    SimStruct *childSFunctionPtrs[1];
    struct _ssBlkInfo2 blkInfo2[1];
    struct _ssSFcnModelMethods2 methods2[1];
    struct _ssSFcnModelMethods3 methods3[1];
    struct _ssSFcnModelMethods4 methods4[1];
    struct _ssStatesInfo2 statesInfo2[1];
    ssPeriodicStatesInfo periodicStatesInfo[1];
    struct _ssPortInfo2 inputOutputPortInfo2[1];
    struct {
      time_T sfcnPeriod[1];
      time_T sfcnOffset[1];
      int_T sfcnTsMap[1];
      struct _ssPortInputs inputPortInfo[1];
      struct _ssInPortUnit inputPortUnits[1];
      struct _ssInPortCoSimAttribute inputPortCoSimAttribute[1];
      struct _ssPortOutputs outputPortInfo[1];
      struct _ssOutPortUnit outputPortUnits[1];
      struct _ssOutPortCoSimAttribute outputPortCoSimAttribute[1];
      uint_T attribs[2];
      mxArray *params[2];
      struct _ssDWorkRecord dWork[3];
      struct _ssDWorkAuxRecord dWorkAux[3];
    } Sfcn0;
  } NonInlinedSFcns;

  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T options;
    int_T numContStates;
    int_T numU;
    int_T numY;
    int_T numSampTimes;
    int_T numBlocks;
    int_T numBlockIO;
    int_T numBlockPrms;
    int_T numDwork;
    int_T numSFcnPrms;
    int_T numSFcns;
    int_T numIports;
    int_T numOports;
    int_T numNonSampZCs;
    int_T sysDirFeedThru;
    int_T rtwGenSfcn;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T stepSize;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    struct {
      uint8_T TID[3];
    } TaskCounters;

    time_T tStart;
    time_T tFinal;
    time_T timeOfLastOutput;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *sampleTimes;
    time_T *offsetTimes;
    int_T *sampleTimeTaskIDPtr;
    int_T *sampleHits;
    int_T *perTaskSampleHits;
    time_T *t;
    time_T sampleTimesArray[3];
    time_T offsetTimesArray[3];
    int_T sampleTimeTaskIDArray[3];
    int_T sampleHitArray[3];
    int_T perTaskSampleHitsArray[9];
    time_T tArray[3];
  } Timing;
};

/* Block parameters (default storage) */
extern P_ds_simple_twozone_T ds_simple_twozone_P;

/* Block signals (default storage) */
extern B_ds_simple_twozone_T ds_simple_twozone_B;

/* Block states (default storage) */
extern DW_ds_simple_twozone_T ds_simple_twozone_DW;

/* Model entry point functions */
extern void ds_simple_twozone_initialize(void);
extern void ds_simple_twozone_output(void);
extern void ds_simple_twozone_update(void);
extern void ds_simple_twozone_terminate(void);

/* Real-time Model object */
extern RT_MODEL_ds_simple_twozone_T *const ds_simple_twozone_M;

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
 * '<Root>' : 'ds_simple_twozone'
 * '<S1>'   : 'ds_simple_twozone/behavior'
 * '<S2>'   : 'ds_simple_twozone/inputs'
 * '<S3>'   : 'ds_simple_twozone/outputs'
 * '<S4>'   : 'ds_simple_twozone/behavior/DymolaBlock'
 * '<S5>'   : 'ds_simple_twozone/behavior/KtoF'
 * '<S6>'   : 'ds_simple_twozone/behavior/KtoF1'
 * '<S7>'   : 'ds_simple_twozone/behavior/KtoF2'
 * '<S8>'   : 'ds_simple_twozone/behavior/KtoF3'
 * '<S9>'   : 'ds_simple_twozone/behavior/KtoF4'
 * '<S10>'  : 'ds_simple_twozone/behavior/TDis1FtoV'
 * '<S11>'  : 'ds_simple_twozone/behavior/TDis2FtoV'
 * '<S12>'  : 'ds_simple_twozone/behavior/TOutFtoV'
 * '<S13>'  : 'ds_simple_twozone/behavior/TRoo1FtoV'
 * '<S14>'  : 'ds_simple_twozone/behavior/TRoo2FtoV'
 * '<S15>'  : 'ds_simple_twozone/behavior/VDis1ToV'
 * '<S16>'  : 'ds_simple_twozone/behavior/VDis2ToV'
 * '<S17>'  : 'ds_simple_twozone/outputs/TDis1'
 * '<S18>'  : 'ds_simple_twozone/outputs/TDis2'
 * '<S19>'  : 'ds_simple_twozone/outputs/TOut'
 * '<S20>'  : 'ds_simple_twozone/outputs/TRooAir1'
 * '<S21>'  : 'ds_simple_twozone/outputs/TRooAir2'
 * '<S22>'  : 'ds_simple_twozone/outputs/VFlo1'
 * '<S23>'  : 'ds_simple_twozone/outputs/VFlo2'
 */
#endif                                 /* RTW_HEADER_ds_simple_twozone_h_ */
