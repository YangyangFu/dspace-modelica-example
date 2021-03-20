/****************************************************************************\ 
 *** 
 *** File                  : data_out_ap.cpp
 *** 
 *** Generated by dSPACE Tools.
 *** (c) Copyright 2013, dSPACE GmbH. All rights reserved.
\****************************************************************************/

#if !defined(DATA_OUT_AP_CPP_)
#  define    DATA_OUT_AP_CPP_


/* -- Include directives. -- */
#  include "IOCode_Data.h"
#  include <DsApplicationInterface.h>
#  include "string.h"
#  include "data_out_ap.h"

#  if defined(EXTERN_C_DECL)
#    undef EXTERN_C_DECL
#  endif
#  if defined(__cplusplus)
#    define EXTERN_C_DECL extern "C"
#  else
#    define EXTERN_C_DECL extern
#  endif


/* -- Variable declarations in module scope. -- */

/* Pragma to suppress GCC stack reuse which leads to problems with signal chain code */
#ifdef __GNUC__
#pragma GCC optimize "-fstack-reuse=none"
#endif

/* -- Definitions of exported functions. -- */

  void
ap_write_sine_DataOutport1_P1_S1(
    Float64* x) 
{
/* ModelPort:{VoltageOut.Voltage}, PortId:{ebb2cacb-f093-4136-8b25-1fc4ee1492d6} */
Float64 localVariable_1;
{
    localVariable_1 = *x;
}
{
pVoltageOut_DriverHandle->setOutputValue(ErrorList, localVariable_1);
}

}

#endif                                 /* DATA_OUT_AP_CPP_ */
/* [EOF] */
