CC_OPT_SET_SUPPORTED_VALUES = DEFAULT NONE CUSTOM 
INCLUDE_MAKEFILE_VERSION    = 2 
SRCS= mdladapter_mdlfunctions.cpp mdlCode_ap.cpp data_in_ap.cpp data_out_ap.cpp fm_entry_ap.cpp fm_exit_ap.cpp \
		  dssimengine_accesspoint.cpp dssimengine_api.cpp dssimengine_main.cpp rtosal_task.cpp rtosal_taskap.cpp \
		  rtosal_simengineap.cpp IOCode_Data.cpp dssimengine_accesspoint_Voltage_Out.cpp
MRK_FILES                   =  mdladapter_mdlfunctions.mrk mdlCode_ap.mrk data_in_ap.mrk data_out_ap.mrk fm_entry_ap.mrk fm_exit_ap.mrk dssimengine_accesspoint.mrk dssimengine_api.mrk dssimengine_main.mrk rtosal_task.mrk rtosal_taskap.mrk rtosal_simengineap.mrk IOCode_Data.mrk dssimengine_accesspoint_Voltage_Out.mrk 
OBJS= mdladapter_mdlfunctions.o86 mdlCode_ap.o86 data_in_ap.o86 data_out_ap.o86 fm_entry_ap.o86 fm_exit_ap.o86 \
		  dssimengine_accesspoint.o86 dssimengine_api.o86 dssimengine_main.o86 rtosal_task.o86 rtosal_taskap.o86 \
		  rtosal_simengineap.o86 IOCode_Data.o86 dssimengine_accesspoint_Voltage_Out.o86
CC_SRC_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" 
 
CC_HDR_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 C:\PROGRA~1\DYMOLA~1\Source \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" 
 
LIB_DIRPATHS                =     
CUSTOM_DIRPATHS             =    
CC_ADD_OPTS                 =     
CPP_ADD_OPTS                =     
CC_ADD_DEFINES              = DATA_PORT_ACCESS_POINT_API_VERSION=2 
CC_ADD_UNDEFS               =  
CC_OPT_SET                  = Default 
CC_CUSTOM_OPT_OPTS          =  

all : MakeCheckMarker_All MakeCompile 

depend : 

%include Configuration.mk 
%include CommonRules.mk 

CC_ALL_OPTS = \
 -c \
 -fno-common \
 -nostdinc \
 -fno-strict-aliasing \
 -pipe \
 -march=sandybridge \
 -mno-avx \
 -mfpmath=sse \
 -msse2 \
 -ffast-math \
 -fomit-frame-pointer \
 -mstackrealign \
 "-isystemC:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 "-isystemC:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\host\win32\x86\usr\lib\gcc\i486-pc-nto-qnx6.5.0\5.2.0\include" \
 -Werror-implicit-function-declaration \
 -D_DSx86_32 \
 -D_DS2510 \
 -DDS_PLATFORM_X86 \
 -DDS_PLATFORM_LE \
 -DDS_PLATFORM_POSIX \
 -DDS_PLATFORM_QNX \
 -DDS_PLATFORM_CN \
 -DDS_PLATFORM_HCN \
 -DDS_PLATFORM_SMART \
 -DDS_PLATFORM_SMARTHIL \
 -DDS_PLATFORM_SMP \
 -D__HOSTNAME__=\""MEEN-1PX7H63"\" \
 -D__INTEGRATION__=\""4.6.1"\" \
 -DDS_RTLIB_VERSION_MAR=4 \
 -DDS_RTLIB_VERSION_MIR=6 \
 -DDS_QNX_VERSION=650 \
 -DQNX_VERSION=6.5.0 \
 -O2 \
 -finline-functions \
 -D_INLINE \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 -IC:\PROGRA~1\DYMOLA~1\Source \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include \
 -DDATA_PORT_ACCESS_POINT_API_VERSION=2 
 
CPP_ALL_OPTS = \
 -c \
 -fno-common \
 -nostdinc \
 -fno-strict-aliasing \
 -pipe \
 -march=sandybridge \
 -mno-avx \
 -mfpmath=sse \
 -msse2 \
 -ffast-math \
 -fomit-frame-pointer \
 -mstackrealign \
 "-isystemC:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 "-isystemC:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include" \
 -isystem"C:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\host\win32\x86\usr\lib\gcc\i486-pc-nto-qnx6.5.0\5.2.0\include" \
 -fno-operator-names \
 -Wall \
 -D_GLIBCXX_USE_CXX11_ABI=0 \
 -D_DSx86_32 \
 -D_DS2510 \
 -DDS_PLATFORM_X86 \
 -DDS_PLATFORM_LE \
 -DDS_PLATFORM_POSIX \
 -DDS_PLATFORM_QNX \
 -DDS_PLATFORM_CN \
 -DDS_PLATFORM_HCN \
 -DDS_PLATFORM_SMART \
 -DDS_PLATFORM_SMARTHIL \
 -DDS_PLATFORM_SMP \
 -D__HOSTNAME__=\""MEEN-1PX7H63"\" \
 -D__INTEGRATION__=\""4.6.1"\" \
 -DDS_RTLIB_VERSION_MAR=4 \
 -DDS_RTLIB_VERSION_MIR=6 \
 -DDS_QNX_VERSION=650 \
 -DQNX_VERSION=6.5.0 \
 -O2 \
 -finline-functions \
 -D_INLINE \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 -IC:\PROGRA~1\DYMOLA~1\Source \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include \
 -DDATA_PORT_ACCESS_POINT_API_VERSION=2 
 
# ============================================================================= 
# MKMF Section 
# ============================================================================= 

# ----------------------------------------------------------------------------- 
# MKMF Configuration 
# ----------------------------------------------------------------------------- 

.TYPE.C   = .c .cpp 
.TYPE.OBJ = .o86 .o86 

.PATH.c = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode; \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src"; 
 
.PATH.cpp = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode; \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src"; 
 
.PATH.h = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt; \
 C:\PROGRA~1\DYMOLA~1\Source; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode; \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src"; 
 

.HDRPATH.c = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 C:\PROGRA~1\DYMOLA~1\Source \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" \
 | \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 C:\PROGRA~1\DYMOLA~1\Source \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" 
 
.HDRPATH.cpp = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 C:\PROGRA~1\DYMOLA~1\Source \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" \
 | \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Components\ds_fivezoneg36_dsrt\ds_fivezoneg36_dsrt_dsrt \
 C:\PROGRA~1\DYMOLA~1\Source \
 C:\PROGRA~1\MATLAB\R2020a\extern\include \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_outputs\Build\ds_fivezoneg36_dsrt\SysIntCode \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src" 
 

.CDEFINES.c  = -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  
.CDEFINES.cpp = -D__cplusplus -D_GLIBCXX_USE_CXX11_ABI=0  -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  

MKMF_SRCS  =    mdladapter_mdlfunctions.cpp mdlCode_ap.cpp data_in_ap.cpp data_out_ap.cpp fm_entry_ap.cpp fm_exit_ap.cpp dssimengine_accesspoint.cpp dssimengine_api.cpp dssimengine_main.cpp rtosal_task.cpp rtosal_taskap.cpp rtosal_simengineap.cpp IOCode_Data.cpp dssimengine_accesspoint_Voltage_Out.cpp 
MKMF_LINELEN = 118 
MKMF_TABLEN  = 2 

# ----------------------------------------------------------------------------- 
# MKMF Replacements 
# ----------------------------------------------------------------------------- 

HDRS= dssimengine_api.h dssimengine_main.h rtosal_msg.h data_in_ap.h data_out_ap.h DS_BusDef.h \
		  dssimengine_accesspoint.h dssimengine_accesspoint_Voltage_Out.h dssimengine_defines.h fm_entry_ap.h fm_exit_ap.h \
		  IOCode_Data.h mdlCode_ap.h rtosal_simengineap.h rtosal_task.h rtosal_taskap.h

EXTHDRS=

SRCS= mdladapter_mdlfunctions.cpp mdlCode_ap.cpp data_in_ap.cpp data_out_ap.cpp fm_entry_ap.cpp fm_exit_ap.cpp \
		  dssimengine_accesspoint.cpp dssimengine_api.cpp dssimengine_main.cpp rtosal_task.cpp rtosal_taskap.cpp \
		  rtosal_simengineap.cpp IOCode_Data.cpp dssimengine_accesspoint_Voltage_Out.cpp

# [EOF] 
 
### OPUS MKMF:  Do not remove this line!  Generated dependencies follow.

mdladapter_mdlfunctions.o86: mdladapter_mdlfunctions.cpp \
	 dssimengine_api.h

mdlCode_ap.o86: mdlCode_ap.cpp \
	 IOCode_Data.h \
	 mdlCode_ap.h \
		 DS_BusDef.h

data_in_ap.o86: data_in_ap.cpp \
	 IOCode_Data.h \
	 data_in_ap.h \
		 DS_BusDef.h

data_out_ap.o86: data_out_ap.cpp \
	 IOCode_Data.h \
	 data_out_ap.h \
		 DS_BusDef.h

fm_entry_ap.o86: fm_entry_ap.cpp \
	 IOCode_Data.h \
	 fm_entry_ap.h \
		 DS_BusDef.h

fm_exit_ap.o86: fm_exit_ap.cpp \
	 IOCode_Data.h \
	 fm_exit_ap.h \
		 DS_BusDef.h

dssimengine_accesspoint.o86: dssimengine_accesspoint.cpp \
	 dssimengine_accesspoint.h \
	 rtosal_simengineap.h \
	 rtosal_task.h \
	 dssimengine_api.h \
	 IOCode_Data.h \
	 dssimengine_accesspoint_Voltage_Out.h \
	 dssimengine_defines.h

dssimengine_api.o86: dssimengine_api.cpp \
	 dssimengine_main.h \
	 dssimengine_api.h

dssimengine_main.o86: dssimengine_main.cpp \
	 dssimengine_api.h \
	 dssimengine_main.h \
	 dssimengine_accesspoint.h

rtosal_task.o86: rtosal_task.cpp \
	 dssimengine_api.h \
	 rtosal_msg.h \
	 rtosal_taskap.h \
	 IOCode_Data.h \
	 rtosal_task.h

rtosal_taskap.o86: rtosal_taskap.cpp \
	 rtosal_task.h \
	 IOCode_Data.h \
	 rtosal_taskap.h

rtosal_simengineap.o86: rtosal_simengineap.cpp \
	 rtosal_task.h \
	 dssimengine_api.h \
	 IOCode_Data.h \
	 rtosal_msg.h \
	 rtosal_simengineap.h

IOCode_Data.o86: IOCode_Data.cpp \
	 dssimengine_accesspoint.h \
	 IOCode_Data.h

dssimengine_accesspoint_Voltage_Out.o86: dssimengine_accesspoint_Voltage_Out.cpp \
	 dssimengine_api.h \
	 IOCode_Data.h \
	 dssimengine_accesspoint_Voltage_Out.h
