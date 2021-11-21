# -*- coding: cp1252 -*-
#--------------------------------------------------------------------------------------------------
# Import python library modules which are used in this demo.
# The class Dispatch is used to create objects.
# The class com_error is used to catch automation specific errors.
# The exception module is used to catch unexpected exceptions.
#--------------------------------------------------------------------------------------------------
from win32com.client import DispatchWithEvents
from win32com.client import GetActiveObject
from dspace.com import Enums
from pywintypes import com_error

#--------------------------------------------------------------------------------------------------
# Class ApplicationEvents:
#   Defines the event sink for the application events.
#--------------------------------------------------------------------------------------------------
class ApplicationEvents(object):
    """Defines the event sink for the application events.

    Syntax       : OBJ = ApplicationEvents() 

    Parameters : -

    Description: Defines the event sink for the application events.
    """
    #----------------------------------------------------------------------------------------------
    # Method : OnStarted
    #      This method will be called, if the application has been started.
    #----------------------------------------------------------------------------------------------
    def OnStarted(self):
        """This method will be called, if the application has been started.

        Syntax      : Obj.OnStarted()

        Parameters  : -

        Description : This method will be called, if the application has been started.

        Return Value: -
        """
        print("--- Application started. ---")

    #----------------------------------------------------------------------------------------------
    # Method : OnQuitting
    #      This method will be called, if the application is quitting.
    #----------------------------------------------------------------------------------------------
    def OnQuitting(self):
        """This method will be called, if the application is quitting.

        Syntax      : Obj.OnQuitting()

        Parameters  : -

        Description : This method will be called, if the application is quitting.

        Return Value: -
        """
        print("--- Application is quitting. ---")

#--------------------------------------------------------------------------------------------------
# Class MainWindowEvents:
#   Defines the event sink for the main window events.
#--------------------------------------------------------------------------------------------------
class MainWindowEvents(object):
    """Defines the event sink for the main window events.

    Syntax       : OBJ = MainWindowEvents() 

    Parameters : -

    Description: Defines the event sink for the main window events.
    """

    #----------------------------------------------------------------------------------------------
    # Method : OnStateChanged
    #      This method will be called, if the state of the main window has been changed.
    #----------------------------------------------------------------------------------------------
    def OnStateChanged(self, state):
        """This method will be called, if the state of the main window has been changed.

        Syntax      : Obj.OnStateChanged()

        Parameters  : state - enumeration - The new window state of the main window.

        Description : This method will be called, if the state of the main window has been changed.

        Return Value: -
        """
        print("--- MainWindow state changed: %s. ---" % self.Enums.MainWindowState(state))

#--------------------------------------------------------------------------------------------------
# Class MainDemoController:
#   This is the main class that controls and runs the demo.
#--------------------------------------------------------------------------------------------------
class MainDemoController(object):
    #----------------------------------------------------------------------------------------------
    # Method __init__:
    #   This method initializes the MainDemoController object.
    #----------------------------------------------------------------------------------------------
    def __init__(self):
        """This method initializes the MainDemoController object.

        Syntax      : Obj.__init__()

        Parameters  : -

        Description : This method initializes the MainDemoController object.

        Return Value: - 
        """
        # The ControlDesk application object.
        self.ControlDeskApplication = None

        # The enums fot the ControlDesk object model.
        self.Enums = None

    #----------------------------------------------------------------------------------------------
    # Method : StartAndCloseControlDesk
    #      This method starts ControlDesk, reads some information and closes ControlDesk afterwards.
    #----------------------------------------------------------------------------------------------
    def StartAndCloseControlDesk(self):
        """This method starts ControlDesk, reads some information and closes ControlDesk afterwards.

        Syntax      : Obj.StartAndCloseControlDesk()

        Parameters  : -

        Description : This method starts ControlDesk, reads some information and closes ControlDesk afterwards.

        Return Value: -
        """
        versionDependentProdID = "ControlDeskNG.Application.7.2"

        # Check if ControlDesk is already running.
        #USERDIALOG.Show("Check ControlDesk is running", Resources.CheckRunning)
        activeObject = None
        try:
            activeObject = GetActiveObject(versionDependentProdID)
        except:
            pass

        if None != activeObject:
            print("ControlDesk running")
        else:
            print("ControlDesk not running")

        # Access the ControlDesk instance. If ControlDesk is not running it will be started.
        #USERDIALOG.Show("Start ControlDesk And Read Information", Resources.Start)

        # Start ControlDesk 7.2 and connect the events
        self.ControlDeskApplication = DispatchWithEvents(versionDependentProdID, ApplicationEvents)

        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)
        MainWindowEvents.Enums = self.Enums

        # Connect the events for the main window
        mainWindow = DispatchWithEvents(self.ControlDeskApplication.MainWindow, MainWindowEvents)

        # Set ControlDesk visible.
        mainWindow.Visible = True

        # Change the main window state.
        mainWindow.State = self.Enums.MainWindowState.Maximized
        mainWindow.State = self.Enums.MainWindowState.Minimized
        mainWindow.State = self.Enums.MainWindowState.Restored

        # Get application name.
        name = self.ControlDeskApplication.Name

        # Get ControlDesk version.
        version = self.ControlDeskApplication.Version

        # Show information in a dialog.
        #USERDIALOG.Show("Show Information", Resources.Result % (name, version))

        # Show next step in a dialog.
        #USERDIALOG.Show("Close ControlDesk", Resources.Close)

        # Try to close ControlDesk. A com_error occurs, if ControlDesk has already been closed.    
        #try:
            # Close ControlDesk.
        #    self.ControlDeskApplication.Quit()
        #except(com_error):
        #    pass

    def startControlDesk(self):
        """This method starts ControlDesk, reads some information and closes ControlDesk afterwards.

        Syntax      : Obj.StartAndCloseControlDesk()

        Parameters  : -

        Description : This method starts ControlDesk, reads some information and closes ControlDesk afterwards.

        Return Value: -
        """
        self.versionDependentProdID = "ControlDeskNG.Application.7.2"

        # Start ControlDesk 7.2 and connect the events
        self.ControlDeskApplication = DispatchWithEvents(self.versionDependentProdID, ApplicationEvents)

        # Create the enums object.
        self.Enums = Enums(self.ControlDeskApplication)
        MainWindowEvents.Enums = self.Enums

        # Connect the events for the main window
        mainWindow = DispatchWithEvents(self.ControlDeskApplication.MainWindow, MainWindowEvents)

        # Set ControlDesk visible.
        mainWindow.Visible = True

        # Change the main window state.
        mainWindow.State = self.Enums.MainWindowState.Maximized
        mainWindow.State = self.Enums.MainWindowState.Minimized
        mainWindow.State = self.Enums.MainWindowState.Restored

    def closeControlDesk(self):
            """ This method closes an active control desk session
            """
            # Check if controldesk is running
            activeObject = None
            try:
                activeObject = GetActiveObject(self.versionDependentProdID)
            except:
                pass
            if None != activeObject:
                print("ControlDesk running")
            else:
                print("ControlDesk not running")   

            # Try to close ControlDesk. A com_error occurs, if ControlDesk has already been closed.    
            try:
                # Close ControlDesk.
                self.ControlDeskApplication.Quit()
            except(com_error):
                pass

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
    import time 
    # Initialize demoController.
    demoController = None

    # Initialize the return value.
    demoFinishedWithoutUnexpectedException = True

    # Check the environment and prepares the executing process.
    #PrepareEnvironment()

    try:
        # Create the demo controller object.
        demoController = MainDemoController()

        # Start ControlDesk, read information.
        demoController.startControlDesk()

        # Show dialog with the information that the demo has finished.
        #print("ControlDesk is running .........")
        time.sleep(5)   # Delays for 5 seconds. You can also use a float value.

        # Close ControlDesk 
        print("ControlDesk is about to be closed .........")
        demoController.closeControlDesk()

    except Exception as message:

        # Show the error.
        #USERDIALOG.ShowUnexpectedError(message)

        # Print traceback.
        import traceback
        traceback.print_exc()

        # Set return value to False, because an unexpected exception has occurred.
        demoFinishedWithoutUnexpectedException = False

    return demoFinishedWithoutUnexpectedException

#--------------------------------------------------------------------------------------------------
# Main Program
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    # Start demo.
    ExecuteDemo()