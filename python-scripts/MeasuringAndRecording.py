# -*- coding: cp1252 -*-
"""
File:           MeasuringAndRecording.py

Description:    This script shows how to measure and record data.
                - Start, configure and stop measurements.
                - Start, configure and stop recording.
                - Show information about recorded measurement data.
                - Export and import recorded measurement data.

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
# The win32api module is used to kill the CalDemo process.
# The os module is used to start the CalDemo process.
# The exception module is used to catch unexpected exceptions.
#--------------------------------------------------------------------------------------------------
from win32com.client import Dispatch
from win32com.client import DispatchWithEvents
from dspace.com import Enums
from pywintypes import com_error
import tempfile
import win32api
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

#--------------------------------------------------------------------------------------------------
# Import the strings used in the demo dialogs.
#--------------------------------------------------------------------------------------------------
import MeasuringAndRecordingResources as Resources

# Create the main user interaction dialog.
USERDIALOG = DemoDialog("Measuring And Recording Demo")

#--------------------------------------------------------------------------------------------------
# Define constants used in this demo.
#--------------------------------------------------------------------------------------------------

# Create new root path in the temporary system folder.
PROJECTROOTPATH = os.path.join(tempfile.gettempdir(), "DemoRoot")

# The name of a project used during the demo.
PROJECTNAME = "MeasuringDemoProject"

# The name of a experiment used during the demo.
EXPERIMENTNAME = "NewMeasuringExperiment"

# Get the root path
SCRIPTPATH = os.path.abspath(os.path.curdir)
if "__file__" in dir():
    SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
elif len(sys.argv) > 0:
    SCRIPTPATH = os.path.dirname(sys.argv[0])

# Define CalDemo .a2l image path.
A2LIMAGEPATH = os.path.abspath(os.path.join(SCRIPTPATH, "..\..\..\CalDemo\CalDemo.a2l"))

# Define CalDemo .mot image path.
MOTIMAGEPATH = os.path.abspath(os.path.join(SCRIPTPATH, "..\..\..\CalDemo\CalDemo.mot"))

# Path of the CalDemo exe.
CALDEMOPATH = os.path.abspath(os.path.join(SCRIPTPATH, "..\..\..\CalDemo\CalDemo.exe"))

# Create export path.
EXPORTPATH = os.path.join(PROJECTROOTPATH, "ExportedMeasurement.mf4")

# Name of the a variable used in the demo.
CONTROLVARIABLENAME = "control_out"

# Name of the a variable used in the demo.
SIGNALVARIABLENAME = 'SignalGenOutput_2'

# Name of the variable used in the demo.
FREUENCYPRESCALER2NAME = 'FrequencyPrescaler_2'

# Connection string of the a variable used in the demo.
SIGNAL_VARIABLE_CONNECTION_STRING = "%s()://SignalGenOutput_2"

# Name of the a variable used in the demo.
SIGNALAMPLITUDENAME = "SignalAmplitude_2"

# Connection string of the a variable used in the demo.
SIGNAL_AMPLITUDE_CONNECTION_STRING = "%s()://SignalAmplitude_2"

# Connection string of a variable used in the demo.
DUMMY_OMEGA_VARIABLE_CONNECTION_STRING = "%s(OnChange)://DummyOmega"

# Connection string of a variable used in the demo.
CONTROL_VARIABLE_CONNECTION_STRING = "%s(5ms)://control_out"

# Connection string of a variable used in the demo.
FKI_VARIABLE_CONNECTION_STRING = "%s(%s)://f_Ki_1"

# Connection string of the a variable used in the demo.
MEASURE_VECTOR_CONNECTION_STRING = "%s()://MeasureVector"

# Name of the OnChange raster name.
ON_CHANGE_RASTER_NAME = "OnChange"

# Name of the 5 ms raster.
FIVE_MILLISECOND_RASTER_NAME = "5ms"

# Name of the 100 ms raster.
HUNDRED_MILLISECOND_RASTER_NAME = "100ms"

# Name of the knob instrument.
KNOBINSTRUMENTNAME = "TestKnob"

# Name of the plotter instrument.
PLOTTERINSTRUMENTNAME = "TestPlotter"

#--------------------------------------------------------------------------------------------------
# Define global variables used in this demo.
#--------------------------------------------------------------------------------------------------

#The signal name list for the 5 ms raster buffer.
FIVE_MILLISECOND_RASTER_SIGNAL_NAMES = None

# The signal name list for the 5 ms raster buffer.
HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES = None


#----------------------------------------------------------------------------------------------
# Function : LogRecorderData
#      This function logs the recorder data.
#----------------------------------------------------------------------------------------------
def LogRecorderData(data, buffer, recorder):
    """This function logs the recorder data.

    Syntax      : LogRecorderData(data, buffer, recorder)

    Parameters  : data     - Object - The data from the recorder buffer.
                  buffer   - Object - The buffer from which the data was fetched.
                  recorder - Object - The recorder from which the data was fetched.

    Description : This function logs the recorder data.

    Return Value: -
    """
    # Use the newest values for logging.
    newestValues = data[len(data) - 1]

    # The first entry in each row is the timestamp.
    timeStamp = newestValues[0]

    # Format string for value logging.
    loggingString = ""
    if buffer.RasterName == FIVE_MILLISECOND_RASTER_NAME and\
        len(FIVE_MILLISECOND_RASTER_SIGNAL_NAMES) == (len(newestValues) - 1):
        for index in range(len(FIVE_MILLISECOND_RASTER_SIGNAL_NAMES)):
            loggingString += "%s: %s\n" % (FIVE_MILLISECOND_RASTER_SIGNAL_NAMES[index], str(newestValues[index + 1]).strip("()[]"))
    elif buffer.RasterName == HUNDRED_MILLISECOND_RASTER_NAME and\
        len(HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES) == (len(newestValues) - 1):
        for index in range(len(HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES)):
            loggingString += "%s: %s\n" % (HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES[index], str(newestValues[index + 1]).strip("()[]"))

    loggingString = loggingString[:len(loggingString) - 2]

    # Log the event.
    print(Resources.MainRecorderResultReadyEvent % (buffer.RasterName, recorder.Name, len(data), timeStamp, loggingString))

#--------------------------------------------------------------------------------------------------
# Class MeasurementDataManagementEvents:
#   Defines the event sink for the measurement data management events.
#--------------------------------------------------------------------------------------------------
class MeasurementDataManagementEvents(object):
    """Defines the event sink for the measurement data management events.

    Syntax       : OBJ = MeasurementDataManagementEvents() 

    Parameters : -

    Description: Defines the event sink for the measurement data management events.
    """
    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementStarted
    #      This method will be called, if the application changed to measurement state.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementStarted(self):
        """This method will be called, if the application changed to measurement state.

        Syntax      : Obj.OnMeasurementStarted()

        Parameters  : -

        Description : This method will be called, if the application changed to measurement state.

        Return Value: -
        """
        print("--- The application changed to measurement state. ---")

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementStarting
    #      This method will be called, if the application is going to change into measurement state.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementStarting(self):
        """This method will be called, if the application is going to change into measurement state.

        Syntax      : Obj.OnMeasurementStarting()

        Parameters  : -

        Description : This method will be called, if the application is going to change into measurement state.

        Return Value: -
        """
        print("--- The application is going to change into measurement state. ---")


    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementStartingFailed
    #      This method will be called, if the application has failed to changed to measurement state.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementStartingFailed(self):
        """This method will be called, if the application has failed to changed to measurement state.

        Syntax      : Obj.OnMeasurementStartingFailed()

        Parameters  : -

        Description : This method will be called, if the application has failed to changed to measurement state.

        Return Value: -
        """
        print("--- The application has failed to change into measurement state. ---")



    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementStopped
    #      This method will be called, if the application has left measurement state.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementStopped(self):
        """This method will be called, if the application has left measurement state.

        Syntax      : Obj.OnMeasurementStopped()

        Parameters  : -

        Description : This method will be called, if the application has left measurement state.

        Return Value: -
        """
        print("--- The application has left measurement state. ---")

    #----------------------------------------------------------------------------------------------
    # Method : OnPlatformMeasurementStarted
    #      This method will be called, if the given platform changed to measurement state.
    #----------------------------------------------------------------------------------------------
    def OnPlatformMeasurementStarted(self, platform):
        """This method will be called, if the given platform changed to measurement state.

        Syntax      : Obj.OnPlatformMeasurementStarted(platform)

        Parameters  : platform - object - The platform which have changed to measurement state.

        Description : This method will be called, if the given platform changed to measurement state.

        Return Value: -
        """
        print("--- The platform %s changed to measurement state. ---" % Dispatch(platform).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnPlatformMeasurementStopped
    #      This method will be called, if the given platform has left measurement state.
    #----------------------------------------------------------------------------------------------
    def OnPlatformMeasurementStopped(self, platform):
        """This method will be called, if the given platform has left measurement state.

        Syntax      : Obj.OnPlatformMeasurementStopped(platform)

        Parameters  : platform - object - The platform which has left measurement state.

        Description : This method will be called, if the given platform has left measurement state.

        Return Value: -
        """
        print("--- The platform %s has left measurement state. ---" % Dispatch(platform).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnPlatformMeasurementStarting
    #      This method will be called, if the given platform is going to change into measurement state.
    #----------------------------------------------------------------------------------------------
    def OnPlatformMeasurementStarting(self, platform):
        """This method will be called, if the given platform is going to change into measurement state.

        Syntax      : Obj.OnPlatformMeasurementStarting(platform)

        Parameters  : platform - object - The platform which is going to change into measurement state.

        Description : This method will be called, if the given platform is going to change into measurement state.

        Return Value: -
        """
        print("--- The platform %s is going to change into measurement state. ---" % Dispatch(platform).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnPlatformMeasurementStartingFailed
    #      This method will be called, if the given platform have failed to change into the measurement state.
    #----------------------------------------------------------------------------------------------
    def OnPlatformMeasurementStartingFailed(self, platform):
        """This method will be called, if the given platform have failed to change into the measurement state.

        Syntax      : Obj.OnPlatformMeasurementStartingFailed(platform)

        Parameters  : platform - object - The platform which have failed to change into the measurement state.

        Description : This method will be called, if the given platform have failed to change into the measurement state.

        Return Value: -
        """
        print("--- The platform %s has failed to change into the measurement state. ---" % Dispatch(platform).Name)
    
    #----------------------------------------------------------------------------------------------
    # Method : OnPlatformMeasurementDataLost
    #      This method will be called, if the given platform has lost data.
    #----------------------------------------------------------------------------------------------
    def OnPlatformMeasurementDataLost(self, platform):
        """This method will be called, if the given platform has lost data.

        Syntax      : Obj.OnPlatformMeasurementDataLost(platform)

        Parameters  : platform - object - The platform which has lost data.

        Description : This method will be called, if the given platform has lost data.

        Return Value: -
        """
        print("--- The platform %s has lost data. ---" % Dispatch(platform).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnRecorderStarted
    #      This method will be called, if the recorder has started collecting data.
    #----------------------------------------------------------------------------------------------
    def OnRecorderStarted(self, recorder):
        """This method will be called, if the recorder has started collecting data.

        Syntax      : Obj.OnRecorderStarted(recorder)

        Parameters  : recorder - object - The recorder which started data collection.

        Description : This method will be called, if the recorder has started collecting data.

        Return Value: -
        """
        print("--- The recorder %s has started collecting data. ---" % Dispatch(recorder).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnRecorderStopped
    #      This method will be called, if the given recorder has stopped collecting data.
    #----------------------------------------------------------------------------------------------
    def OnRecorderStopped(self, recorder):
        """This method will be called, if the given recorder has stopped collecting data.

        Syntax      : Obj.OnRecorderStopped(recorder)

        Parameters  : recorder - object - The recorder which stopped data collection.

        Description : This method will be called, if the given recorder has stopped collecting data.

        Return Value: -
        """
        print("--- The recorder %s has stopped collecting data. ---" % Dispatch(recorder).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnRecordingStarted
    #      This method will be called, if the application changed to recording state.
    #----------------------------------------------------------------------------------------------
    def OnRecordingStarted(self):
        """This method will be called, if the application changed to recording state.

        Syntax      : Obj.OnRecordingStarted()

        Parameters  : -

        Description : This method will be called, if the application changed to recording state.

        Return Value: -
        """
        print("--- The application changed to recording state. ---")

    #----------------------------------------------------------------------------------------------
    # Method : OnRecordingStopped
    #      This method will be called, if the application has left recording state.
    #----------------------------------------------------------------------------------------------
    def OnRecordingStopped(self):
        """This method will be called, if the application has left recording state.

        Syntax      : Obj.OnRecordingStopped()

        Parameters  : -

        Description : This method will be called, if the application has left recording state.

        Return Value: -
        """
        print("--- The application has left recording state. ---")

    #----------------------------------------------------------------------------------------------
    # Method : OnRecordingSaved
    #      This method will be called, if the given recorder has saved the collected data to the given location.
    #----------------------------------------------------------------------------------------------
    def OnRecordingSaved(self, recorder, fullPath):
        """This method will be called, if the given recorder has saved the collected data to the given location.

        Syntax      : Obj.OnRecordingSaved(recorder, fullPath)

        Parameters  : recorder - object - The recorder which the data source.
                      fullPath - string - The fully qualified path to the storage data.

        Description : This method will be called, if the given recorder has saved the collected data to the given location.

        Return Value: -
        """
        print("--- The recorder %s has saved the collected data to the location %s. ---" % (Dispatch(recorder).Name, fullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnTriggerFired
    #      This method will be called, if the given trigger was fired.
    #----------------------------------------------------------------------------------------------
    def OnTriggerFired(self, triggerRule):
        """This method will be called, if the given trigger was fired.

        Syntax      : Obj.OnTriggerFired(triggerRule)

        Parameters  : triggerRule - object - The trigger rule which was true.

        Description : This method will be called, if the given trigger was fired.

        Return Value: -
        """
        print("--- The trigger %s was fired. ---" % Dispatch(triggerRule).Name)

    #----------------------------------------------------------------------------------------------
    # Method : OnBookmarkAdded
    #      This method will be called, if the given bookmark was added to the recording.
    #----------------------------------------------------------------------------------------------
    def OnBookmarkAdded(self, bookmark, measurement):
        """This method will be called, if the given bookmark was added to the recording.

        Syntax      : Obj.OnBookmarkAdded(bookmark)

        Parameters  : bookmark - object - The new added bookmark.
                      measurement - object - The measurement to which the bookmark has added.

        Description : This method will be called, if the given bookmark was added to the recording.

        Return Value: -
        """
        print("--- The bookmark %s was added to the recording. ---" % Dispatch(bookmark).Title)

    #----------------------------------------------------------------------------------------------
    # Method : OnBookmarkRemoving
    #      This method will be called, if the given bookmark is will be removed.
    #----------------------------------------------------------------------------------------------
    def OnBookmarkRemoving(self, bookmark, measurement):
        """This method will be called, if the given bookmark is will be removed.

        Syntax      : Obj.OnBookmarkRemoving(bookmark)

        Parameters  : bookmark - object - The bookmark which will be removed.
                      measurement - object - The measurement on which the bookmark has removed.

        Description : This method will be called, if the given bookmark is will be removed.

        Return Value: -
        """
        print("--- The bookmark %s is will be removed. ---" % Dispatch(bookmark).Title)

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementBufferSaved
    #      This method will be called, if the measurement buffer was saved to the given file.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementBufferSaved(self, fullPath):
        """This method will be called, if the measurement buffer was saved to the given file.

        Syntax      : Obj.OnMeasurementBufferSaved(fullPath)
        
        Parameters  : fullPath - string - Full qualifies path to the file.

        Description : This method will be called, if the measurement buffer was saved to the given file.

        Return Value: -
        """
        print("--- The measurement buffer was saved to the file %s. ---" % fullPath)

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementClosing
    #      This method will be called, if the given measurement will be closed.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementClosing(self, measurement):
        """This method will be called, if the given measurement will be closed.

        Syntax      : Obj.OnMeasurementClosing(measurement)

        Parameters  : measurement - object - The measurement which will be closed.

        Description : This method will be called, if the given measurement will be closed.

        Return Value: -
        """
        print("--- The measurement %s will be closed. ---" % Dispatch(measurement).FileName)

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementClosed
    #      This method will be called, if the given measurement has closed.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementClosed(self, fullPath):
        """This method will be called, if the given measurement has closed.

        Syntax      : Obj.OnMeasurementClosed(fullPath)

        Parameters  : fullPath - string - The measurement which has been closed.

        Description : This method will be called, if the given measurement has closed.

        Return Value: -
        """
        print("--- The measurement %s has closed. ---" % fullPath)

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementOpened
    #      This method will be called, if the given measurement has opened.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementOpened(self, measurement):
        """This method will be called, if the given measurement has opened.

        Syntax      : Obj.OnMeasurementOpened(measurement)

        Parameters  : measurement - object - The measurement which has been opened.

        Description : This method will be called, if the given measurement has opened.

        Return Value: -
        """
        print("--- The measurement %s has opened. ---" % Dispatch(measurement).FileName)

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementExported
    #      This method will be called, if the given measurement has exported.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementExported(self, measurement, fullPath):
        """This method will be called, if the given measurement has exported.

        Syntax      : Obj.OnMeasurementExported(measurement, fullPath)

        Parameters  : measurement - object - The measurement which has been exported.
                      fullPath    - string - The full qualified path to the export file.

        Description : This method will be called, if the given measurement has exported.

        Return Value: -
        """
        print("--- The measurement %s has exported to %s. ---" % (Dispatch(measurement).FileName, fullPath))

    #----------------------------------------------------------------------------------------------
    # Method : OnMeasurementSaved
    #      This method will be called, if the given measurement has saved.
    #----------------------------------------------------------------------------------------------
    def OnMeasurementSaved(self, measurement):
        """This method will be called, if the given measurement has saved.

        Syntax      : Obj.OnMeasurementSaved(measurement)

        Parameters  : measurement - object - The measurement which has been saved.

        Description : This method will be called, if the given measurement has saved.

        Return Value: -
        """
        print("--- The measurement %s has saved. ---" % Dispatch(measurement).FileName)

#--------------------------------------------------------------------------------------------------
# Class MainRecorderEvents:
#   Defines the event sink for the recorder events.
#--------------------------------------------------------------------------------------------------
class MainRecorderEvents(object):
    """Defines the event sink for the recorder events.

    Syntax       : OBJ = MainRecorderEvents() 

    Parameters : -

    Description: Defines the event sink for the recorder events.
    """
    #----------------------------------------------------------------------------------------------
    # Method : OnResultReady
    #      This method will be called, if results for a recorder buffer are ready for fetching.
    #----------------------------------------------------------------------------------------------
    def OnResultReady(self, clientID, buffer, recorder):
        """This method will be called, if results for a recorder buffer are ready for fetching.

        Syntax      : Obj.OnResultReady(clientID, buffer, recorder)

        Parameters  : clientID - integer - The client ID used for fetch data.
                      buffer   - object  - The buffer object to fetch data.
                      recorder - object  - The recorder where the data is ready for fetching.

        Description : This method will be called, if results for a recorder buffer are ready for fetching.

        Return Value: -
        """
        buffer = Dispatch(buffer)
        recorder = Dispatch(recorder)
        data = buffer.FetchConverted(clientID, 1)

        LogRecorderData(data, buffer, recorder)

    #----------------------------------------------------------------------------------------------
    # Method : OnBufferOverflow
    #      This method will be called, if a recorder buffer has an overflow.
    #----------------------------------------------------------------------------------------------
    def OnBufferOverflow(self, clientID, buffer, recorder):
        """This method will be called, if a recorder buffer has an overflow.

        Syntax      : Obj.OnBufferOverflow(clientID, buffer, recorder)

        Parameters  : clientID - integer - The client ID used for fetch data.
                      buffer   - object  - The buffer object where the buffer overflow happens.
                      recorder - object  - The recorder where the buffer overflow happens.

        Description : This method will be called, if a recorder buffer has an overflow.

        Return Value: -
        """
        print("--- buffer overflow for clientID %d happens. ---" % (clientID))

    
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

        Parameters  : -

        Description : This constructor initializes the MainDemoController object. 

        Return Value: -
        """
        # The ControlDesk application object.
        self.ControlDeskApplication = None

        # The enums fot the ControlDesk object model.
        self.Enums = None

        # The MeasurementDataManagement object.
        self.MeasurementDataManagement = None

        # The project root where most parts of the demo are executed.
        self.DemoRoot = None   

        # The project object used in this Demo.
        self.DemoProject = None

        # The platform used in this demo.
        self.DemoPlatform = None

        # The second recorder used in this demo.
        self.SecondRecorder = None
    
    #----------------------------------------------------------------------------------------------
    # Method : Initialize
    #      This method starts ControlDesk in a visible, maximized mode and creates a new demo project  
    #      root with a new project, experiment and instrument.
    #----------------------------------------------------------------------------------------------
    def Initialize(self):
        """This method starts ControlDesk in a visible, maximized mode and creates a new demo project root 
           with a new project, experiment and instrument.

        Syntax      : Obj.Initialize()

        Parameters  : -
        
        Description : This method starts ControlDesk in a visible, maximized mode and creates a new demo project root
                      with a new project, experiment and instrument. If the elements cannot be created or already 
                      exist, ControlDesk will be closed.

        Return Value: -

        Exceptions  : DemoError - The DemoError is thrown if 
                                    - the project already exists and should not be overwritten. 
                                    - the platform couldn't be created.           
        """
        # Accesses the ControlDesk instance. If ControlDesk is not running it will be started.
        USERDIALOG.Show("Start ControlDesk", Resources.Start % (PROJECTROOTPATH,
                                                                PROJECTNAME,
                                                                EXPERIMENTNAME,
                                                                CONTROLVARIABLENAME,
                                                                SIGNALVARIABLENAME))

        # Start ControlDesk 7.2.
        self.ControlDeskApplication = Dispatch("ControlDeskNG.Application.7.2")

        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)

        # Set MeasurementDataManagement.
        self.MeasurementDataManagement = DispatchWithEvents(self.ControlDeskApplication.MeasurementDataManagement, MeasurementDataManagementEvents)

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

        # Get project list.
        projects = self.ControlDeskApplication.Projects

        # Check if the project doesn't exist already.
        if self.ControlDeskApplication.ActiveProjectRoot.Projects.Contains(PROJECTNAME):
            # Ask the user if the project should be overwritten
            if USERDIALOG.ShowQuestion("Remove Project", Resources.RemoveProjectQuestion % PROJECTNAME):
                # Remove project.
                self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTNAME).Remove(True)
            else:
                # Raise Demo Error.
                raise Exception(DemoError, Resources.CreatedProjectAlreadyExistsError % PROJECTNAME)

        # Create a new project with the given name.
        self.DemoProject = projects.Add(PROJECTNAME)

        # Create new experiment 'NewExpermentOne'.
        newExperiment = self.DemoProject.Experiments.Add(EXPERIMENTNAME)
 
        # Show project window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('Project'):
            self.ControlDeskApplication.MainWindow.Windows.Item('Project').Show()

        # Add a demo layout.
        demoLayout = self.ControlDeskApplication.LayoutManagement.Layouts.Add("Demo Layout")
        demoLayout.Activate()
        demoLayout.Window.State = self.Enums.WindowState.Maximized

        # Add XCPonCAN platform.
        self.DemoPlatform = self.ControlDeskApplication.ActiveExperiment.Platforms.Add(self.Enums.PlatformType.XCPonCAN)

        # Check if platform was created.
        if not self.DemoPlatform:
            raise Exception(DemoError, Resources.RemovePlatformError)

        # Select virtual can interface (needed to start the online calibration with the CalDemo device).
        self.DemoPlatform.InterfaceSelection.AvailableChannels.Item(0).Select()

        # Add variable description.
        self.DemoPlatform.VariableDescriptions.AddWithImage(A2LIMAGEPATH, MOTIMAGEPATH)

        # Set working page as initial page.
        self.DemoPlatform.GeneralSettings.InitialPage = self.Enums.InitialPageType.WorkingPage

        # Add plotter instrument.
        PlotterInstrument = self.ControlDeskApplication.LayoutManagement.ActiveLayout.Instruments.Add(
            "Time Plotter",
            PLOTTERINSTRUMENTNAME,
            5,
            5,
            700,
            400)

        # Add variable array instrument.
        variableArrayInstrument = self.ControlDeskApplication.LayoutManagement.ActiveLayout.Instruments.Add("Variable Array",
                                                                                                            "Variable Array",
                                                                                                            0,
                                                                                                            420,
                                                                                                            400,
                                                                                                            100)

        # Add new row
        newRow = variableArrayInstrument.Rows.Add()

        # Add variable to row.
        newRow.MainVariable = SIGNAL_AMPLITUDE_CONNECTION_STRING % self.DemoPlatform.Name 

        # Add new y axis.
        newYAxis = PlotterInstrument.ActivePlot.YAxes.Add()

        # Add new signal.
        newSignal = newYAxis.Signals.Add()

        # Connect variable to signal.
        newSignal.MainVariable = CONTROL_VARIABLE_CONNECTION_STRING % self.DemoPlatform.Name

        # Add new y axis.
        newYAxis = PlotterInstrument.ActivePlot.YAxes.Add()

        # Add new signal.
        newSignal = newYAxis.Signals.Add()

        # Connect variable to signal.
        newSignal.MainVariable = SIGNAL_VARIABLE_CONNECTION_STRING % self.DemoPlatform.Name

        # Set start online behavior to "DownloadWorkingPageUploadReferencePage".
        self.DemoPlatform.GeneralSettings.StartOnlineCalibrationBehavior = self.Enums.OnlineCalibrationBehavior.DownloadWorkingPageUploadReferencePage

    #----------------------------------------------------------------------------------------------
    # Method : Uninitialize
    #      This method removes the project and the project root. It also terminates the CalDemo 
    #      process.
    #----------------------------------------------------------------------------------------------
    def Uninitialize(self):
        """This method removes the project and the project root. It also terminates the CalDemo process.

        Syntax      : Obj.Uninitialize()

        Parameters  : -

        Description : This method removes the project and the project root. It also terminates the CalDemo 
                      process.

        Return Value: -

        Exceptions  : DemoError - The DemoError is thrown if the project root wasn't removed.
        """
        # Show Dialog with information that ControlDesk will be closed.
        USERDIALOG.Show("Uninitialize", Resources.Uninitialize % (PROJECTNAME, PROJECTROOTPATH))

        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

        # Check if the application object exists.
        if self.ControlDeskApplication:
            # Check if the project root exists.
            if self.DemoRoot:
                # Check if the project exists.
                if self.DemoProject:

                    # Remove project.
                    self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTNAME).Remove(True)

                # Remove project root.
                self.DemoRoot.Remove()

                # Check if the root was removed.
                if self.ControlDeskApplication.ProjectRoots.Contains(PROJECTROOTPATH):
                    raise Exception(DemoError, Resources.RemoveProjectRootError % PROJECTROOTPATH)

        # Close CalDemo Window.
        CloseAllCalDemoWindows();

        # Remove the exproted file.
        if os.path.exists(EXPORTPATH):
            os.remove(EXPORTPATH)

        # Show dialog with the information that the demo has finished.
        USERDIALOG.Show("Demo Finished", "The demo 'Measuring And Recording' has finished!")

    #----------------------------------------------------------------------------------------------
    # Method : ConfigureMeasurement
    #      This method configures the measurement. It selects the variables and sets the buffer 
    #      properties.
    #----------------------------------------------------------------------------------------------
    def ConfigureMeasurement(self):
        """This method configures the measurement. It selects the variables and  sets the buffer properties.

        Syntax      : Obj.ConfigureMeasurement()

        Parameters  : -

        Description : This method configures the measurement. It selects the variables and sets the buffer properties.

        Return Value: -
        """
        # Show information in a dialog (configure measurement).
        USERDIALOG.Show("Configure And Start measurement", Resources.StartMeasurement)

        # Start CalDemo platform.
        os.startfile(CALDEMOPATH)

        # Wait for the CalDemo to completly start
        Wait(3)

        # Add DummyOmega variable.
        # Syntax: PlatformName(RasterName)://UniqueVariableName
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(DUMMY_OMEGA_VARIABLE_CONNECTION_STRING %\
                                                                            self.DemoPlatform.Name)

        # Add variable 'f_Ki_1'.
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(FKI_VARIABLE_CONNECTION_STRING %\
                                                                            (self.DemoPlatform.Name, ON_CHANGE_RASTER_NAME))

        # Configure measurement buffer.

        # Get buffer object.
        measurementBuffer = self.MeasurementDataManagement.MeasurementConfiguration.Buffer

        # Set buffer size.
        measurementBuffer.Size = 10.0

        # Enable buffer overflow warning.
        measurementBuffer.WarningEnabled = True

        # Set warning time.
        measurementBuffer.WarningTime = 3.0

        # Start measurement.
        self.MeasurementDataManagement.Start()
        Wait(1)

        # Show information in a dialog (stop measurement).
        USERDIALOG.Show("Stop measurement", Resources.StopMeasurement)

        # Stop measurement.
        self.MeasurementDataManagement.Stop()

        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

        # Show information about measurement list.
        USERDIALOG.Show("Show Information About measurement Signal List", Resources.ShowSignalInformation)

        # Initialize information list.
        informationLines = []

        # Initialize format dictionary.
        formatValues = {}

        # Iterate over all signals in the measurement signal list.
        for signalObject in self.MeasurementDataManagement.MeasurementConfiguration.Signals:

            # Add variable name.
            formatValues["name"] = signalObject.VariableName

            # Raster name.
            formatValues["raster"] = signalObject.RasterName

            # Is connected.
            formatValues["connected"] = signalObject.IsConnected

            # Is active.
            formatValues["active"] = signalObject.Active

            # Recording enabled.
            formatValues["recording"] = signalObject.RecordingEnabled

            # Add to list.
            informationLines.append(Resources.SignalInformation % formatValues)

        # Create information string.
        Information = "\n".join(informationLines)

        # Show information about measurement list.
        USERDIALOG.Show("Show Information About measurement Signal List", Information)

    #----------------------------------------------------------------------------------------------
    # Method : configureAndStartRegularRecording
    #      This method configures the recording. It selects the variables and stops the recording 
    #      after a timeout.
    #----------------------------------------------------------------------------------------------
    def configureAndStartRegularRecording(self):
        """This method configures the recording. It selects the variables and stops the recording after a timeout.

        Syntax      : Obj.configureAndStartRegularRecording()

        Parameters  : -

        Description : This method configures the recording. It selects the variables and stops the recording after a
                      timeout.
                      
        Return Value: -
        """
        # Show information in a dialog (configure recording).
        USERDIALOG.Show("Configure And Start Recording", Resources.StartRegularRecording)    

        # Get recorder object.
        mainRecorder = self.MeasurementDataManagement.MainRecorder

        # Set output file name.
        mainRecorder.BaseFileName = "NewRecording.mf4"

        # Set to automatic file naming.
        mainRecorder.AutomaticNamingEnabled = True

        # Add measurement to experiment.
        mainRecorder.AddToExperimentEnabled = True

        # Set number to start automatic naming.
        mainRecorder.AutomaticNamingStartIndex = 10

        # Set number of digits for automatic naming.
        mainRecorder.AutomaticNamingMinimumDigits = 3

        # Add record to measurement data pool.
        mainRecorder.OpenInMeasurementDataPoolEnabled = True

        # Get f_Ki_1 signal.
        fkiSignal = self.MeasurementDataManagement.MeasurementConfiguration.Signals.Item(
            FKI_VARIABLE_CONNECTION_STRING % (self.DemoPlatform.Name, ON_CHANGE_RASTER_NAME))

        # Remove signal f_Ki_1 from main recorder.
        mainRecorder.Signals.Remove(fkiSignal)

        # Start recording. (first parameter: with trigger set to false, second parameter: overwrite existing set to true)
        mainRecorder.Start(False, True)

        # Show measurement data pool window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('measurement data Pool'):
            self.ControlDeskApplication.MainWindow.Windows.Item('measurement data Pool').Show() 

        # Counter to continue the demo after 4 seconds.
        count = 8

        # Check if the recording is still running.
        while mainRecorder.State == self.Enums.RecordingState.Running and count > 0:

            # Wait half a second.
            Wait(0.5)

            # Decrement the counter.
            count -= 1

        # Stop measurement.
        self.MeasurementDataManagement.Stop()

        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

    #----------------------------------------------------------------------------------------------
    # Method : ConfigureAndStartRecording
    #      This method configures the recording. It selects the variables and defines rules for a 
    #      triggered start and stop of the recording.
    #----------------------------------------------------------------------------------------------
    def ConfigureAndStartRecording(self):
        """This method configures the recording. It selects the variables and defines rules for a triggered start
           and stop of the recording.

        Syntax      : Obj.ConfigureAndStartRecording()

        Parameters  : -

        Description : This method configures the recording. It selects the variables and defines rules for a 
                      triggered start and stop of the recording.
                      
        Return Value: -
        """
        # Show information in a dialog (configure recording).
        USERDIALOG.Show("Configure And Start Triggered Recording", Resources.StartTriggeredRecording)    

        # For this example we use a second recorder.
        self.SecondRecorder = self.MeasurementDataManagement.Recorders.Add("Second recorder")

        # Set output file name.
        self.SecondRecorder.BaseFileName = "NewTriggeredRecording.mf4"

        # Add record to measurement data pool.
        self.SecondRecorder.OpenInMeasurementDataPoolEnabled = True

        # Activate all variables in the recording signal list.
        # Iterate over all signals.
        for signalObject in self.MeasurementDataManagement.MeasurementConfiguration.Signals:

            # Activate signal (make sure that the signal is active).
            signalObject.Active = True

            # Insert the signal to the record signal list.
            self.SecondRecorder.Signals.Insert(signalObject)

        # Configure trigger.

        # Create start trigger rule
        startTriggerRule = self.MeasurementDataManagement.TriggerRules.Add("NewStartCondition")

        # Enable rule.
        startTriggerRule.Enabled = True

        # Set trigger rule.
        # Get signal used in the trigger rule.
        triggerInputSignal = self.MeasurementDataManagement.MeasurementConfiguration.Signals.Item(
            CONTROL_VARIABLE_CONNECTION_STRING % self.DemoPlatform.Name)

        # Add signal to trigger rule mapping.
        startTriggerRule.Mappings.Add(CONTROLVARIABLENAME, triggerInputSignal)

        # Define trigger rule.
        startTriggerRule.Definition = "%s < -0.1" % CONTROLVARIABLENAME

        # Define start condition.
        # Triggered Recording.
        startCondition = self.SecondRecorder.StartCondition

        # Enable start condition.
        startCondition.Enabled = True

        # Time before the trigger is activated.
        startCondition.TriggerDelay = 0.2

        # Set number of recording cycles.
        startCondition.RecordingCycles = 3

        # Set start condition trigger rule.
        startCondition.Trigger = startTriggerRule

        # Configure stop trigger.
        # Create stop trigger rule.
        stopTriggerRule = self.MeasurementDataManagement.TriggerRules.Add("NewStopCondition")

        # Enable rule.
        stopTriggerRule.Enabled = True

        # Set trigger rule.
        # Add signal to trigger rule mapping.
        stopTriggerRule.Mappings.Add(CONTROLVARIABLENAME, triggerInputSignal)

        # Define trigger rule.
        stopTriggerRule.Definition = "%s > 0.6" % CONTROLVARIABLENAME

        # Define stop condition.
        # Get stop condition object.
        stopCondition = self.SecondRecorder.StopCondition

        # Enable stop condition.
        stopCondition.Enabled = True

        # Set stop condition to type time limit.
        stopCondition.Type = self.Enums.StopConditionType.Trigger

        # Set stop condition trigger rule.
        stopCondition.Trigger = stopTriggerRule

        # Show measurement data pool window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('measurement data Pool'):
            self.ControlDeskApplication.MainWindow.Windows.Item('measurement data Pool').Show()

        try:
            # Start recording. (first parameter: with trigger set to true, second parameter: overwrite existing set to true)
            self.SecondRecorder.Start(True, True)

            # Counter to continue the demo after 15 seconds.
            count = 30

            # Check if the 3 cycles are done.
            while len(self.SecondRecorder.LastRecordedFiles) < 3 and count > 0:

                # Add bookmark.
                self.MeasurementDataManagement.CurrentMeasurement.Bookmarks.AddNow("TestBookmark %i" % (20-count),
                                                                                   "This is a test bookmark for the demo.")

                # Wait.
                Wait(0.5)

                # Decrement the counter.
                count -= 1

        finally:
            # Stop measurement.
            self.MeasurementDataManagement.Stop()

            # Disable trigger rules.
            startTriggerRule.Enabled = False
            stopTriggerRule.Enabled = False

            # Stop online calibration.
            self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()
    
    #----------------------------------------------------------------------------------------------
    # Method : ConfigAndStartEventRecording
    #      This method configures the recording. It selects the variables and stops the recording 
    #      after a timeout.
    #----------------------------------------------------------------------------------------------
    def ConfigAndStartEventRecording(self):
        """This method configures the recording. It selects the variables and stops the recording after a timeout.

        Syntax      : Obj.ConfigAndStartEventRecording()

        Parameters  : -

        Description : This method configures the recording. It selects the variables and stops the recording after a
                      timeout.
                      
        Return Value: -
        """
        # Show information in a dialog (configure recording).
        USERDIALOG.Show("Configure And Start Event Based Recording", Resources.StartEventBasedRecording)

        # Disable writing to file.
        self.SecondRecorder.WriteToFileEnabled = False

        # Add additional signals.
        # Add variable MeasureVector in default raster.
        newSignal = self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(MEASURE_VECTOR_CONNECTION_STRING % (self.DemoPlatform.Name))

        # Add the new signal to the second recorder.
        self.SecondRecorder.Signals.Insert(newSignal)

        # Add variable 'f_Ki_1' in 100 ms raster.
        newSignal = self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(
            FKI_VARIABLE_CONNECTION_STRING % (self.DemoPlatform.Name, HUNDRED_MILLISECOND_RASTER_NAME))

        # Add the new signal to the second recorder.
        self.SecondRecorder.Signals.Insert(newSignal)

        # Configure the buffers.
        # Configure the buffer for the 5 ms raster.
        buffer5ms = self.SecondRecorder.Buffers.Find(self.DemoPlatform.Name, FIVE_MILLISECOND_RASTER_NAME)
        buffer5ms.NumberOfSamplesForEventTrigger = 100
        buffer5ms.Size = 1000

        # Configure the buffer for the 100 ms raster.
        buffer100ms = self.SecondRecorder.Buffers.Find(self.DemoPlatform.Name, HUNDRED_MILLISECOND_RASTER_NAME)
        buffer100ms.NumberOfSamplesForEventTrigger = 5
        buffer100ms.Size = 200

        # Get the signal configuration of the recorder.
        global FIVE_MILLISECOND_RASTER_SIGNAL_NAMES
        global HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES
        FIVE_MILLISECOND_RASTER_SIGNAL_NAMES = []
        HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES = []
        for currentSignal in self.SecondRecorder.Signals:
            if currentSignal.Identifier.RasterName == FIVE_MILLISECOND_RASTER_NAME:
                FIVE_MILLISECOND_RASTER_SIGNAL_NAMES.append(currentSignal.Identifier.UniqueName)
            elif currentSignal.Identifier.RasterName == HUNDRED_MILLISECOND_RASTER_NAME:
                HUNDRED_MILLISECOND_RASTER_SIGNAL_NAMES.append(currentSignal.Identifier.UniqueName)

        # Disable start condition
        startCondition = self.SecondRecorder.StartCondition
        startCondition.Enabled = False

        # Define stop condition.
        # Get stop condition object.
        stopCondition = self.SecondRecorder.StopCondition

        # Enable stop condition.
        stopCondition.Enabled = True

        # Set stop condition to type time limit.
        stopCondition.Type = self.Enums.StopConditionType.TimeLimit

        # Set time limit to 4 seconds.
        stopCondition.TimeLimit = 4

        # Register the events.
        recorderEventInstance = DispatchWithEvents(self.SecondRecorder, MainRecorderEvents)

        # Start recording. (first parameter: with trigger set to false, second parameter: overwrite existing set to true)
        self.SecondRecorder.Start(True, True)

        # Show measurement data pool window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('measurement data Pool'):
            self.ControlDeskApplication.MainWindow.Windows.Item('measurement data Pool').Show() 

        # Counter to continue the demo after 8 seconds.
        count = 16

        # Check if the recording is still running.
        while self.SecondRecorder.State == self.Enums.RecordingState.Running and count > 0:

            # Wait half a second.
            Wait(0.5)

            # Decrement the counter.
            count -= 1

        # Release the event instance.
        recorderEventInstance = None

        # Stop measurement.
        self.MeasurementDataManagement.Stop()
        
        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

    #----------------------------------------------------------------------------------------------
    # Method : ConfigureAndStartPollRecording
    #      This method configures the recording. It selects the variables and stops the recording 
    #      after a timeout.
    #----------------------------------------------------------------------------------------------
    def ConfigureAndStartPollRecording(self):
        """This method configures the recording. It selects the variables and stops the recording after a timeout.

        Syntax      : Obj.ConfigureAndStartPollRecording()

        Parameters  : -

        Description : This method configures the recording. It selects the variables and stops the recording after a
                      timeout.

        Return Value: -
        """
        # Show information in a dialog (configure recording).
        USERDIALOG.Show("Configure And Start Polling Recording", Resources.StartPollingRecording)

        # Get the buffers.
        buffer5ms = self.SecondRecorder.Buffers.Find(self.DemoPlatform.Name, FIVE_MILLISECOND_RASTER_NAME)
        buffer100ms = self.SecondRecorder.Buffers.Find(self.DemoPlatform.Name, HUNDRED_MILLISECOND_RASTER_NAME)

        # Create the client ID for polling.
        clientID = self.SecondRecorder.CreateClientID()

        # Start recording. (first parameter: with trigger set to false, second parameter: overwrite existing set to true)
        self.SecondRecorder.Start(False, True)

        # Counter to continue the demo after 8 seconds.
        count = 20

        # Calculate polling time.
        nextTime = time.time() + 0.2

        # Check if the recording is still running.
        while self.SecondRecorder.State == self.Enums.RecordingState.Running and count > 0:

            # Wait remaining time.
            currentTime = time.time()
            if nextTime - currentTime > 0:
                Wait(nextTime - time.time())
            nextTime = time.time() + 0.2

            # Poll the data.
            if buffer5ms.GetFillingLevel(clientID) > 0:
                data = buffer5ms.FetchConverted(clientID, self.Enums.FetchDataMode.All)
                LogRecorderData(data, buffer5ms, self.SecondRecorder)
            if buffer100ms.GetFillingLevel(clientID) > 0:
                data = buffer100ms.FetchConverted(clientID, self.Enums.FetchDataMode.All)
                LogRecorderData(data, buffer100ms, self.SecondRecorder)

            # Decrement the counter.
            count -= 1

        # Stop measurement.
        self.MeasurementDataManagement.Stop()

        # Release the client ID.
        self.SecondRecorder.ReleaseClientID(clientID)

        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

    #----------------------------------------------------------------------------------------------
    # Method : AccessRecordedData
    #      This method accesses the recorded data and displays a variable in a recorded data layout.
    #----------------------------------------------------------------------------------------------
    def AccessRecordedData(self):
        """This method accesses the recorded data and displays a variable in a recorded data layout.

        Syntax      : Obj.AccessRecordedData()

        Parameters  : -

        Description : This method accesses the recorded data and displays a variable in a recorded data layout.

        Return Value: -
        """       
        # Show information in a dialog (access recorded data).
        USERDIALOG.Show("Access And Show Recorded data", Resources.ShowRecordedData)

        if self.MeasurementDataManagement.Measurements.Count == 0:
            raise Exception(DemoError, Resources.CreateMeasurementRootError)

        # Initialize information list.
        informationLines = []

        # Initialize format dictionary.
        formatValues = {}

        # Add information.

        # Show information about the first two measurements.
        if self.MeasurementDataManagement.Measurements.Count > 1:

            # Iterate over the first two measurements.
            for index in range(2):

                # Get measurement object.
                measurement = self.MeasurementDataManagement.Measurements.Item(index)

                # Add file name.
                formatValues["name"] = measurement.FileName

                # Add recording time start point.    
                formatValues["start"] = measurement.RecordingDateTime

                # Add length of recording time.
                formatValues["time"] = measurement.Length

                # Add variable definitions.
                formatValues["count"] = len(measurement.VariableDefinitions)

                informationLines.append(Resources.ShowRecordedDataInformation % formatValues)

                # Iterate over the variable strings.
                for VariableString in measurement.VariableDefinitions:
                    informationLines.append("'%s'" % VariableString)

                # Add bookmark information if a bookmark exists.
                if measurement.Bookmarks.Count > 0:

                    # Show bookmarks.
                    informationLines.append("\nFollowing %i bookmarks are included:\n" %\
                                            measurement.Bookmarks.Count)

                    # Iterate over the bookmarks.
                    for bookmarkObject in measurement.Bookmarks:

                        # Add Information about bookmark.
                        informationLines.append("Title: '%s', Timestamp: '%s' s" % (bookmarkObject.Title, 
                                                                                    bookmarkObject.Timestamp))
                else:
                    informationLines.append("\nNo bookmarks included.")

                informationLines.append("\n" + "-"*80 + "\n")

            # Create information string.
            Information = "\n".join(informationLines)

            # Show measurement information in a dialog.
            USERDIALOG.Show("Show measurement data Information", Information)

            # Show information in a dialog (show measurement data).
            USERDIALOG.Show("Show measurement data In A Plotter", Resources.ShowRecordedDataInPlotter)

            # Get the measurement object of the first measurement.
            measurement = self.MeasurementDataManagement.Measurements.Item(0)

            # Create new layout.
            NewLayout = self.ControlDeskApplication.LayoutManagement.Layouts.Add("Recorded data Layout")

            # Maximize the layout.
            NewLayout.Window.State = self.Enums.WindowState.Maximized

            # Add plotter instrument.
            PlotterInstrument = self.ControlDeskApplication.LayoutManagement.ActiveLayout.Instruments.Add(
                "Time Plotter",
                PLOTTERINSTRUMENTNAME,
                5,
                5,
                700,
                300)

            # Add new y axis.
            newYAxis = PlotterInstrument.ActivePlot.YAxes.Add()

            # Add new signal.
            newSignal = newYAxis.Signals.Add()

            # Connect variable to the second signal of the measurement.
            newSignal.MainVariable = "NewRecording010.mf4:XCP(5ms)://XCP/SignalGenOutput_2"

            # Show information in a dialog (export measurement data).
            USERDIALOG.Show("Export First measurement data", Resources.ExportMeasurementData % EXPORTPATH)

            # Export measurement.
            measurement.Export(EXPORTPATH, True)

            # Show information in a dialog (import measurement data).
            USERDIALOG.Show("Import measurement data", Resources.ImportMeasurementData % EXPORTPATH)

            # Import measurement.
            self.MeasurementDataManagement.Measurements.Load(EXPORTPATH)

    #----------------------------------------------------------------------------------------------
    # Method : DefineOnlineCalibrationBehavior
    #      This method starts the a measuring in two different StartOnlineCalibrationBehavior modes.
    #----------------------------------------------------------------------------------------------
    def DefineOnlineCalibrationBehavior(self):
        """This method starts the a measuring in two different StartOnlineCalibrationBehavior modes.

        Syntax      : Obj.DefineOnlineCalibrationBehavior()

        Parameters  : -

        Description : This method starts the a measuring in two different StartOnlineCalibrationBehavior modes.
                      If the measuring is started with mode 'UploadWorkingPageUploadReferencePage', the working page
                      will be uploaded from the ECU, so the new parameter's value will be set to the original value.
                      If the measuring is started with mode 'DownloadWorkingPageUploadReferencePage', the working page 
                      will be downloaded to the ECU, so new parameter's value will be transferred.

        Return Value: -
        """
        # Show information in a dialog (upload page).
        USERDIALOG.Show("Upload Page", Resources.UploadPage % (SIGNALAMPLITUDENAME, 50))

        # Show layout.
        FirstLayout = self.ControlDeskApplication.LayoutManagement.Layouts.Item(0)
        FirstLayout.Activate() 

        # Change value of signal amplitude parameter.

        # Activate the working page to adjust a value.
        self.DemoPlatform.ActiveVariableDescription.DataSets.WorkingDataSet.Activate()

        # Get variable.
        Variable = self.DemoPlatform.ActiveVariableDescription.Variables.Item(SIGNALAMPLITUDENAME)

        # Set value.
        Variable.ValueConverted = 50
        Wait(1)

        # Disconnect platform to be able to configure it.
        self.DemoPlatform.Disconnect()

        # Set working page as initial page.
        self.DemoPlatform.GeneralSettings.InitialPage = self.Enums.InitialPageType.WorkingPage

        # Set start online behavior to "UploadWorkingPageUploadReferencePage".
        self.DemoPlatform.GeneralSettings.StartOnlineCalibrationBehavior = self.Enums.OnlineCalibrationBehavior.UploadWorkingPageUploadReferencePage

        # Start recording. (first parameter: with trigger set to false, second parameter: overwrite existing set to true)
        self.MeasurementDataManagement.MainRecorder.Start(False, True)
        Wait(1)

        # Show information in a dialog (download page).
        USERDIALOG.Show("Download Page", Resources.DownloadPage % (SIGNALAMPLITUDENAME, 15))

        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

        # Get variable.
        Variable = self.DemoPlatform.ActiveVariableDescription.Variables.Item(SIGNALAMPLITUDENAME)

        # Set value.
        Variable.ValueConverted = 15

        # Disconnect platform to be able to configure it.
        self.DemoPlatform.Disconnect()

        # Set start online behavior to "UploadWorkingPageUploadReferencePage".
        self.DemoPlatform.GeneralSettings.StartOnlineCalibrationBehavior = self.Enums.OnlineCalibrationBehavior.DownloadWorkingPageUploadReferencePage

        # Start recording. (first parameter: with trigger set to false, second parameter: overwrite existing set to true)
        self.MeasurementDataManagement.MainRecorder.Start(False, True)
        Wait(1)

#--------------------------------------------------------------------------------------------------
# Function : ExecuteDemo
#    Main demonstration function.
#--------------------------------------------------------------------------------------------------
def ExecuteDemo():
    """Main demonstration function.

    Syntax      : DemoFinishedWithoutUnexpectedException = ExecuteDemo()

    Parameters  : -

    Return Value: DemoFinishedWithoutUnexpectedException - boolean - If an unexpected exception has occurred, the
                  return value is False. Otherwise it is True.
    """ 
    # Initialize demoController.
    demoController = None

    # Initialize the return value.
    DemoFinishedWithoutUnexpectedException = True

    # Check the environment and prepares the executing process.
    PrepareEnvironment()

    try:
        # Create the demo controller object.
        demoController = MainDemoController()

        # Start ControlDesk and create the demo project root.
        demoController.Initialize()

        # Configure measurement.
        demoController.ConfigureMeasurement()

        # Configure and start regular recording.
        demoController.configureAndStartRegularRecording()

        # Configure and start triggered recording.
        demoController.ConfigureAndStartRecording()

        # Configure and start event based recording.
        demoController.ConfigAndStartEventRecording()

        # Configure and start event based recording.
        demoController.ConfigureAndStartPollRecording()

        # Access the recorded data.
        demoController.AccessRecordedData()

        # Start measuring with different online calibration behavior,
        demoController.DefineOnlineCalibrationBehavior()
    
    except DemoError as error:

        # Show the error.
        USERDIALOG.ShowError(error)
        
    except Exception as message:

        # Show the error.
        USERDIALOG.ShowUnexpectedError(message)

        # Print traceback.
        import traceback
        traceback.print_exc()

        # Set return value to False, because an unexpected exception has occurred.
        DemoFinishedWithoutUnexpectedException = False

    finally:
        if demoController:
            # Uninitialize.
            try:
                demoController.Uninitialize()
            except:
                # Set return value to False, because an unexpected exception has occurred.
                DemoFinishedWithoutUnexpectedException = False

    # Restore old environment.
    RestoreEnvironment()

    return DemoFinishedWithoutUnexpectedException     

#--------------------------------------------------------------------------------------------------
# Main Program.
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    import sys
    # Parse options for the user dialog.
    USERDIALOG.ParseArguments(sys.argv[1:])
    # Start demo.
    ExecuteDemo()