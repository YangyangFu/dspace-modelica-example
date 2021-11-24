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
from DemoUtilities import PrepareEnvironment,\
                          DemoError,\
                          Wait

#--------------------------------------------------------------------------------------------------
# Import the strings used in the demo dialogs.
#--------------------------------------------------------------------------------------------------
import MeasuringAndRecordingResources as Resources

#--------------------------------------------------------------------------------------------------
# Define constants used in this demo.
#--------------------------------------------------------------------------------------------------
PROJECTROOTPATH = "D:\github\dspace-modelica-example"
# The name of a project.
PROJECTNAME = "FiveZoneDemoControlDesk"
# The name of an experiment used in this demo.
EXPERIMENTNAME = "simulink_onezonevav"

# Get the root path
SCRIPTPATH = os.path.abspath(os.path.curdir)
if "__file__" in dir():
    SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
elif len(sys.argv) > 0:
    SCRIPTPATH = os.path.dirname(sys.argv[0])

# Create export path.
EXPORTPATH = os.path.join(PROJECTROOTPATH, "ExportedMeasurement.mf4")

# Name of the a variable used in the demo.
CONTROLVARIABLENAME = "TDis"
# Connection string of a variable used in the demo: SCALEXIO()://Model Root/out/TRoo
CONTROL_VARIABLE_CONNECTION_STRING = "%s()://Model Root/behavior/TDis"
#
CONTROLVARIABLENAME2 = "TRoo"
# Connection string of a variable used in the demo.
CONTROL_VARIABLE2_CONNECTION_STRING = "%s()://Model Root/behavior/TRooAir"

# Name of layout
LAYOUTNAME = "Demo Layout"

# Name of recorder
RECORDERNAME = "Recorder1"

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

        # Start ControlDesk 7.2.
        self.ControlDeskApplication = Dispatch("ControlDeskNG.Application.7.2")
        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)
        # Set MeasurementDataManagement.
        self.MeasurementDataManagement = Dispatch(self.ControlDeskApplication.MeasurementDataManagement)
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
        # Activate project root.
        self.DemoRoot.Activate() 

        # Get project list.
        projects = self.ControlDeskApplication.Projects

        # Check if the project doesn't exist already.
        if not self.ControlDeskApplication.ActiveProjectRoot.Projects.Contains(PROJECTNAME):
            # Create a new project with the given name.
            self.DemoProject = projects.Add(PROJECTNAME)
        else:
            self.DemoProject = self.ControlDeskApplication.ActiveProjectRoot.Projects.Item(PROJECTNAME)
            self.DemoProject.Open()

        # Check if the experiment doesn't exist already
        if not self.DemoProject.Experiments.Contains(EXPERIMENTNAME):
            experiment = self.DemoProject.Experiments.Add(EXPERIMENTNAME)
        else:
            experiment = self.DemoProject.Experiments.Item(EXPERIMENTNAME)
            experiment.Activate()
 
        # Show project window. 
        if self.ControlDeskApplication.MainWindow.Windows.Contains('Project'):
            self.ControlDeskApplication.MainWindow.Windows.Item('Project').Show()

        # Add a demo layout if not already exist and open
        if not self.ControlDeskApplication.LayoutManagement.Layouts.Contains(LAYOUTNAME):
            demoLayout = self.ControlDeskApplication.LayoutManagement.Layouts.Add(LAYOUTNAME)
        else:
            demoLayout = self.ControlDeskApplication.LayoutManagement.Layouts.Item(LAYOUTNAME)
        demoLayout.Activate()
        #demoLayout.Rename("Layout2")
        demoLayout.Window.State = self.Enums.WindowState.Maximized

        # Add registered SCALEXIO platform if not already.
        print(self.ControlDeskApplication.ActiveExperiment.Platforms.Count)
        # Get current registered platform 
        self.DemoPlatform = self.ControlDeskApplication.ActiveExperiment.Platforms.Item(0)
        print(self.DemoPlatform.Name)

        # Select virtual can interface (needed to start the online calibration with the CalDemo device).
        #self.DemoPlatform.InterfaceSelection.AvailableChannels.Item(0).Select()

        # Set working page as initial page.
        #self.DemoPlatform.GeneralSettings.InitialPage = self.Enums.InitialPageType.WorkingPage

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
        print(CONTROL_VARIABLE_CONNECTION_STRING % self.DemoPlatform.Name)
        newRow.MainVariable = CONTROL_VARIABLE_CONNECTION_STRING % self.DemoPlatform.Name 
       
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
        newSignal.MainVariable = CONTROL_VARIABLE2_CONNECTION_STRING % self.DemoPlatform.Name

        # Set start online behavior to "DownloadWorkingPageUploadReferencePage".
        #self.DemoPlatform.GeneralSettings.StartOnlineCalibrationBehavior = self.Enums.OnlineCalibrationBehavior.DownloadWorkingPageUploadReferencePage

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
        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

        # Close CalDemo Window.
        import win32gui
        import win32con

        # Initialize list to store all windows.
        windows = []
        
        # Fill window list.
        win32gui.EnumWindows(lambda x, d:windows.append(x), 0)

        # Iterate over the window list.
        for window in windows:
            # Get window text.
            windowText = "%s" % win32gui.GetWindowText(window)

            # Check if the window text contains dSPACE CalDemo.
            if windowText.find("simulink_onezonevav") != -1:
                
                # Close window.
                win32gui.PostMessage(window, win32con.WM_CLOSE, 0, 0)

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

        # Add TDis variable.
        # Syntax: PlatformName(RasterName)://UniqueVariableName
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(CONTROL_VARIABLE_CONNECTION_STRING %\
                                                                            self.DemoPlatform.Name)

        # Add variable 'TRoo'.
        self.MeasurementDataManagement.MeasurementConfiguration.Signals.Add(CONTROL_VARIABLE2_CONNECTION_STRING %\
                                                                            self.DemoPlatform.Name)

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

        # Stop measurement.
        self.MeasurementDataManagement.Stop()
        # Stop online calibration.
        self.ControlDeskApplication.CalibrationManagement.StopOnlineCalibration()

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
        # Get recorder object.
        print(self.MeasurementDataManagement.Recorders)
        if not self.MeasurementDataManagement.Recorders.Contains(RECORDERNAME):
            mainRecorder = self.MeasurementDataManagement.Recorders.Add(RECORDERNAME)
        else:
            mainRecorder = self.MeasurementDataManagement.Recorders.Item(RECORDERNAME)
        # Set output file name.
        mainRecorder.BaseFileName = RECORDERNAME+".mf4"

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

        # Get TRoo signal.
        TRooSignal = self.MeasurementDataManagement.MeasurementConfiguration.Signals.Item(
            CONTROL_VARIABLE2_CONNECTION_STRING % self.DemoPlatform.Name)
        # Insert signal TRoo from main recorder.
        mainRecorder.Signals.Insert(TRooSignal)

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
        if self.MeasurementDataManagement.Measurements.Count == 0:
            raise Exception(DemoError, Resources.CreateMeasurementRootError)

        # Initialize information list.
        informationLines = []
        # Initialize format dictionary.
        formatValues = {}

        # Add information.
        # Show information about the first two measurements.
        print(self.MeasurementDataManagement.Measurements.Count)
        if self.MeasurementDataManagement.Measurements.Count > 0:

            # Iterate over the measurements.
            for index in range(self.MeasurementDataManagement.Measurements.Count):

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
                        informationLines.append("Title: '%s', Timestamp: '%s' s" % (bookmarkObject.Title,                                                                                     bookmarkObject.Timestamp))
                else:
                    informationLines.append("\nNo bookmarks included.")

                informationLines.append("\n" + "-"*80 + "\n")

            # Create information string.
            Information = "\n".join(informationLines)
            print(Information)
            # Get the measurement object of the first measurement.
            measurement = self.MeasurementDataManagement.Measurements.Item(0)
            print(dir(measurement))
            # Export measurement.
            measurement.Export(EXPORTPATH, True)
    #----------------------------------------------------------------------------------------------
    # Method : DefineOnlineCalibrationBehavior
    #      This method starts the a measuring in two different StartOnlineCalibrationBehavior modes.
    #----------------------------------------------------------------------------------------------

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
    # Create the demo controller object.
    demoController = MainDemoController()
    # Start ControlDesk and create the demo project root.
    demoController.Initialize()
    # Configure measurement.
    #demoController.ConfigureMeasurement()
    # Configure and start regular recording.
    demoController.configureAndStartRegularRecording()
    # Save the recorded data
    demoController.AccessRecordedData()
    # Close experiment
    #demoController.Uninitialize()

    return DemoFinishedWithoutUnexpectedException     

#--------------------------------------------------------------------------------------------------
# Main Program.
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':

    # Start demo.
    ExecuteDemo()