CC_OPT_SET_SUPPORTED_VALUES = DEFAULT NONE CUSTOM 
INCLUDE_MAKEFILE_VERSION    = 2 
LIB_TARGET                  = ds_simple_twozone 
SRCS= ds_simple_twozone.c rt_matrx.c rt_printf.c ds_simple_twozone_data.c ds_simple_twozone_dsrtmdlfcn.c \
		  ds_simple_twozone_dsrtmf.c ds_simple_twozone_dsrttf.c ds_simple_twozone_dsrtvdf.c rtGetInf.c rtGetNaN.c \
		  rt_nonfinite.c dspaceexample_s_dy4854h2b34.c
MRK_FILES                   = ds_simple_twozone.mrk rt_matrx.mrk rt_printf.mrk ds_simple_twozone_data.mrk ds_simple_twozone_dsrtmdlfcn.mrk ds_simple_twozone_dsrtmf.mrk ds_simple_twozone_dsrttf.mrk ds_simple_twozone_dsrtvdf.mrk rtGetInf.mrk rtGetNaN.mrk rt_nonfinite.mrk dspaceexample_s_dy4854h2b34.mrk  
OBJS= ds_simple_twozone.o86 rt_matrx.o86 rt_printf.o86 ds_simple_twozone_data.o86 ds_simple_twozone_dsrtmdlfcn.o86 \
		  ds_simple_twozone_dsrtmf.o86 ds_simple_twozone_dsrttf.o86 ds_simple_twozone_dsrtvdf.o86 rtGetInf.o86 \
		  rtGetNaN.o86 rt_nonfinite.o86 dspaceexample_s_dy4854h2b34.o86
CC_SRC_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\src" 
 
CC_HDR_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 
CC_LIB_FILE                 = D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt\ds_simple_twozone.a 
LIB_DIRPATHS                =     
CUSTOM_DIRPATHS             =    
CC_ADD_OPTS                 =     
CPP_ADD_OPTS                =     
CC_ADD_DEFINES              = DATA_PORT_ACCESS_POINT_API_VERSION=2 USE_RTMODEL MODEL=ds_simple_twozone MT=0 RT NUMST=3 NCSTATES=0 NO_PRINTF TID01EQ=1 
CC_ADD_UNDEFS               =  
CC_OPT_SET                  = Default 
CC_CUSTOM_OPT_OPTS          =  

all : MakeLib 

depend : 

%include ..\Configuration.mk 
%include ..\LibraryRules.mk 
%include ..\CommonRules.mk 

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
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 -IC:\PROGRA~1\DYMOLA~1\Source \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include \
 -DDATA_PORT_ACCESS_POINT_API_VERSION=2 \
 -DUSE_RTMODEL \
 -DMODEL=ds_simple_twozone \
 -DMT=0 \
 -DRT \
 -DNUMST=3 \
 -DNCSTATES=0 \
 -DNO_PRINTF \
 -DTID01EQ=1 
 
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
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 -ID:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 -IC:\PROGRA~1\DYMOLA~1\Source \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -I"C:\Program Files\dSPACE RCPHIL 2020-A\SCALEXIO\Include" \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include\c++\5.2.0\i486-pc-nto-qnx6.5.0 \
 -IC:\ProgramData\dSPACE\ad34425a-2298-40d1-8728-e06238c82a90\Compiler\QNX650_520\target\qnx6\usr\include \
 -DDATA_PORT_ACCESS_POINT_API_VERSION=2 \
 -DUSE_RTMODEL \
 -DMODEL=ds_simple_twozone \
 -DMT=0 \
 -DRT \
 -DNUMST=3 \
 -DNCSTATES=0 \
 -DNO_PRINTF \
 -DTID01EQ=1 
 
# ============================================================================= 
# MKMF Section 
# ============================================================================= 

# ----------------------------------------------------------------------------- 
# MKMF Configuration 
# ----------------------------------------------------------------------------- 

.TYPE.C   = .c .cpp 
.TYPE.OBJ = .o86 .o86 

.PATH.c = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 C:\PROGRA~1\DYMOLA~1\Source; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\src; 
 
.PATH.cpp = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 C:\PROGRA~1\DYMOLA~1\Source; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\src; 
 
.PATH.h = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone; \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt; \
 C:\PROGRA~1\DYMOLA~1\Source; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; 
 

.HDRPATH.c = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 | \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 
.HDRPATH.cpp = \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 | \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt \
 D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone" \
 "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\twozone_simple\Components\ds_simple_twozone\ds_simple_twozone_dsrt" \
 "C:\PROGRA~1\DYMOLA~1\Source" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 

.CDEFINES.c  = -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  
.CDEFINES.cpp = -D__cplusplus -D_GLIBCXX_USE_CXX11_ABI=0  -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  

MKMF_SRCS  = ds_simple_twozone.c rt_matrx.c rt_printf.c ds_simple_twozone_data.c ds_simple_twozone_dsrtmdlfcn.c ds_simple_twozone_dsrtmf.c ds_simple_twozone_dsrttf.c ds_simple_twozone_dsrtvdf.c rtGetInf.c rtGetNaN.c rt_nonfinite.c dspaceexample_s_dy4854h2b34.c  
MKMF_LINELEN = 118 
MKMF_TABLEN  = 2 

# ----------------------------------------------------------------------------- 
# MKMF Replacements 
# ----------------------------------------------------------------------------- 

HDRS= amach.h amat.h bloutil.h delay.h dsblock.h dsblock1.c dsblock2.c dsblock3.c dsblock4.c dsblock5.c dsblock6.c \
		  dsutil.h dymtable.h dymutil.h f2c.h gconstructor.h libdssetup.h matrixop.h matrixop1.h matutil.h \
		  ModelicaInternal.c ModelicaInternal.h ModelicaStrings.c ModelicaStrings.h ModelicaUtilities.h moutil.c sprwat.h \
		  ss2dym.c userdefs.h userfunc.c uthash.h tmwtypes.h cg_sfun.h rt_matrx.h rt_mxclassid.h fixedpoint.h \
		  fixpoint_spec.h rtw_continuous.h rtw_extmode.h rtw_matlogging.h rtw_solver.h rtw_storage.h simstruc.h \
		  simstruc_compcond.h simstruc_debug.h simstruc_def.h simstruc_implement.h simstruc_internal.h simstruc_types.h \
		  simulink_solver_api.h sl_common_types_def.h sl_datatype_access.h sl_fixpt.h sl_prodhwdevicetype.h \
		  sl_report_types.h sl_sample_time_defs.h sl_types_def.h slexec_block_runtime_service.h solver_zc.h sysran_types.h \
		  ds_simple_twozone.h ds_simple_twozone_dsmpbap.h ds_simple_twozone_dsrtmdlfcn.h ds_simple_twozone_dsrtmf.h \
		  ds_simple_twozone_dsrttf.h ds_simple_twozone_dsrtvdf.h ds_simple_twozone_private.h ds_simple_twozone_types.h \
		  multiword_types.h rt_nonfinite.h rtGetInf.h rtGetNaN.h rtmodel.h rtwtypes.h

EXTHDRS=

# [EOF] 
 
### OPUS MKMF:  Do not remove this line!  Generated dependencies follow.

ds_simple_twozone.o86: ds_simple_twozone.c \
	 ds_simple_twozone_dsrtvdf.h \
		 ds_simple_twozone.h \
			 rtwtypes.h \
				 tmwtypes.h \
				 simstruc_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
					 sl_types_def.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_matlogging.h \
						 sl_types_def.h \
							 # rtwtypes.h \
					 rtw_extmode.h \
					 rtw_continuous.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_solver.h \
						 rtw_continuous.h \
							 # rtwtypes.h \
					 sysran_types.h \
					 sl_sample_time_defs.h \
			 simstruc.h \
				 simstruc_compcond.h \
					 simstruc_types.h \
						 # rtwtypes.h \
						 # sl_types_def.h \
						 # rtw_matlogging.h \
						 # rtw_extmode.h \
						 # rtw_continuous.h \
						 # rtw_solver.h \
						 # sysran_types.h \
						 # sl_sample_time_defs.h \
					 solver_zc.h \
					 slexec_block_runtime_service.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 simstruc_def.h \
					 sl_common_types_def.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_fixpt.h \
						 sl_datatype_access.h \
							 sl_types_def.h \
								 # rtwtypes.h \
							 sl_report_types.h \
						 rtw_storage.h \
				 simstruc_debug.h \
				 simstruc_internal.h \
					 simstruc_implement.h \
					 sl_prodhwdevicetype.h \
					 simulink_solver_api.h \
						 simstruc.h \
							 # simstruc_compcond.h \
							 # simstruc_types.h \
							 # simstruc_def.h \
							 # simstruc_debug.h \
							 # simstruc_internal.h \
			 fixedpoint.h \
				 fixpoint_spec.h \
				 simstruc.h \
					 # simstruc_compcond.h \
					 # simstruc_types.h \
					 # simstruc_def.h \
					 # simstruc_debug.h \
					 # simstruc_internal.h \
			 ds_simple_twozone_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 ds_simple_twozone_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
			 rt_nonfinite.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 ds_simple_twozone_private.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
	 ds_simple_twozone.h \
		 # rtwtypes.h \
		 # simstruc.h \
		 # fixedpoint.h \
		 # ds_simple_twozone_dsmpbap.h \
		 # ds_simple_twozone_types.h \
		 # multiword_types.h \
		 # rt_nonfinite.h \
	 ds_simple_twozone_private.h \
		 # rtwtypes.h \
		 # multiword_types.h

rt_matrx.o86: rt_matrx.c \
	 rtwtypes.h \
		 tmwtypes.h \
		 simstruc_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 sl_types_def.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 rtw_matlogging.h \
				 sl_types_def.h \
					 # rtwtypes.h \
			 rtw_extmode.h \
			 rtw_continuous.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 rtw_solver.h \
				 rtw_continuous.h \
					 # rtwtypes.h \
			 sysran_types.h \
			 sl_sample_time_defs.h \
	 rt_mxclassid.h \
	 rt_matrx.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 rt_mxclassid.h

rt_printf.o86: rt_printf.c

ds_simple_twozone_data.o86: ds_simple_twozone_data.c \
	 ds_simple_twozone.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
		 simstruc.h \
			 simstruc_compcond.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 solver_zc.h \
				 slexec_block_runtime_service.h \
			 simstruc_types.h \
				 # rtwtypes.h \
				 # sl_types_def.h \
				 # rtw_matlogging.h \
				 # rtw_extmode.h \
				 # rtw_continuous.h \
				 # rtw_solver.h \
				 # sysran_types.h \
				 # sl_sample_time_defs.h \
			 simstruc_def.h \
				 sl_common_types_def.h \
					 sl_types_def.h \
						 # rtwtypes.h \
					 sl_fixpt.h \
					 sl_datatype_access.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_report_types.h \
					 rtw_storage.h \
			 simstruc_debug.h \
			 simstruc_internal.h \
				 simstruc_implement.h \
				 sl_prodhwdevicetype.h \
				 simulink_solver_api.h \
					 simstruc.h \
						 # simstruc_compcond.h \
						 # simstruc_types.h \
						 # simstruc_def.h \
						 # simstruc_debug.h \
						 # simstruc_internal.h \
		 fixedpoint.h \
			 fixpoint_spec.h \
			 simstruc.h \
				 # simstruc_compcond.h \
				 # simstruc_types.h \
				 # simstruc_def.h \
				 # simstruc_debug.h \
				 # simstruc_internal.h \
		 ds_simple_twozone_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 ds_simple_twozone_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
		 rt_nonfinite.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
	 ds_simple_twozone_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h

ds_simple_twozone_dsrtmdlfcn.o86: ds_simple_twozone_dsrtmdlfcn.c \
	 rtmodel.h \
		 ds_simple_twozone.h \
			 rtwtypes.h \
				 tmwtypes.h \
				 simstruc_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
					 sl_types_def.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_matlogging.h \
						 sl_types_def.h \
							 # rtwtypes.h \
					 rtw_extmode.h \
					 rtw_continuous.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_solver.h \
						 rtw_continuous.h \
							 # rtwtypes.h \
					 sysran_types.h \
					 sl_sample_time_defs.h \
			 simstruc.h \
				 simstruc_compcond.h \
					 simstruc_types.h \
						 # rtwtypes.h \
						 # sl_types_def.h \
						 # rtw_matlogging.h \
						 # rtw_extmode.h \
						 # rtw_continuous.h \
						 # rtw_solver.h \
						 # sysran_types.h \
						 # sl_sample_time_defs.h \
					 solver_zc.h \
					 slexec_block_runtime_service.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 simstruc_def.h \
					 sl_common_types_def.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_fixpt.h \
						 sl_datatype_access.h \
							 sl_types_def.h \
								 # rtwtypes.h \
							 sl_report_types.h \
						 rtw_storage.h \
				 simstruc_debug.h \
				 simstruc_internal.h \
					 simstruc_implement.h \
					 sl_prodhwdevicetype.h \
					 simulink_solver_api.h \
						 simstruc.h \
							 # simstruc_compcond.h \
							 # simstruc_types.h \
							 # simstruc_def.h \
							 # simstruc_debug.h \
							 # simstruc_internal.h \
			 fixedpoint.h \
				 fixpoint_spec.h \
				 simstruc.h \
					 # simstruc_compcond.h \
					 # simstruc_types.h \
					 # simstruc_def.h \
					 # simstruc_debug.h \
					 # simstruc_internal.h \
			 ds_simple_twozone_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 ds_simple_twozone_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
			 rt_nonfinite.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
	 rtwtypes.h \
		 # tmwtypes.h \
		 # simstruc_types.h \
	 ds_simple_twozone_dsrtmdlfcn.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h

ds_simple_twozone_dsrtmf.o86: ds_simple_twozone_dsrtmf.c \
	 ds_simple_twozone.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
		 simstruc.h \
			 simstruc_compcond.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 solver_zc.h \
				 slexec_block_runtime_service.h \
			 simstruc_types.h \
				 # rtwtypes.h \
				 # sl_types_def.h \
				 # rtw_matlogging.h \
				 # rtw_extmode.h \
				 # rtw_continuous.h \
				 # rtw_solver.h \
				 # sysran_types.h \
				 # sl_sample_time_defs.h \
			 simstruc_def.h \
				 sl_common_types_def.h \
					 sl_types_def.h \
						 # rtwtypes.h \
					 sl_fixpt.h \
					 sl_datatype_access.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_report_types.h \
					 rtw_storage.h \
			 simstruc_debug.h \
			 simstruc_internal.h \
				 simstruc_implement.h \
				 sl_prodhwdevicetype.h \
				 simulink_solver_api.h \
					 simstruc.h \
						 # simstruc_compcond.h \
						 # simstruc_types.h \
						 # simstruc_def.h \
						 # simstruc_debug.h \
						 # simstruc_internal.h \
		 fixedpoint.h \
			 fixpoint_spec.h \
			 simstruc.h \
				 # simstruc_compcond.h \
				 # simstruc_types.h \
				 # simstruc_def.h \
				 # simstruc_debug.h \
				 # simstruc_internal.h \
		 ds_simple_twozone_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 ds_simple_twozone_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
		 rt_nonfinite.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
	 ds_simple_twozone_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
	 ds_simple_twozone_dsrtmf.h

ds_simple_twozone_dsrttf.o86: ds_simple_twozone_dsrttf.c \
	 ds_simple_twozone_dsrttf.h \
	 ds_simple_twozone.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
		 simstruc.h \
			 simstruc_compcond.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 solver_zc.h \
				 slexec_block_runtime_service.h \
			 simstruc_types.h \
				 # rtwtypes.h \
				 # sl_types_def.h \
				 # rtw_matlogging.h \
				 # rtw_extmode.h \
				 # rtw_continuous.h \
				 # rtw_solver.h \
				 # sysran_types.h \
				 # sl_sample_time_defs.h \
			 simstruc_def.h \
				 sl_common_types_def.h \
					 sl_types_def.h \
						 # rtwtypes.h \
					 sl_fixpt.h \
					 sl_datatype_access.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_report_types.h \
					 rtw_storage.h \
			 simstruc_debug.h \
			 simstruc_internal.h \
				 simstruc_implement.h \
				 sl_prodhwdevicetype.h \
				 simulink_solver_api.h \
					 simstruc.h \
						 # simstruc_compcond.h \
						 # simstruc_types.h \
						 # simstruc_def.h \
						 # simstruc_debug.h \
						 # simstruc_internal.h \
		 fixedpoint.h \
			 fixpoint_spec.h \
			 simstruc.h \
				 # simstruc_compcond.h \
				 # simstruc_types.h \
				 # simstruc_def.h \
				 # simstruc_debug.h \
				 # simstruc_internal.h \
		 ds_simple_twozone_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 ds_simple_twozone_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
		 rt_nonfinite.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
	 ds_simple_twozone_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h

ds_simple_twozone_dsrtvdf.o86: ds_simple_twozone_dsrtvdf.c \
	 ds_simple_twozone_dsrtvdf.h \
		 ds_simple_twozone.h \
			 rtwtypes.h \
				 tmwtypes.h \
				 simstruc_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
					 sl_types_def.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_matlogging.h \
						 sl_types_def.h \
							 # rtwtypes.h \
					 rtw_extmode.h \
					 rtw_continuous.h \
						 rtwtypes.h \
							 # tmwtypes.h \
							 # simstruc_types.h \
					 rtw_solver.h \
						 rtw_continuous.h \
							 # rtwtypes.h \
					 sysran_types.h \
					 sl_sample_time_defs.h \
			 simstruc.h \
				 simstruc_compcond.h \
					 simstruc_types.h \
						 # rtwtypes.h \
						 # sl_types_def.h \
						 # rtw_matlogging.h \
						 # rtw_extmode.h \
						 # rtw_continuous.h \
						 # rtw_solver.h \
						 # sysran_types.h \
						 # sl_sample_time_defs.h \
					 solver_zc.h \
					 slexec_block_runtime_service.h \
				 simstruc_types.h \
					 # rtwtypes.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 simstruc_def.h \
					 sl_common_types_def.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_fixpt.h \
						 sl_datatype_access.h \
							 sl_types_def.h \
								 # rtwtypes.h \
							 sl_report_types.h \
						 rtw_storage.h \
				 simstruc_debug.h \
				 simstruc_internal.h \
					 simstruc_implement.h \
					 sl_prodhwdevicetype.h \
					 simulink_solver_api.h \
						 simstruc.h \
							 # simstruc_compcond.h \
							 # simstruc_types.h \
							 # simstruc_def.h \
							 # simstruc_debug.h \
							 # simstruc_internal.h \
			 fixedpoint.h \
				 fixpoint_spec.h \
				 simstruc.h \
					 # simstruc_compcond.h \
					 # simstruc_types.h \
					 # simstruc_def.h \
					 # simstruc_debug.h \
					 # simstruc_internal.h \
			 ds_simple_twozone_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 ds_simple_twozone_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
			 rt_nonfinite.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 ds_simple_twozone_private.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
	 ds_simple_twozone.h \
		 # rtwtypes.h \
		 # simstruc.h \
		 # fixedpoint.h \
		 # ds_simple_twozone_dsmpbap.h \
		 # ds_simple_twozone_types.h \
		 # multiword_types.h \
		 # rt_nonfinite.h \
	 ds_simple_twozone_private.h \
		 # rtwtypes.h \
		 # multiword_types.h

rtGetInf.o86: rtGetInf.c \
	 rtGetInf.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
		 rt_nonfinite.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h

rtGetNaN.o86: rtGetNaN.c \
	 rtGetNaN.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
		 rt_nonfinite.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h

rt_nonfinite.o86: rt_nonfinite.c \
	 rt_nonfinite.h \
		 rtwtypes.h \
			 tmwtypes.h \
			 simstruc_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 sl_types_def.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_matlogging.h \
					 sl_types_def.h \
						 # rtwtypes.h \
				 rtw_extmode.h \
				 rtw_continuous.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
				 rtw_solver.h \
					 rtw_continuous.h \
						 # rtwtypes.h \
				 sysran_types.h \
				 sl_sample_time_defs.h \
	 rtGetNaN.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 rt_nonfinite.h \
			 # rtwtypes.h \
	 rtGetInf.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 rt_nonfinite.h \
			 # rtwtypes.h

dspaceexample_s_dy4854h2b34.o86: dspaceexample_s_dy4854h2b34.c \
	 ss2dym.c \
		 tmwtypes.h \
		 simstruc.h \
			 simstruc_compcond.h \
				 simstruc_types.h \
					 rtwtypes.h \
						 tmwtypes.h \
						 simstruc_types.h \
							 # rtwtypes.h \
							 sl_types_def.h \
								 rtwtypes.h \
									 # tmwtypes.h \
									 # simstruc_types.h \
							 rtw_matlogging.h \
								 sl_types_def.h \
									 # rtwtypes.h \
							 rtw_extmode.h \
							 rtw_continuous.h \
								 rtwtypes.h \
									 # tmwtypes.h \
									 # simstruc_types.h \
							 rtw_solver.h \
								 rtw_continuous.h \
									 # rtwtypes.h \
							 sysran_types.h \
							 sl_sample_time_defs.h \
					 # sl_types_def.h \
					 # rtw_matlogging.h \
					 # rtw_extmode.h \
					 # rtw_continuous.h \
					 # rtw_solver.h \
					 # sysran_types.h \
					 # sl_sample_time_defs.h \
				 solver_zc.h \
				 slexec_block_runtime_service.h \
			 simstruc_types.h \
				 # rtwtypes.h \
				 # sl_types_def.h \
				 # rtw_matlogging.h \
				 # rtw_extmode.h \
				 # rtw_continuous.h \
				 # rtw_solver.h \
				 # sysran_types.h \
				 # sl_sample_time_defs.h \
			 simstruc_def.h \
				 sl_common_types_def.h \
					 sl_types_def.h \
						 # rtwtypes.h \
					 sl_fixpt.h \
					 sl_datatype_access.h \
						 sl_types_def.h \
							 # rtwtypes.h \
						 sl_report_types.h \
					 rtw_storage.h \
			 simstruc_debug.h \
			 simstruc_internal.h \
				 simstruc_implement.h \
				 sl_prodhwdevicetype.h \
				 simulink_solver_api.h \
					 simstruc.h \
						 # simstruc_compcond.h \
						 # simstruc_types.h \
						 # simstruc_def.h \
						 # simstruc_debug.h \
						 # simstruc_internal.h \
		 dsblock.h \
			 libdssetup.h \
		 userdefs.h \
		 sprwat.h \
		 cg_sfun.h \
	 matrixop.h \
		 matrixop1.h \
			 dsblock.h \
				 # libdssetup.h \
			 f2c.h \
				 dymutil.h \
		 userdefs.h \
		 dsblock.h \
			 # libdssetup.h \
		 dsutil.h \
			 delay.h \
				 libdssetup.h \
			 dymtable.h \
				 dymutil.h \
				 libdssetup.h \
			 matutil.h \
				 libdssetup.h \
			 dymutil.h \
			 sprwat.h \
			 ModelicaUtilities.h \
			 bloutil.h \
				 libdssetup.h \
		 ModelicaUtilities.h \
	 moutil.c \
		 amat.h \
			 f2c.h \
				 # dymutil.h \
			 amach.h \
			 libdssetup.h \
		 dsblock.h \
			 # libdssetup.h \
		 bloutil.h \
			 # libdssetup.h \
	 dsblock1.c \
		 dsblock.h \
			 # libdssetup.h \
		 userdefs.h \
		 userfunc.c \
		 ModelicaInternal.c \
			 ModelicaInternal.h \
			 ModelicaUtilities.h \
			 uthash.h \
			 gconstructor.h \
		 ModelicaStrings.c \
			 ModelicaStrings.h \
			 ModelicaUtilities.h \
			 uthash.h \
		 dsutil.h \
			 # delay.h \
			 # dymtable.h \
			 # matutil.h \
			 # dymutil.h \
			 # sprwat.h \
			 # ModelicaUtilities.h \
			 # bloutil.h \
		 delay.h \
			 # libdssetup.h \
	 dsblock6.c \
		 dsblock2.c \
		 dsblock3.c \
		 dsblock4.c \
	 dsblock5.c \
	 moutil.c \
		 # amat.h \
		 # dsblock.h \
		 # bloutil.h \
	 moutil.c \
		 # amat.h \
		 # dsblock.h \
		 # bloutil.h \
	 moutil.c \
		 # amat.h \
		 # dsblock.h \
		 # bloutil.h
