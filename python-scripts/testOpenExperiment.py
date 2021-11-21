# -*- coding: cp1252 -*-
# Reference: C:\Program Files\dSPACE ControlDesk 7.2\Demos\Toolautomation\Python\AutomatingControlDesk
#
#--------------------------------------------------------------------------------------------------
# Import python library modules which are used in this demo.
# The class Dispatch is used to create objects.
# The class com_error is used to catch automation specific errors.
# The exception module is used to catch unexpected exceptions.
#--------------------------------------------------------------------------------------------------
from win32com.client import Dispatch
from dspace.com import Enums
import os
import sys
import time

#--------------------------------------------------------------------------------------------------
# Import from the demo utilities demo functions.
# These are described in the dSPACEDemoUtilities library.
#--------------------------------------------------------------------------------------------------
from DemoUtilities import DemoDialog,\
                          PrepareEnvironment,\
                          RestoreEnvironment,\
                          DemoError,\
                          Wait,\
                          CloseAllCalDemoWindows

#---------------------------------------------------------
# Define constants
# ---------------------------------------------------------
# A new root path in the system folder.
PROJECTROOTPATH = "D:\github\dspace-modelica-example"
# The name of a project.
PROJECTNAME = "FiveZoneDemoControlDesk"
# The name of an experiment used in this demo.
EXPERIMENTNAME = "simulink_onezonevav"

#--------------------------------------------------------------------------------------------------
# Class MainDemoController:
#   This is the main class that controls and runs the demo.
#--------------------------------------------------------------------------------------------------
class MainDemoController(object):
    #----------------------------------------------------------------------------------------------
    # Method __init__:
    #   This constructor initializes the MainDemoController object.
    #----------------------------------------------------------------------------------------------
    def __init__(self):
        """This method initializes the MainDemoController object.

        Syntax      : Obj.__init__()

        Description : This constructor initializes the MainDemoController object. 
        """
        # The ControlDesk Application object.
        self.ControlDeskApplication = None
        # The enums fot the ControlDesk object model.
        self.Enums = None
        # The project root where most parts of the demo are executed.
        self.ProjectRoot = None
        
    #----------------------------------------------------------------------------------------------
    # Method : Initialize
    #      This method starts ControlDesk in a visible, maximized mode and creates a new demo project 
    #      root.
    #----------------------------------------------------------------------------------------------
    def initializeDSpace(self):
        """This method starts ControlDesk in a visible, maximized mode and creates a new demo project root.

        Syntax      : Obj.Initialize()

        Parameters  : -

        Description : This method starts ControlDesk in a visible, maximized mode and creates a new demo project root.
                      If the root cannot be created or does already exist, ControlDesk will be closed.

        Return Value: -
        """
        # Accesses the ControlDesk instance. If ControlDesk is not running it will be started.
        print("Start ControlDesk at: ", PROJECTROOTPATH)

        # Start ControlDesk 7.2.
        self.ControlDeskApplication = Dispatch("ControlDeskNG.Application.7.2")

        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)

        # Set ControlDesk visible.
        self.ControlDeskApplication.MainWindow.Visible = True

        # Maximize ControlDesk.
        self.ControlDeskApplication.MainWindow.State = self.Enums.MainWindowState.Maximized

        # Check if the project root doesn't already exist.
        if not self.ControlDeskApplication.ProjectRoots.Contains(PROJECTROOTPATH):
            # Create Demo Root Object.
            projectRoot = self.ControlDeskApplication.ProjectRoots.Add(PROJECTROOTPATH)
        else:
            # Get Project root.
            projectRoot = self.ControlDeskApplication.ProjectRoots.Item(PROJECTROOTPATH)

        # Activate new project root.
        projectRoot.Activate()

        # Show project window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('project'):
            self.ControlDeskApplication.MainWindow.Windows.Item('project').Show()

    #----------------------------------------------------------------------------------------------
    # Method : CreateAndDeleteProjectRoot
    #      This method creates a new project root and deletes it afterwards.
    #----------------------------------------------------------------------------------------------
    def creatProjectRoot(self):
        pass 
    def removeProjectRoot(self):
        pass 

    #----------------------------------------------------------------------------------------------
    # Method : CreateAndDeleteProject
    #      This method creates a new project and deletes it afterwards.
    #----------------------------------------------------------------------------------------------
    def creatProject(self):
        pass 

    def removeProject(self):
        pass

    #--------------------------------------------------------------------------------------------------
    # Method : LoadProject
    #      This method loads an exiting project.
    #--------------------------------------------------------------------------------------------------
    def loadProject(self):
        """This method loads the CalDemo project.

        Syntax      : Obj.LoadProject()

        Parameters  : -

        Description : This method loads an existing project.

        Return Value: -

        Exceptions  : DemoError - A DemoError is thrown if the CalDemo project doesn't exist in any project root.
        """
        # Show information in a Dialog (load project).
        print("Load project", PROJECTNAME)

        # Check if the project exists.

        # Initialize dspace by activating given project roots.
        self.initializeDSpace()
        
        # Check if project is in active root.
        activeProjectRoot=self.ControlDeskApplication.ActiveProjectRoot

        # Get project with given name.
        projectItem = activeProjectRoot.Projects.Item(PROJECTNAME)

        # Open project.
        projectItem.Open()

    def closeProject(self):
        pass
    #--------------------------------------------------------------------------------------------------
    # Method : ReadInfoFromActiveProject
    #      This method reads information from the active project.
    #--------------------------------------------------------------------------------------------------
    def readInfoFromActiveProject(self):
        """This method reads information from the active project.

        Syntax      : Obj.ReadInformationFromProject()

        Parameters  : -

        Description : This method reads information from the active project if one exists and shows the 
                      result in a dialog.

        Return Value: -

        Exceptions  : DemoError - A DemorError is thrown if no active project exists.
        """
        # Show information in a Dialog (read information from active project).
        print("Read information From Active project")

        # Get active project.
        activeProject = self.ControlDeskApplication.ActiveProject

        # Check if there is an active project.
        if not activeProject:
            RuntimeError("No such project: ", activeProject)

        # Save information in dictionary.
        projectInformation = {}

        # Add name to dictionary.
        projectInformation['Name'] = activeProject.Name

        # Add path to dictionary.
        projectInformation['Path'] = activeProject.FullPath

        # Add description to dictionary.
        projectInformation['Description'] = activeProject.Description

        # Add modified state to dictionary.
        projectInformation['IsModified'] = activeProject.IsModified

        # Add number of experiments to dictionary.
        projectInformation['ExpNo'] = activeProject.Experiments.Count

        # Add number of files to dictionary.
        projectInformation['FilesNo'] = activeProject.Files.Count

        # Show project information in a Dialog.
        print("Show project information: ==============================")
        print(projectInformation)

    #--------------------------------------------------------------------------------------------------
    # Method : CreateAndEditProject
    #      This method creates a new project and edits it.
    #--------------------------------------------------------------------------------------------------
    def loadExperiment(self):
        """This method loads an existing project and edits it.

        Syntax      : Obj.laodExperiment(PROJECTNAME,EXPERIMENTNAME)

        Parameters  : -

        Description : This method creates a new project with an experiment and a platform. After that it
                      creates a backup, deletes the new project and reloads the backup.

        Return Value: -

        Exceptions  : DemoError - The DemoError is thrown if the project already exists and should not be overwritten.
        """
        # Show information in a dialog (create project, add experiment, add platform).
        print("Load an existing exoeriment", EXPERIMENTNAME)

        # Initialize dspace
        self.initializeDSpace()
        # Get the project.
        project = self.ControlDeskApplication.Projects.Item(PROJECTNAME)
        # Open the project.
        activeProject = project.Open()
        # Get an experiment.
        experiment = activeProject.Experiments.Item(EXPERIMENTNAME)
        # Activate the experiment.
        activeExperiment = experiment.Activate()

    def closeExperiment(self):
        pass

    #--------------------------------------------------------------------------------------------------
    # Method : PeroformCalibration
    #      This method perform calibration from an experiment
    #--------------------------------------------------------------------------------------------------
    def startOnlineCalibration(self):
        # Add  platform.
        #platform = self.ControlDeskApplication.ActiveExperiment.Platforms.Add(
        #                    self.Enums.PlatformType.SCALEXIO)
        # Connect device.
        #platform.Connect()
        # Start online calibration.
        self.ControlDeskApplication.CalibrationManagement.StartOnlineCalibration()
    
        # Stop online calibration.
        #self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()
    
    def startMeasurement(self):
        Wait(3)
        
        self.MeasurementDataManagement = Dispatch(self.ControlDeskApplication.MeasurementDataManagement)
        # Add DummyOmega variable.
        # Syntax: PlatformName(RasterName)://UniqueVariableName
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(DUMMY_OMEGA_VARIABLE_CONNECTION_STRING %\
                                                                            self.DemoPlatform.Name)

        # Add variable 'f_Ki_1'.
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(FKI_VARIABLE_CONNECTION_STRING %\
                 
#--------------------------------------------------------------------------------------------------
# Main Program
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    # Test: load an experiment.
    control = MainDemoController()
    control.loadExperiment()


    TDis = '%s(1000ms)://Model Root/out/TDis'
    TRoo = '%s(1000ms)://Model Root/out/TRoo'

    control.startMeaurement()


