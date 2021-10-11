################################################################################
### Template file         : CoreMakeManagement_ext.tmk
### File                  : ds_modelica_constant_ext.mk
### Compatibility         : DSMAKE 6.12
### Description           : Application specific makefile.
###
### Copyright 2015, dSPACE GmbH. ALL rights reserved.
###
################################################################################

#-------------------------------------------------------------------------------
# APPL Specific Settings
#-------------------------------------------------------------------------------

OUTPUT_FILE_NAME              = ds_modelica_constant
OUTPUT_FILE_TYPE              = APPLICATION

# Application variants.
APPL_VARS                          =

# Variant: DEFAULT
APPL_VARS                         += DEFAULT
APPL_VAR_NAME_DEFAULT              = ds_modelica_constant_DEFAULT
APPL_VAR_OPT_Linkage_DEFAULT       = DEFAULT
APPL_VAR_RESULT_DIRPATH_DEFAULT    = "D:\github\dspace-modelica-example\dSpaceExample\FiveZoneDemo\ModelicaConstant\Build\Results.tmp"



#-------------------------------------------------------------------------------
# Interface Settings
#-------------------------------------------------------------------------------

INTERFACE_CC_SRC_FILES        += \
 mdladapter_mdlfunctions.cpp \
 mdlCode_ap.cpp \
 data_in_ap.cpp \
 data_out_ap.cpp \
 fm_entry_ap.cpp \
 fm_exit_ap.cpp \
 dssimengine_accesspoint.cpp \
 dssimengine_api.cpp \
 dssimengine_main.cpp \
 rtosal_task.cpp \
 rtosal_taskap.cpp \
 rtosal_simengineap.cpp \
 IOCode_Data.cpp \
 dssimengine_accesspoint_Voltage_Out.cpp

INTERFACE_CC_SRC_DIRPATHS     += \
 ".\..\SysIntCode" \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src"

INTERFACE_CC_HDR_DIRPATHS     += \
 ".\..\SysIntCode" \
 "C:\Program Files\dSPACE RCPHIL 2020-A\ConfigurationDesk\Implementation\EmbeddedSW\Src"

INTERFACE_LIB_DIRPATHS        +=

INTERFACE_CUSTOM_DIRPATHS     +=

INTERFACE_OBJ_FILEPATHS       +=

INTERFACE_LIB_FILEPATHS       +=

INTERFACE_LIB_FILES           += \
 "dsanalogoutdrv" \
 "dscandrv" \
 "dslindrv" \
 "dsethernetinterfacemanagementdrv"

INTERFACE_CC_ADD_OPTS         += 

INTERFACE_CPP_ADD_OPTS        += 

INTERFACE_CC_ADD_DEFINES      += DATA_PORT_ACCESS_POINT_API_VERSION=2

INTERFACE_CC_ADD_UNDEFS       +=

INTERFACE_CC_OPT_SET          = Default

INTERFACE_CC_CUSTOM_OPT_OPTS  = 


# Clear Macros
# Don't use $() here!
INTERFACE_CLEAR_MACROS        +=


#-------------------------------------------------------------------------------
# Dependencies
#-------------------------------------------------------------------------------

dssimengine_accesspoint.cpp : dssimengine_accesspoint.h

dssimengine_api.cpp : dssimengine_api.h

dssimengine_main.cpp : dssimengine_main.h

dssimengine_api.cpp : dssimengine_main.h

dssimengine_accesspoint.cpp : dssimengine_defines.h




# [EOF]
