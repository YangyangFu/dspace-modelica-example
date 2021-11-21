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


#---------------------------------------------------------
# Define constants
# ---------------------------------------------------------
# A new root path in the system folder.
PROJECTROOTPATH = "D:\github\dspace-modelica-example"
# The name of a project.
PROJECTNAME = "FiveZoneDemoControlDesk"
# The name of an experiment used in this demo.
EXPERIMENTNAME = "simulink_onezonevav"


def initializeDSpace():
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
    ControlDeskApplication = Dispatch("ControlDeskNG.Application.7.2")

    # Create the enums object.
    Enum = Enums(ControlDeskApplication)

    # Set ControlDesk visible.
    ControlDeskApplication.MainWindow.Visible = True

    # Maximize ControlDesk.
    ControlDeskApplication.MainWindow.State = Enum.MainWindowState.Maximized

    # Check if the project root doesn't already exist.
    if not ControlDeskApplication.ProjectRoots.Contains(PROJECTROOTPATH):
        # Create Demo Root Object.
        projectRoot = ControlDeskApplication.ProjectRoots.Add(PROJECTROOTPATH)
    else:
        # Get Project root.
        projectRoot = ControlDeskApplication.ProjectRoots.Item(PROJECTROOTPATH)

    # Activate new project root.
    projectRoot.Activate()

    # Show project window. 
    if ControlDeskApplication.MainWindow.Windows.Contains('project'):
        ControlDeskApplication.MainWindow.Windows.Item('project').Show()


initializeDSpace()
