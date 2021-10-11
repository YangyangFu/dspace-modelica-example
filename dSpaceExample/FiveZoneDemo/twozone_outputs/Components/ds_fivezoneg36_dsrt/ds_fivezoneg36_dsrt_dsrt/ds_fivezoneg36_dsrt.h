/*
 * ds_fivezoneg36_dsrt.h
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

#ifndef RTW_HEADER_ds_fivezoneg36_dsrt_h_
#define RTW_HEADER_ds_fivezoneg36_dsrt_h_
#include <stddef.h>
#include <string.h>
#ifndef ds_fivezoneg36_dsrt_COMMON_INCLUDES_
# define ds_fivezoneg36_dsrt_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "ds_fivezoneg36_dsrt_dsmpbap.h"
#endif                                /* ds_fivezoneg36_dsrt_COMMON_INCLUDES_ */

#include "ds_fivezoneg36_dsrt_types.h"

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
  real_T Sfunc[30];                    /* '<S4>/Sfunc' */
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
} B_ds_fivezoneg36_dsrt_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Sfunc_DSTATE;                 /* '<S4>/Sfunc' */
  real_T Sfunc_RWORK[39101];           /* '<S4>/Sfunc' */
  void *Sfunc_PWORK;                   /* '<S4>/Sfunc' */
} DW_ds_fivezoneg36_dsrt_T;

/* Parameters (default storage) */
struct P_ds_fivezoneg36_dsrt_T_ {
  real_T TRooCorFtoV_xmax;             /* Mask Parameter: TRooCorFtoV_xmax
                                        * Referenced by: '<S13>/range y // range x'
                                        */
  real_T TRooSouFtoV_xmax;             /* Mask Parameter: TRooSouFtoV_xmax
                                        * Referenced by: '<S14>/range y // range x'
                                        */
  real_T TDisCorFtoV_xmax;             /* Mask Parameter: TDisCorFtoV_xmax
                                        * Referenced by: '<S10>/range y // range x'
                                        */
  real_T TDisSouFtoV_xmax;             /* Mask Parameter: TDisSouFtoV_xmax
                                        * Referenced by: '<S11>/range y // range x'
                                        */
  real_T VDisCorToV_xmax;              /* Mask Parameter: VDisCorToV_xmax
                                        * Referenced by: '<S15>/range y // range x'
                                        */
  real_T VDisSouToV_xmax;              /* Mask Parameter: VDisSouToV_xmax
                                        * Referenced by: '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_xmax;                /* Mask Parameter: TOutFtoV_xmax
                                        * Referenced by: '<S12>/range y // range x'
                                        */
  real_T TRooCorFtoV_xmin;             /* Mask Parameter: TRooCorFtoV_xmin
                                        * Referenced by:
                                        *   '<S13>/Subtract min x'
                                        *   '<S13>/range y // range x'
                                        */
  real_T TRooSouFtoV_xmin;             /* Mask Parameter: TRooSouFtoV_xmin
                                        * Referenced by:
                                        *   '<S14>/Subtract min x'
                                        *   '<S14>/range y // range x'
                                        */
  real_T TDisCorFtoV_xmin;             /* Mask Parameter: TDisCorFtoV_xmin
                                        * Referenced by:
                                        *   '<S10>/Subtract min x'
                                        *   '<S10>/range y // range x'
                                        */
  real_T TDisSouFtoV_xmin;             /* Mask Parameter: TDisSouFtoV_xmin
                                        * Referenced by:
                                        *   '<S11>/Subtract min x'
                                        *   '<S11>/range y // range x'
                                        */
  real_T VDisCorToV_xmin;              /* Mask Parameter: VDisCorToV_xmin
                                        * Referenced by:
                                        *   '<S15>/Subtract min x'
                                        *   '<S15>/range y // range x'
                                        */
  real_T VDisSouToV_xmin;              /* Mask Parameter: VDisSouToV_xmin
                                        * Referenced by:
                                        *   '<S16>/Subtract min x'
                                        *   '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_xmin;                /* Mask Parameter: TOutFtoV_xmin
                                        * Referenced by:
                                        *   '<S12>/Subtract min x'
                                        *   '<S12>/range y // range x'
                                        */
  real_T TRooCorFtoV_ymax;             /* Mask Parameter: TRooCorFtoV_ymax
                                        * Referenced by: '<S13>/range y // range x'
                                        */
  real_T TRooSouFtoV_ymax;             /* Mask Parameter: TRooSouFtoV_ymax
                                        * Referenced by: '<S14>/range y // range x'
                                        */
  real_T TDisCorFtoV_ymax;             /* Mask Parameter: TDisCorFtoV_ymax
                                        * Referenced by: '<S10>/range y // range x'
                                        */
  real_T TDisSouFtoV_ymax;             /* Mask Parameter: TDisSouFtoV_ymax
                                        * Referenced by: '<S11>/range y // range x'
                                        */
  real_T VDisCorToV_ymax;              /* Mask Parameter: VDisCorToV_ymax
                                        * Referenced by: '<S15>/range y // range x'
                                        */
  real_T VDisSouToV_ymax;              /* Mask Parameter: VDisSouToV_ymax
                                        * Referenced by: '<S16>/range y // range x'
                                        */
  real_T TOutFtoV_ymax;                /* Mask Parameter: TOutFtoV_ymax
                                        * Referenced by: '<S12>/range y // range x'
                                        */
  real_T TRooCorFtoV_ymin;             /* Mask Parameter: TRooCorFtoV_ymin
                                        * Referenced by:
                                        *   '<S13>/Add min y'
                                        *   '<S13>/range y // range x'
                                        */
  real_T TRooSouFtoV_ymin;             /* Mask Parameter: TRooSouFtoV_ymin
                                        * Referenced by:
                                        *   '<S14>/Add min y'
                                        *   '<S14>/range y // range x'
                                        */
  real_T TDisCorFtoV_ymin;             /* Mask Parameter: TDisCorFtoV_ymin
                                        * Referenced by:
                                        *   '<S10>/Add min y'
                                        *   '<S10>/range y // range x'
                                        */
  real_T TDisSouFtoV_ymin;             /* Mask Parameter: TDisSouFtoV_ymin
                                        * Referenced by:
                                        *   '<S11>/Add min y'
                                        *   '<S11>/range y // range x'
                                        */
  real_T VDisCorToV_ymin;              /* Mask Parameter: VDisCorToV_ymin
                                        * Referenced by:
                                        *   '<S15>/Add min y'
                                        *   '<S15>/range y // range x'
                                        */
  real_T VDisSouToV_ymin;              /* Mask Parameter: VDisSouToV_ymin
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
  real_T Sfunc_P1[3458];         /* Expression: [dspaceexample_f_dy975f7hquM.pV]
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
struct tag_RTM_ds_fivezoneg36_dsrt_T {
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
extern P_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_P;

/* Block signals (default storage) */
extern B_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_B;

/* Block states (default storage) */
extern DW_ds_fivezoneg36_dsrt_T ds_fivezoneg36_dsrt_DW;

/* Model entry point functions */
extern void ds_fivezoneg36_dsrt_initialize(void);
extern void ds_fivezoneg36_dsrt_output(void);
extern void ds_fivezoneg36_dsrt_update(void);
extern void ds_fivezoneg36_dsrt_terminate(void);

/* Real-time Model object */
extern RT_MODEL_ds_fivezoneg36_dsrt_T *const ds_fivezoneg36_dsrt_M;

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
 * '<Root>' : 'ds_fivezoneg36_dsrt'
 * '<S1>'   : 'ds_fivezoneg36_dsrt/behavior'
 * '<S2>'   : 'ds_fivezoneg36_dsrt/inputs'
 * '<S3>'   : 'ds_fivezoneg36_dsrt/outputs'
 * '<S4>'   : 'ds_fivezoneg36_dsrt/behavior/DymolaBlock'
 * '<S5>'   : 'ds_fivezoneg36_dsrt/behavior/KtoF'
 * '<S6>'   : 'ds_fivezoneg36_dsrt/behavior/KtoF1'
 * '<S7>'   : 'ds_fivezoneg36_dsrt/behavior/KtoF2'
 * '<S8>'   : 'ds_fivezoneg36_dsrt/behavior/KtoF3'
 * '<S9>'   : 'ds_fivezoneg36_dsrt/behavior/KtoF4'
 * '<S10>'  : 'ds_fivezoneg36_dsrt/behavior/TDisCorFtoV'
 * '<S11>'  : 'ds_fivezoneg36_dsrt/behavior/TDisSouFtoV'
 * '<S12>'  : 'ds_fivezoneg36_dsrt/behavior/TOutFtoV'
 * '<S13>'  : 'ds_fivezoneg36_dsrt/behavior/TRooCorFtoV'
 * '<S14>'  : 'ds_fivezoneg36_dsrt/behavior/TRooSouFtoV'
 * '<S15>'  : 'ds_fivezoneg36_dsrt/behavior/VDisCorToV'
 * '<S16>'  : 'ds_fivezoneg36_dsrt/behavior/VDisSouToV'
 * '<S17>'  : 'ds_fivezoneg36_dsrt/outputs/TDisCor'
 * '<S18>'  : 'ds_fivezoneg36_dsrt/outputs/TDisSou'
 * '<S19>'  : 'ds_fivezoneg36_dsrt/outputs/TOut'
 * '<S20>'  : 'ds_fivezoneg36_dsrt/outputs/TRooCor'
 * '<S21>'  : 'ds_fivezoneg36_dsrt/outputs/TRooSou'
 * '<S22>'  : 'ds_fivezoneg36_dsrt/outputs/VFloCor'
 * '<S23>'  : 'ds_fivezoneg36_dsrt/outputs/VFloSou'
 * '<S24>'  : 'ds_fivezoneg36_dsrt/outputs/fanOnSta'
 */
#endif                                 /* RTW_HEADER_ds_fivezoneg36_dsrt_h_ */
