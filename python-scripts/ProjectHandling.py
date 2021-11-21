# -*- coding: cp1252 -*-
"""
file:           ProjectHandling.py

Description:    This script shows how to work with projects. The following tasks are included:
                - Show information about the project roots.
                - Create and remove project root.
                - Create, load and remove projects.
                - Show information about the active project.
                - Add an experiment and a platform to the active project.
                - Create and load a backup of a project.

Preconditions:  ControlDesk 7.2 has been installed.

Tip/Remarks:    The script command line arguments are the following:
                '-c' or '--console': Print everything to the console.
                '-q' or '--quiet'  : Don't show the dialog boxes.

Limitations:    -

Version:        1.20

Date:           Jan 2020

                dSPACE GmbH shall not be liable for errors contained herein or
                direct, indirect, special, incidental, or consequential damages
                in connection with the furnishing, performance, or use of this
                file.
                Brand names or product names are trademarks or registered
                trademarks of their respective companies or organizations.

Copyright (c) 2020 by dSPACE GmbH
"""
#--------------------------------------------------------------------------------------------------
# Import python library modules which are used in this demo.
# The class Dispatch is used to create objects.
# The class com_error is used to catch automation specific errors.
# The module tempfile is used to have access to the temporary system folder.
# The os module is used to have access to the dSPACE root directory.
# The exception module is used to catch unexpected exceptions.
#--------------------------------------------------------------------------------------------------
from win32com.client import Dispatch
from win32com.client import DispatchWithEvents
from dspace.com import Enums
from pywintypes import com_error
import tempfile
import os
import sys

#--------------------------------------------------------------------------------------------------
# Import from the demo utilities helper functions.
# These are described in the DemoUtilities library.
#--------------------------------------------------------------------------------------------------
from DemoUtilities import DemoDialog,\
                          PrepareEnvironment,\
                          RestoreEnvironment,\
                                 DemoError

#--------------------------------------------------------------------------------------------------
# Import the strings used in the demo dialogs.
#--------------------------------------------------------------------------------------------------
import ProjectHandlingResources as Resources

# Create the main user interaction dialog
USERDIALOG = DemoDialog("project Handling Demo")

#--------------------------------------------------------------------------------------------------
# Define constants used in this demo.
#--------------------------------------------------------------------------------------------------

# A new root path in the temporary system folder.
PROJECTROOTPATH = os.path.join(tempfile.gettempdir(), "DemoRoot")

# The name of a project root used during the demo.
PROJECTROOTNAME = "NewTestProjectRoot"

# The name of a project used during the demo.
PROJECTNAME = "NewTestProject"

# The name of the CalDemo project.
CALDEMOPROJECTNAME = "CalDemo"

# The name of a project used during the demo.
EDITPROJECTNAME = "NewEditTestProject"

# The name of an experiment used in this demo.
EXPERIMENTNAME = "NewTestExperiment"

# The path for a project backup.
PROJECTBACKUPPATH = os.path.join(PROJECTROOTPATH, "TestBackupFor%s.zip" % EDITPROJECTNAME)

# The name of the project created from the backup.
PROJECTFROMBACKUP = "LoadedProjectFromBackup"

#--------------------------------------------------------------------------------------------------
# Class ProjectManagementEvents:
#   Defines the event sink for the project and experiment events.
#--------------------------------------------------------------------------------------------------
class ProjectManagementEvents(object):
    """Defines the event sink for the project and experiment events.

    Syntax       : OBJ = ProjectManagementEvents() 

    Parameters : -

    Description: Defines the event sink for the project and experiment events.
    """
    #----------------------------------------------------------------------------------------------
    # Method : OnProjectCreated
    #      This method will be called, if a project has been created.
    #----------------------------------------------------------------------------------------------
    def OnProjectCreated(self, project):
        """This method will be called, if a project has been created.

        Syntax      : Obj.OnProjectCreated()

        Parameters  : project - object - The created project.

        Description : This method will be called, if a project has been created.

        Return Value: -
        """
        print("--- project %s has been created. ---" % Dispatch(project).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnProjectOpened
    #      This method will be called, if a project has been opened.
    #----------------------------------------------------------------------------------------------
    def OnProjectOpened(self, activeProject):
        """This method will be called, if a project has been opened.

        Syntax      : Obj.OnProjectOpened()

        Parameters  : activeProject - object - The opened project.

        Description : This method will be called, if a project has been opened.

        Return Value: -
        """
        print("--- project %s has been opened. ---" % Dispatch(activeProject).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnProjectOpeningFromBackup
    #      This method will be called, if a project is opening from a backup.
    #----------------------------------------------------------------------------------------------
    def OnProjectOpeningFromBackup(self, backupFullPath, PROJECTNAME):
        """This method will be called, if a project is opening from a backup.

        Syntax      : Obj.OnProjectOpeningFromBackup()

        Parameters  : backupFullPath - string - The full path to the back up file.
                      PROJECTNAME    - string - The name of the project.

        Description : This method will be called, if a project is opening from a backup.

        Return Value: -
        """
        print("--- project %s is opening from Backup %s. ---" % (PROJECTNAME, backupFullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnProjectOpenedFromBackup
    #      This method will be called, if a project has been opened from a backup.
    #----------------------------------------------------------------------------------------------
    def OnProjectOpenedFromBackup(self, project, backupFullPath):
        """This method will be called, if a project has been opened from a backup.

        Syntax      : Obj.OnProjectOpenedFromBackup()

        Parameters  : project        - object - The opened project form th back up.
                      backupFullPath - string - The full path to the back up file.

        Description : This method will be called, if a project has been opened from a backup.

        Return Value: -
        """
        print("--- project %s has been opned form backup %s. ---" % (Dispatch(project).Name, backupFullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnProjectRemoving
    #      This method will be called, if a project will be removed from the working directory.
    #----------------------------------------------------------------------------------------------
    def OnProjectRemoving(self, project):
        """This method will be called, if a project will be removed from the working directory.

        Syntax      : Obj.OnProjectRemoving()

        Parameters  : project               - object  - The project which will be removed.

        Description : This method will be called, if a project will be removed from the working directory.

        Return Value: -
        """
        print("--- project %s will be removed. ---" % Dispatch(project).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectSaving
    #      This method will be called, if the active project is saving.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectSaving(self, activeProject):
        """This method will be called, if the active project is saving.

        Syntax      : Obj.OnActiveProjectSaving()

        Parameters  : activeProject - object - The saving active project.

        Description : This method will be called, if the active project is saving.

        Return Value: -
        """
        print("--- Active project %s is saving. ---" % Dispatch(activeProject).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectSaved
    #      This method will be called, if the active project has been saved.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectSaved(self, activeProject):
        """This method will be called, if the active project has been saved.

        Syntax      : Obj.OnActiveProjectSaved()

        Parameters  : activeProject - object - The saved active project.

        Description : This method will be called, if the active project has been saved.

        Return Value: -
        """
        print("--- Active project %s has been saved. ---" % Dispatch(activeProject).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectSavedAs
    #      This method will be called, if the active project has been saved as a new project.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectSavedAs(self, activeProject, oldProjectName):
        """This method will be called, if the active project has been saved as a new project.

        Syntax      : Obj.OnActiveProjectSavedAs()

        Parameters  : activeProject  - object - The active project with the new name.
                      oldProjectName - string - The old project name.

        Description : This method will be called, if the active project has been saved as a new project.

        Return Value: -
        """
        print("--- Active project %s has been saved as %s. ---" % (oldProjectName, Dispatch(activeProject).Name))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectRenamed
    #      This method will be called, if the active project has been renemed.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectRenamed(self, activeProject, oldProjectName):
        """This method will be called, if the active project has been renemed.

        Syntax      : Obj.OnActiveProjectRenamed()

        Parameters  : activeProject  - object - The active project with the new name.
                      oldProjectName - string - The old project name.

        Description : This method will be called, if the active project has been renemed.

        Return Value: -
        """
        print("--- Active project %s has been renamed to %s. ---" % (oldProjectName, Dispatch(activeProject).Name))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectBackingUp
    #      This method will be called, if the active project is backing up.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectBackingUp(self, activeProject, fullPath):
        """This method will be called, if the active project is backing up.

        Syntax      : Obj.OnActiveProjectBackingUp()

        Parameters  : activeProject - object - The active project which is backing up.
                      fullPath      - string - The full path to the back up file.

        Description : This method will be called, if the active project is backing up.

        Return Value: -
        """
        print("--- Active project %s is backing up to %s. ---" % (Dispatch(activeProject).Name, fullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectBackedUp
    #      This method will be called, if active project has been backed up.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectBackedUp(self, activeProject, fullPath):
        """This method will be called, if active project has been backed up.

        Syntax      : Obj.OnActiveProjectBackedUp()

        Parameters  : activeProject - object - The active project which has been backed up.
                      fullPath      - string - The full path to the back up file.

        Description : This method will be called, if active project has been backed up.

        Return Value: -
        """
        print("--- Active project %s has been backed up to %s. ---" % (Dispatch(activeProject).Name, fullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectClosing
    #      This method will be called, if the active project is closing.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectClosing(self, activeProject):
        """This method will be called, if the active project is closing.

        Syntax      : Obj.OnActiveProjectClosing()

        Parameters  : activeProject - object - The active project which is closing.

        Description : This method will be called, if the active project is closing.

        Return Value: -
        """
        print("--- Active project %s is closing. ---" % Dispatch(activeProject).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectClosed
    #      This method will be called, if the active project has been closed.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectClosed(self, project):
        """This method will be called, if the active project has been closed.

        Syntax      : Obj.OnActiveProjectClosed()

        Parameters  : project - object - The project which has been closed.

        Description : This method will be called, if the active project has been closed.

        Return Value: -
        """
        print("--- Active project %s has been closed. ---" % Dispatch(project).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveProjectFileRemoving
    #      This method will be called, if from a active project a file will be removed.
    #----------------------------------------------------------------------------------------------
    def OnActiveProjectFileRemoving(self, activeProject, file, fileWillBeDeleted):
        """This method will be called, if from a active project a file will be removed.

        Syntax      : Obj.OnActiveProjectFileRemoving()

        Parameters  : activeProject     - object  - The active project from which a file will be removed.
                      file              - object  - The file which will be removed.
                      fileWillBeDeleted - boolean - Indicates if the file will be delete on the disk.

        Description : This method will be called, if from a active project a file will be removed.

        Return Value: -
        """
        print("--- From the project %s the file %s will be removed (file will be deleted: %s). ---"\
              % (Dispatch(activeProject).Name, Dispatch(file).FileName, fileWillBeDeleted))

    #----------------------------------------------------------------------------------------------
    # Method : OnExperimentActivating
    #      This method will be called, if a experiment is activating.
    #----------------------------------------------------------------------------------------------
    def OnExperimentActivating(self, Experiment):
        """This method will be called, if a experiment is activating.

        Syntax      : Obj.OnExperimentActivating()

        Parameters  : Experiment - object - The experiment which is activating.

        Description : This method will be called, if a experiment is activating.

        Return Value: -
        """
        # NOTE: Accessing Experiment.Name directly raises an error.
        print("--- Experiment %s is activating. ---" % Dispatch(Experiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnExperimentActivated
    #      This method will be called, if a experiment has been activated.
    #----------------------------------------------------------------------------------------------
    def OnExperimentActivated(self, activeExperiment):
        """This method will be called, if a experiment has been activated.

        Syntax      : Obj.OnExperimentActivated()

        Parameters  : activeExperiment - object - The active experiment which has been activated.

        Description : This method will be called, if a experiment has been activated.

        Return Value: -
        """
        print("--- Experiment %s has been activated. ---" % Dispatch(activeExperiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnExperimentImported
    #      This method will be called, if an experiment has been imported.
    #----------------------------------------------------------------------------------------------
    def OnExperimentImported(self, Experiment):
        """This method will be called, if an experiment has been imported.

        Syntax      : Obj.OnExperimentImported()

        Parameters  : Experiment - object - The experiment which has been imported.

        Description : This method will be called, if an experiment has been imported.

        Return Value: -
        """
        print("--- Experiment %s has been imported. ---" % Dispatch(Experiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnExperimentRemoving
    #      This method will be called, if a experiment will be removed.
    #----------------------------------------------------------------------------------------------
    def OnExperimentRemoving(self, Experiment, deleteFromDisk):
        """This method will be called, if a experiment will be removed.

        Syntax      : Obj.OnExperimentRemoving()

        Parameters  : Experiment     - object  - The experiment which will be removed.
                      deleteFromDisk - boolean - Indicates if the file will be deleted from the disk.

        Description : This method will be called, if a experiment will be removed.

        Return Value: -
        """
        print("--- Experiment %s will be removed. ---" % Dispatch(Experiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentDeactivating
    #      This method will be called, if the active experiment is deactivating.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentDeactivating(sef, activeExperiment):
        """This method will be called, if the active experiment is deactivating.

        Syntax      : Obj.OnActiveExperimentDeactivating()

        Parameters  : activeExperiment - object - The active experiment which will be deactivated.

        Description : This method will be called, if the active experiment is deactivating.

        Return Value: -
        """
        print("--- Active experiment %s is deactivating. ---" % Dispatch(activeExperiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentDeactivated
    #      This method will be called, if active experiment has been deactivated.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentDeactivated(self, Experiment):
        """This method will be called, if active experiment has been deactivated.

        Syntax      : Obj.OnActiveExperimentDeactivated()

        Parameters  : Experiment - object - The experiment which has been deactivated.

        Description : This method will be called, if active experiment has been deactivated.

        Return Value: -
        """
        print("--- Experiment %s has been deactivated. ---" % Dispatch(Experiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentCreated
    #      This method will be called, if the active experiment has been created.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentCreated(self, activeExperiment):
        """This method will be called, if the active experiment has been created.

        Syntax      : Obj.OnActiveExperimentCreated()

        Parameters  : activeExperiment - object - The active experiment which has been created.

        Description : This method will be called, if the active experiment has been created.

        Return Value: -
        """
        print("--- Active experiment %s has been created. ---" % Dispatch(activeExperiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentSavedAs
    #      This method will be called, if the active experiment has been saved as a new experiment.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentSavedAs(self, activeExperiment, OldExperimentName):
        """This method will be called, if the active experiment has been saved as a new experiment.

        Syntax      : Obj.OnActiveExperimentSavedAs()

        Parameters  : activeExperiment  - object - The active experiment which have been saved a.
                      OldExperimentName - string - The previous name of the experiment.

        Description : This method will be called, if the active experiment has been saved as a new experiment.

        Return Value: -
        """
        print("--- Active experiment %s has been saved as %s. ---"\
              % (OldExperimentName, Dispatch(activeExperiment).Name))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentFileRemoving
    #      This method will be called, if a file is removing from the active experiment.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentFileRemoving(self, activeExperiment, file, fileWillBeDeleted):
        """This method will be called, if a file is removing from the active experiment.

        Syntax      : Obj.OnActiveExperimentFileRemoving()

        Parameters  : activeExperiment  - object  - The active experiment from which a file will be removed.
                      file              - object  - The file which will be removed from the active experiment.
                      fileWillBeDeleted - boolean - The file will be deleted if this argument is true.

        Description : This method will be called, if a file is removing from the active experiment.

        Return Value: -
        """
        print("--- From the active experiment %s the file %s is removing (file will be deletet: %s). ---"\
              % (Dispatch(activeExperiment).Name, file, fileWillBeDeleted))

    #----------------------------------------------------------------------------------------------
    # Method : OnActiveExperimentFileRemoving
    #      This method will be called, if an active experiment has been exported.
    #----------------------------------------------------------------------------------------------
    def OnActiveExperimentExported(self, activeExperiment):
        """This method will be called, if an active experiment has been exported.

        Syntax      : Obj.OnActiveExperimentExported()

        Parameters  : activeExperiment  - object  - The active experiment which has been exported.

        Description : This method will be called, if an active experiment has been exported.

        Return Value: -
        """
        print("--- The experiment %s has been exported. ---" % Dispatch(activeExperiment).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnFileAddedToExperiment
    #      This method will be called, if a file has been added to the active experiment.
    #----------------------------------------------------------------------------------------------
    def OnFileAddedToExperiment(self, activeExperiment, file):
        """This method will be called, if a file has been added to the active experiment.

        Syntax      : Obj.OnFileAddedToExperiment()

        Parameters  : activeExperiment - object - The active experiment to which a file has been added.
                      file             - object - The file which has been added to the active experiment.

        Description : This method will be called, if a file has been added to the active experiment.

        Return Value: -
        """
        print("--- file %s has been added to the experiment %s. ---" % (Dispatch(file).FileName, Dispatch(activeExperiment).Name))

    #----------------------------------------------------------------------------------------------
    # Method : OnFileAddedToProject
    #      This method will be called, if a file has been added to the active project.
    #----------------------------------------------------------------------------------------------
    def OnFileAddedToProject(self, activeProject, file):
        """This method will be called, if a file has been added to the active project.

        Syntax      : Obj.OnFileAddedToProject()

        Parameters  : activeProject - object - The active project to which a file has been added.
                      file          - object - The file which has been added to the active project.

        Description : This method will be called, if a file has been added to the active project.

        Return Value: -
        """
        print("--- file %s has been added to the project %s. ---" % (Dispatch(file).FileName, Dispatch(activeProject).Name))

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

        # The project management object.
        self.ProjectManagement = None

        # The project root where most parts of the demo are executed.
        self.DemoRoot = None
        
    #----------------------------------------------------------------------------------------------
    # Method : Initialize
    #      This method starts ControlDesk in a visible, maximized mode and creates a new demo project 
    #      root.
    #----------------------------------------------------------------------------------------------
    def Initialize(self):
        """This method starts ControlDesk in a visible, maximized mode and creates a new demo project root.

        Syntax      : Obj.Initialize()

        Parameters  : -

        Description : This method starts ControlDesk in a visible, maximized mode and creates a new demo project root.
                      If the root cannot be created or does already exist, ControlDesk will be closed.

        Return Value: -
        """
        # Accesses the ControlDesk instance. If ControlDesk is not running it will be started.
        USERDIALOG.Show("Start ControlDesk", Resources.Start % PROJECTROOTPATH)

        # Start ControlDesk 7.2.
        self.ControlDeskApplication = Dispatch("ControlDeskNG.Application.7.2")

        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)

        # Connect the events for the project management
        self.ProjectManagement = DispatchWithEvents(self.ControlDeskApplication.ProjectManagement, ProjectManagementEvents)

        # Set ControlDesk visible.
        self.ControlDeskApplication.MainWindow.Visible = True

        # Maximize ControlDesk.
        self.ControlDeskApplication.MainWindow.State = self.Enums.MainWindowState.Maximized

        # Check if the project root doesn't already exist.
        if not self.ControlDeskApplication.ProjectRoots.Contains(PROJECTROOTPATH):

            # Create Demo Root Object.
            self.DemoRoot = self.ControlDeskApplication.ProjectRoots.Add(PROJECTROOTPATH)

        else:
            # Get demo root.
            self.DemoRoot = self.ControlDeskApplication.ProjectRoots.Item(PROJECTROOTPATH)

        # Activate new project root.
        self.DemoRoot.Activate()

        # Show project window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('project'):
            self.ControlDeskApplication.MainWindow.Windows.Item('project').Show()

    #----------------------------------------------------------------------------------------------
    # Method : Uninitialize
    #      This method removes the project root.
    #----------------------------------------------------------------------------------------------
    def Uninitialize(self):
        """This method removes the project root.

        Syntax      : Obj.Uninitialize()

        Parameters  : -

        Description : This method removes the project root.

        Return Value: -
        """
        # Show Dialog with information that ControlDesk will be closed.
        USERDIALOG.Show("Uninitialize", Resources.Uninitialize % PROJECTROOTPATH)

        # Check if the application object exists.
        if self.ControlDeskApplication:

            # Check if the project root exists.
            if self.DemoRoot:

                # Remove project root.
                self.DemoRoot.Remove()

                # Check if the root was removed.
                if self.ControlDeskApplication.ProjectRoots.Contains(PROJECTROOTPATH):
                    raise DemoError(Resources.RemoveProjectRootError % PROJECTROOTPATH)

        # Show dialog with the information that the demo has finished.
        USERDIALOG.Show("Demo Finished", "The demo 'project Handling' has finished!")

    #----------------------------------------------------------------------------------------------
    # Method : ReadInformationFromAllProjects
    #      This method reads information from all projects in all project roots.
    #----------------------------------------------------------------------------------------------
    def ReadInformationFromAllProjects(self):
        """This method reads information from all projects in all project roots.

        Syntax      : Obj.ReadInformationFromAllProjects()

        Parameters  : -

        Description : This method reads information from all projects in all project roots.

        Return Value: -
        """
        # Show information in a Dialog (read information).
        USERDIALOG.Show("Read information From project Roots", Resources.ProjectRootGetInfo)

        # Count the number of projects for all project roots and save the result in the ProjectRootsString.
        projectRootsInformationLines = []

        # Iterate over all project roots.
        for root in self.ControlDeskApplication.ProjectRoots:

            # Add the number of projects in the activated project root to the TempString and associate.
            # it with the project root path.
            projectRootsInformationLines.append("\n'%s' : %i projects" % (root.PathName, root.Projects.Count))

        # Activate the demo project root.
        self.DemoRoot.Activate()

        # Create information string.
        information = "\n".join(projectRootsInformationLines)

        # Show information in a Dialog.
        USERDIALOG.Show("information From project Roots", Resources.ProjectRootShowInfo % information)

    #----------------------------------------------------------------------------------------------
    # Method : CreateAndDeleteProjectRoot
    #      This method creates a new project root and deletes it afterwards.
    #----------------------------------------------------------------------------------------------
    def CreateAndDeleteProjectRoot(self):
        """This method creates a new project root and deletes it afterwards.

        Syntax      : Obj.CreateAndDeleteProjectRoot()

        Parameters  : -

        Description : This method creates a new project root with the given name in the temporary
                      system folder and deletes it afterwards.

        Return Value: -

        Exceptions  : DemoError - A DemoError is thrown if the root wasn't removed.
        """
        # Show information in a Dialog.
        USERDIALOG.Show("Create project Root", Resources.CreateNewProjectRoot % PROJECTROOTNAME)

        # Create new root path in the temporary system folder.
        newRootPath = os.path.join(tempfile.gettempdir(), PROJECTROOTNAME)

        # Check if the project root doesn't already exist.
        if not self.ControlDeskApplication.ProjectRoots.Contains(newRootPath):

            # Create Demo Root Object.
            newRoot = self.ControlDeskApplication.ProjectRoots.Add(newRootPath)

        else:       
            # Get demo root.
            newRoot = self.ControlDeskApplication.ProjectRoots.Item(newRootPath)

        # Activate new root.
        newRoot.Activate()

        # Show information in a Dialog.
        USERDIALOG.Show("Remove project Root", Resources.DeleteNewProjectRoot)

        # Remove new root.
        newRoot.Remove()

        # Check if the root was removed.
        if self.ControlDeskApplication.ProjectRoots.Contains(newRootPath):
            raise DemoError(Resources.RemoveProjectRootError % newRootPath)

    #----------------------------------------------------------------------------------------------
    # Method : CreateAndDeleteNewProject
    #      This method creates a new project with the given name and deletes it after creation from 
    #      disk.
    #----------------------------------------------------------------------------------------------
    def CreateAndDeleteNewProject(self):
        """This method creates a new project with the given name and deletes it after creation from disk..

        Syntax      : Obj.CreateAndDeleteNewProject()

        Parameters  : -

        Description : This method creates a new project with the given name and deletes it afterwards.

        Return Value: -
        """
        # Activate the demo project root.
        self.DemoRoot.Activate()

        # Show information in a dialog (create project).
        USERDIALOG.Show("Create project", Resources.CreateProject % PROJECTNAME)

        # Check if the project doesn't exist already.
        if self.ControlDeskApplication.ActiveProjectRoot.Projects.Contains(PROJECTNAME):
            # Ask the user if the project should be overwritten.
            if USERDIALOG.ShowQuestion("Remove project", Resources.RemoveProjectQuestion % PROJECTNAME):
                # Remove project.
                self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTNAME).Remove(True)
            else:
                # Raise Demo Error.
                raise DemoError(Resources.CreatedProjectAlreadyExistsError % PROJECTNAME)

        # Create a new project with the given name.
        NewProject = self.ControlDeskApplication.Projects.Add(PROJECTNAME)

        # Show information in a Dialog.
        USERDIALOG.Show("Remove project", Resources.DeleteProject % PROJECTNAME)

        # Store project path.
        ProjectPath = NewProject.FullPath

        # Close project.
        NewProject.Close(False)

        # Delete project.
        self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTNAME).Remove(True)

    #--------------------------------------------------------------------------------------------------
    # Method : LoadProject
    #      This method loads the CalDemo project.
    #--------------------------------------------------------------------------------------------------
    def LoadProject(self):
        """This method loads the CalDemo project.

        Syntax      : Obj.LoadProject()

        Parameters  : -

        Description : This method loads the CalDemo project.

        Return Value: -

        Exceptions  : DemoError - A DemoError is thrown if the CalDemo project doesn't exist in any project root.
        """
        # Show information in a Dialog (load project).
        USERDIALOG.Show("Load project", Resources.LoadProject % CALDEMOPROJECTNAME)

        # Check if the project exists.

        # Initialize root.
        calDemoRoot = None
        
        # Iterate over all project roots to find the root with the searched project.
        for root in self.ControlDeskApplication.ProjectRoots:

            # Check if the project was found.
            if root.Projects.Contains(CALDEMOPROJECTNAME):

                # Activate project root.
                root.Activate()

                # Set FoundRoot variable to true.
                calDemoRoot = root

                # Stop the for loop, so the searched project root is stored in the Root variable.
                break

        # If the CalDemo project was found, load it.
        if calDemoRoot:
            # Get project with given name.
            projectItem = calDemoRoot.Projects.Item(CALDEMOPROJECTNAME)

            # Open project.
            activeProject = projectItem.Open()

        # Open the first project found, if there is one.
        else:
            if self.ControlDeskApplication.ActiveProjectRoot.Projects.Count:
                # Get project with given name.
                projectItem = self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(0)

                # Open project.
                activeProject = projectItem.Open()

            else:
                # Create a new project with the given name.
                self.ControlDeskApplication.Projects.Add(PROJECTNAME)

    #--------------------------------------------------------------------------------------------------
    # Method : ReadInfoFromActiveProject
    #      This method reads information from the active project.
    #--------------------------------------------------------------------------------------------------
    def ReadInfoFromActiveProject(self):
        """This method reads information from the active project.

        Syntax      : Obj.ReadInformationFromProject()

        Parameters  : -

        Description : This method reads information from the active project if one exists and shows the 
                      result in a dialog.

        Return Value: -

        Exceptions  : DemoError - A DemorError is thrown if no active project exists.
        """
        # Show information in a Dialog (read information from active project).
        USERDIALOG.Show("Read information From Active project", Resources.ReadActiveProjectInfo)

        # Get active project.
        activeProject = self.ControlDeskApplication.ActiveProject

        # Check if there is an active project.
        if not activeProject:
            raise DemoError(Resources.CannotLoadActiveProjectError)

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
        USERDIALOG.Show("Show project information", Resources.ShowActiveProjectInfo % projectInformation)

    #--------------------------------------------------------------------------------------------------
    # Method : CreateAndEditProject
    #      This method creates a new project and edits it.
    #--------------------------------------------------------------------------------------------------
    def CreateAndEditProject(self):
        """This method creates a new project and edits it.

        Syntax      : Obj.CreateAndEditProject(PROJECTNAME)

        Parameters  : -

        Description : This method creates a new project with an experiment and a platform. After that it
                      creates a backup, deletes the new project and reloads the backup.

        Return Value: -

        Exceptions  : DemoError - The DemoError is thrown if the project already exists and should not be overwritten.
        """
        # Show information in a dialog (create project, add experiment, add platform).
        USERDIALOG.Show("Edit New project", Resources.AddExperimentAndPlatform % (EDITPROJECTNAME, EXPERIMENTNAME))

        # Activate project root.
        self.DemoRoot.Activate() 

        # Check if the project doesn't exist already.
        if self.ControlDeskApplication.ActiveProjectRoot.Projects.Contains(EDITPROJECTNAME):
            # Ask the user if the project should be overwritten
            if USERDIALOG.ShowQuestion("Remove project", Resources.RemoveProjectQuestion % EDITPROJECTNAME):
                # Remove project.
                self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(EDITPROJECTNAME).Remove(True)
            else:
                # Raise Demo Error.
                raise DemoError(Resources.CreatedProjectAlreadyExistsError % EDITPROJECTNAME)

        # Create a new project with the given name.
        NewProject = self.ControlDeskApplication.Projects.Add(EDITPROJECTNAME)

        # Add new experiment.
        NewProject.Experiments.Add(EXPERIMENTNAME, True)

        # Add new XCP on CAN platform.
        newPlatform = self.ControlDeskApplication.ActiveExperiment.Platforms.Add(self.Enums.PlatformType.XCPonCAN)

        # Show information in a Dialog (elements created, create backup, remove elements).
        USERDIALOG.Show("Create Backup And Remove Elements", Resources.RemoveExperimentAndPlatform % PROJECTBACKUPPATH)

        # Save project.
        NewProject.Save()

        # Create Backup from active project.
        self.ControlDeskApplication.ActiveProject.Backup(PROJECTBACKUPPATH)

        # Remove platform.
        if newPlatform:
            self.ControlDeskApplication.ActiveExperiment.Platforms.Remove(newPlatform.Name)

        # Save project.
        NewProject.Save()

        # Show information in a dialog (close and remove project, load backup).
        USERDIALOG.Show("Remove project And Reload Backup", Resources.ReloadBackup % (PROJECTBACKUPPATH, PROJECTFROMBACKUP))

        # Close project.
        NewProject.Close(False)

        # Delete project.
        self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(EDITPROJECTNAME).Remove(True)

        # Load Backup.
        self.ControlDeskApplication.Projects.OpenFromBackup(PROJECTBACKUPPATH, PROJECTFROMBACKUP, True)

        # Show information in a dialog (close backup).
        USERDIALOG.Show("Close Backup", Resources.CloseBackup % PROJECTBACKUPPATH)

        # Close active project.
        self.ControlDeskApplication.ActiveProject.Close();

        # Delete backup project.
        self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTFROMBACKUP).Remove(True)

        # Delete backup file.
        if os.path.exists(PROJECTBACKUPPATH):
            os.remove(PROJECTBACKUPPATH)

#--------------------------------------------------------------------------------------------------
# Function : ExecuteDemo
#    Main demonstration function.
#--------------------------------------------------------------------------------------------------
def ExecuteDemo():
    """Main demonstration function.

    Syntax      : demoFinishedWithoutUnexpectedException = ExecuteDemo()

    Parameters  : -

    Return Value: demoFinishedWithoutUnexpectedException - boolean - If an unexpected exception has occurred, the
                  return value is False. Otherwise it is True.
    """ 
    # Initialize demoController.
    demoController = None

    # Initialize the return value.
    demoFinishedWithoutUnexpectedException = True

    # Check the environment and prepares the executing process.
    PrepareEnvironment()

    try:
        # Create the demo controller object.
        demoController = MainDemoController()

        # Start ControlDesk.
        demoController.Initialize()

        # Get information from all projects.
        demoController.ReadInformationFromAllProjects()

        # Create and delete new project root.
        demoController.CreateAndDeleteProjectRoot()

        # Create and delete new project.
        demoController.CreateAndDeleteNewProject()

        # Load existing CalDemo project.
        demoController.LoadProject()

        # Get information from loaded project.
        demoController.ReadInfoFromActiveProject()

        # Administrative commands on project level.
        demoController.CreateAndEditProject()

    except DemoError as error:

        # Show the error in a dialog.
        USERDIALOG.ShowError(error)

    except Exception as Message:

        # Show the error.
        USERDIALOG.ShowUnexpectedError(Message)

        # Print traceback.
        import traceback
        traceback.print_exc()

        # Set return value to False, because an unexpected exception has occurred.
        demoFinishedWithoutUnexpectedException = False

    finally:
        if demoController:
            # Uninitialize.
            try:
                demoController.Uninitialize()
            except:
                # Set return value to False, because an unexpected exception has occurred.
                demoFinishedWithoutUnexpectedException = False

    # Restore old environment.
    RestoreEnvironment()

    return demoFinishedWithoutUnexpectedException

#--------------------------------------------------------------------------------------------------
# Main Program
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    # Parse options for the user dialog.
    USERDIALOG.ParseArguments(sys.argv[1:])
    # Start demo.
    ExecuteDemo()
