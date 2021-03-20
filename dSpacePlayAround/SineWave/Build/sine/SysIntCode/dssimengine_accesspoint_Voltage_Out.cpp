/****************************************************************************\ 
 *** 
 *** File                  : dssimengine_accesspoint_Voltage_Out.cpp
 *** 
 *** Generated by dSPACE Tools.
 *** (c) Copyright 2013, dSPACE GmbH. All rights reserved.
\****************************************************************************/

#if !defined(DSSIMENGINE_ACCESSPOINT_VOLTAGE_OUT_CPP_)
#  define    DSSIMENGINE_ACCESSPOINT_VOLTAGE_OUT_CPP_


/* -- Include directives. -- */
#  include "dssimengine_api.h"
#  include "IOCode_Data.h"
#  include "dssimengine_accesspoint_Voltage_Out.h"

#  if defined(EXTERN_C_DECL)
#    undef EXTERN_C_DECL
#  endif
#  if defined(__cplusplus)
#    define EXTERN_C_DECL extern "C"
#  else
#    define EXTERN_C_DECL extern
#  endif


/* -- Definitions of exported functions. -- */

  void
ApSimEngineRunTimeInit_ctlcBODY_0_VoltageOut(
    DsTErrorList ErrorList) 
{
pVoltageOut_DriverHandle->setOutputValue(ErrorList, 0);

}

  void
ApSimEngineOnStartIo_ctlcBODY_0_VoltageOut(
    DsTErrorList ErrorList) 
{
pVoltageOut_DriverHandle->setOutputValue(ErrorList, 0);

}

  void
ApSimEngineOnStopIo_ctlcBODY_0_VoltageOut(
    DsTErrorList ErrorList) 
{
pVoltageOut_DriverHandle->setOutputValue(ErrorList, 0.000000e+000);

}

  void
ApSimEngineOnInitIoPreRtosInit_ctlcBODY_2_VoltageOut(
    DsTErrorList ErrorList, DsCApplication* pApp) 
{
pVoltageOut_DriverHandle = DsCIoFuncAnalogOut::create(ErrorList, pApp);

}

  void
ApSimEngineOnInitIoPostRtosInit_ctlcBODY_0_VoltageOut(
    DsTErrorList ErrorList) 
{
sine_fcnModule_SIDRoot_TID0->bindDriver(ErrorList, pVoltageOut_DriverHandle);
pVoltageOut_DriverHandle->setName(ErrorList, "VoltageOut");
pVoltageOut_DriverHandle->bindIoChannel(ErrorList, DsCIoChannel::getInstance(ErrorList, VOLTAGEOUT_1_VOLTAGE_OUT), DsNIoFuncAnalogOut::LogicalChannel::Default, DsNIoFuncAnalogOut::ChannelProperties::Role::None | DsNIoFuncAnalogOut::ChannelProperties::Enhancement::None);
pVoltageOut_DriverHandle->setNoiseGeneration(ErrorList,  DsNIoFuncAnalogOut::NoiseGeneration::Disabled);
pVoltageOut_DriverHandle->setOutputInterface(ErrorList, DsNIoFuncAnalogOut::OutputInterface::Voltage);

}

#endif                                 /* DSSIMENGINE_ACCESSPOINT_VOLTAGE_OUT_CPP_ */
/* [EOF] */
