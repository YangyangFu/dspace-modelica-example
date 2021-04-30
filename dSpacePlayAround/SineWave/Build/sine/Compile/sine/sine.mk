CC_OPT_SET_SUPPORTED_VALUES = DEFAULT NONE CUSTOM 
INCLUDE_MAKEFILE_VERSION    = 2 
LIB_TARGET                  = sine 
SRCS= sine.c sine_data.c sine_dsrtmdlfcn.c sine_dsrtmf.c sine_dsrttf.c sine_dsrtvdf.c
MRK_FILES                   = sine.mrk sine_data.mrk sine_dsrtmdlfcn.mrk sine_dsrtmf.mrk sine_dsrttf.mrk sine_dsrtvdf.mrk  
OBJS= sine.o86 sine_data.o86 sine_dsrtmdlfcn.o86 sine_dsrtmf.o86 sine_dsrttf.o86 sine_dsrtvdf.o86
CC_SRC_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\src" 
 
CC_HDR_DIRPATHS = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 
CC_LIB_FILE                 = D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt\sine.a 
LIB_DIRPATHS                =     
CUSTOM_DIRPATHS             =    
CC_ADD_OPTS                 =     
CPP_ADD_OPTS                =     
CC_ADD_DEFINES              = DATA_PORT_ACCESS_POINT_API_VERSION=2 USE_RTMODEL MODEL=sine MT=0 RT NUMST=1 NCSTATES=0 NO_PRINTF TID01EQ=0 
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
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
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
 -DMODEL=sine \
 -DMT=0 \
 -DRT \
 -DNUMST=1 \
 -DNCSTATES=0 \
 -DNO_PRINTF \
 -DTID01EQ=0 
 
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
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 -IC:\PROGRA~1\MATLAB\R2020a\simulink\include \
 -IC:\PROGRA~1\MATLAB\R2020a\extern\include \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src \
 -IC:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 -ID:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
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
 -DMODEL=sine \
 -DMT=0 \
 -DRT \
 -DNUMST=1 \
 -DNCSTATES=0 \
 -DNO_PRINTF \
 -DTID01EQ=0 
 
# ============================================================================= 
# MKMF Section 
# ============================================================================= 

# ----------------------------------------------------------------------------- 
# MKMF Configuration 
# ----------------------------------------------------------------------------- 

.TYPE.C   = .c .cpp 
.TYPE.OBJ = .o86 .o86 

.PATH.c = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\src; 
 
.PATH.cpp = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\src; 
 
.PATH.h = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine; \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt; \
 C:\PROGRA~1\MATLAB\R2020a\extern\include; \
 C:\PROGRA~1\MATLAB\R2020a\simulink\include; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src; \
 C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common; 
 

.HDRPATH.c = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 | \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 
.HDRPATH.cpp = \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 | \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt \
 D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine" \
 "D:\github\dspace-modelica-example\dSpacePlayAround\SineWave\Components\sine\sine_dsrt" \
 "C:\PROGRA~1\MATLAB\R2020a\extern\include" \
 "C:\PROGRA~1\MATLAB\R2020a\simulink\include" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src" \
 "C:\PROGRA~1\MATLAB\R2020a\rtw\c\src\ext_mode\common" 
 

.CDEFINES.c  = -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  
.CDEFINES.cpp = -D__cplusplus -D_GLIBCXX_USE_CXX11_ABI=0  -D_DSx86_32 -D_DS2510 -DDS_PLATFORM_X86 -DDS_PLATFORM_LE -DDS_PLATFORM_POSIX -DDS_PLATFORM_QNX -DDS_PLATFORM_CN -DDS_PLATFORM_HCN -DDS_PLATFORM_SMART -DDS_PLATFORM_SMARTHIL -DDS_PLATFORM_SMP -D__HOSTNAME__=\MEEN-1PX7H63\ -D__INTEGRATION__=\4.6.1\ -DDS_RTLIB_VERSION_MAR=4 -DDS_RTLIB_VERSION_MIR=6 -DDS_QNX_VERSION=650 -DQNX_VERSION=6.5.0 -D_INLINE  

MKMF_SRCS  = sine.c sine_data.c sine_dsrtmdlfcn.c sine_dsrtmf.c sine_dsrttf.c sine_dsrtvdf.c  
MKMF_LINELEN = 118 
MKMF_TABLEN  = 2 

# ----------------------------------------------------------------------------- 
# MKMF Replacements 
# ----------------------------------------------------------------------------- 

HDRS= tmwtypes.h rtw_continuous.h rtw_extmode.h rtw_matlogging.h rtw_solver.h simstruc_types.h sl_sample_time_defs.h \
		  sl_types_def.h sysran_types.h multiword_types.h rtmodel.h rtwtypes.h sine.h sine_dsmpbap.h sine_dsrtmdlfcn.h \
		  sine_dsrtmf.h sine_dsrttf.h sine_dsrtvdf.h sine_private.h sine_types.h

EXTHDRS=

# [EOF] 
 
### OPUS MKMF:  Do not remove this line!  Generated dependencies follow.

sine.o86: sine.c \
	 sine_dsrtvdf.h \
		 sine.h \
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
			 rtw_continuous.h \
				 # rtwtypes.h \
			 rtw_solver.h \
				 # rtw_continuous.h \
			 sine_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 sine_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
		 sine_private.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
	 sine.h \
		 # rtwtypes.h \
		 # rtw_continuous.h \
		 # rtw_solver.h \
		 # sine_dsmpbap.h \
		 # sine_types.h \
		 # multiword_types.h \
	 sine_private.h \
		 # rtwtypes.h \
		 # multiword_types.h

sine_data.o86: sine_data.c \
	 sine.h \
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
		 rtw_continuous.h \
			 # rtwtypes.h \
		 rtw_solver.h \
			 # rtw_continuous.h \
		 sine_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 sine_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
	 sine_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h

sine_dsrtmdlfcn.o86: sine_dsrtmdlfcn.c \
	 rtmodel.h \
		 sine.h \
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
			 rtw_continuous.h \
				 # rtwtypes.h \
			 rtw_solver.h \
				 # rtw_continuous.h \
			 sine_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 sine_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
	 rtwtypes.h \
		 # tmwtypes.h \
		 # simstruc_types.h \
	 sine_dsrtmdlfcn.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h

sine_dsrtmf.o86: sine_dsrtmf.c \
	 sine.h \
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
		 rtw_continuous.h \
			 # rtwtypes.h \
		 rtw_solver.h \
			 # rtw_continuous.h \
		 sine_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 sine_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
	 sine_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
	 sine_dsrtmf.h

sine_dsrttf.o86: sine_dsrttf.c \
	 sine_dsrttf.h \
	 sine.h \
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
		 rtw_continuous.h \
			 # rtwtypes.h \
		 rtw_solver.h \
			 # rtw_continuous.h \
		 sine_dsmpbap.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
		 sine_types.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h \
	 sine_private.h \
		 rtwtypes.h \
			 # tmwtypes.h \
			 # simstruc_types.h \
		 multiword_types.h \
			 # rtwtypes.h

sine_dsrtvdf.o86: sine_dsrtvdf.c \
	 sine_dsrtvdf.h \
		 sine.h \
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
			 rtw_continuous.h \
				 # rtwtypes.h \
			 rtw_solver.h \
				 # rtw_continuous.h \
			 sine_dsmpbap.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
			 sine_types.h \
				 rtwtypes.h \
					 # tmwtypes.h \
					 # simstruc_types.h \
				 multiword_types.h \
					 rtwtypes.h \
						 # tmwtypes.h \
						 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
		 sine_private.h \
			 rtwtypes.h \
				 # tmwtypes.h \
				 # simstruc_types.h \
			 multiword_types.h \
				 # rtwtypes.h \
	 sine.h \
		 # rtwtypes.h \
		 # rtw_continuous.h \
		 # rtw_solver.h \
		 # sine_dsmpbap.h \
		 # sine_types.h \
		 # multiword_types.h \
	 sine_private.h \
		 # rtwtypes.h \
		 # multiword_types.h
