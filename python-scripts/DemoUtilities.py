# -*- coding: cp1252 -*-
"""
File:           DemoUtilities.py

Description:    This Python module contains some utility functions used by the ControlDesk demo scripts.

Preconditions:  -

Tip/Remarks:    -

Limitations:    -

Version:        1.12

Date:           Jan 2020

                dSPACE GmbH shall not be liable for errors contained herein or
                direct, indirect, special, incidental, or consequential damages
                in connection with the furnishing, performance, or use of this
                file.
                Brand names or product names are trademarks or registered
                trademarks of their respective companies or organizations.

Copyright (c) 2020 by dSPACE GmbH
"""

from enum import Enum

__all__ = ["DemoError", "ThreadAffinity", "DemoDialogIcons", "DemoDialog",
           "IsMainThread", "RGB", "PrepareEnvironment", "RestoreEnvironment",
           "ENUM", "BITMASK", "Wait", "CloseAllWindows"]

_DefaultQuiet = False
_DefaultConsole = False


#--------------------------------------------------------------------------------------------------
# Class ThreadAffinity:
#    Defines ThreadAffinity Enums.
#--------------------------------------------------------------------------------------------------
class ThreadAffinity(Enum):
    none = 1
    MainThread = 2
    SeparateThread = 3

#--------------------------------------------------------------------------------------------------
# Class DemoDialogItems:
#    Defines DemoDialogIcons Enums.
#--------------------------------------------------------------------------------------------------
class DemoDialogIcons(Enum):
    MB_ICONNONE = 0
    MB_ICONERROR = 16
    MB_ICONQUESTION = 32
    MB_ICONWARNING  = 48
    MB_ICONINFORMATION = 64

#--------------------------------------------------------------------------------------------------
# Class DemoError:
#    Defines the standard demo error.
#--------------------------------------------------------------------------------------------------
class DemoError(BaseException):
    pass

#--------------------------------------------------------------------------------------------------
# Function RGB:
#     Converts single values for red, green, blue to corresponding color value.
#--------------------------------------------------------------------------------------------------
def RGB(Red=0, Green=0, Blue=0):
    """Converts single values for red, green, blue to corresponding color value."""
    # Check if bigger than 255 if yes limit to 255.
    Red, Green, Blue = map(lambda x: ((x > 255) and [255] or [x])[0], [Red, Green, Blue])
    # Check if less than 0 if yes limit to 0.
    Red, Green, Blue = map(lambda x: ((x < 0) and [0] or [x])[0], [Red, Green, Blue])
    # Make all variables an int.
    Red, Green, Blue = map(lambda x: int(x), [Red, Green, Blue])
    return Red | Green << 8 | Blue << 16

#--------------------------------------------------------------------------------------------------
# Function CloseAllCalDemoWindows
#     This function closes all windows of the CalDemo process.
#--------------------------------------------------------------------------------------------------
def CloseAllWindows():
    """
    Syntax       : CloseAllWindows()

    Description  : This function closes all windows of the CalDemo process. Actually it closes all 
                   windows that contain the string "dSPACE CalDemo".

    Parameters   : -

    Return value : -
    """
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
        if windowText.find("dSPACE CalDemo") != -1:
            
            # Close window.
            win32gui.PostMessage(window, win32con.WM_CLOSE, 0, 0)

#--------------------------------------------------------------------------------------------------
# Function IsMainThread
#     Returns true if the current thread is the main thread.
#--------------------------------------------------------------------------------------------------
def IsMainThread():
    """Returns true if the current thread is the main thread"""
    import threading
    return threading.currentThread().getName() == 'MainThread'

#--------------------------------------------------------------------------------------------------
# Function GetExecutableFileName
#    This function returns the long filename of the executing program in lower case.
#--------------------------------------------------------------------------------------------------
def GetExecutableFileName():
    """
    Module       : DemoUtilities

    Syntax       : ExeName = GetExecutableFileName()

    Description  : Returns the long filename of the executing program in lower case.

    Parameters   : -

    Return value : ExeName - string - The long filename of the executing program in lower case.
    """
    import sys
    from win32api import FindFiles
    return (FindFiles(sys.executable)[0][8]).lower()

#--------------------------------------------------------------------------------------------------
# Function PrepareEnvironment
#
#--------------------------------------------------------------------------------------------------
def PrepareEnvironment(Affinity=ThreadAffinity.MainThread):
    """Check the environment and prepares the executing process
    Syntax      : PrepareEnvironment([Affinity = ThreadAffinity.MainThread])

    Purpose     : Checks the environment, i.e. determines the running program
                   and minimizes PythonWin or Python and if running in
                   ControlDesk checks if the script runs in the thread specified
                   by the Affinity parameter.

    Parameters  : Affinity -  ThreadAffinity   - Enum in which thread shall be executed.

    Return value: -

    Exceptions  : DemoError
    """
    # Determine the Program which runs this script
    executeProgram = GetExecutableFileName()

    if executeProgram in ['python.exe', 'pythonwin.exe']:
        # Use these Python modules for minimize the Windows of Python and Pythonwin.
        from win32ui  import GetMainFrame
        from win32con import SW_SHOWMINIMIZED
        try:
            GetMainFrame().ShowWindow(SW_SHOWMINIMIZED)
        except Exception:
           # ignore any error
           pass
    elif executeProgram == 'ControlDesk.exe' and Affinity == ThreadAffinity.SeparateThread:
        if IsMainThread():
            raise DemoError("This script must be run in a separate "\
                            "thread, if running in ControlDesk.")

#--------------------------------------------------------------------------------------------------
# Function RestoreEnvironment:
#    Checks the environment, i.e. determines the running program and restores PythonWin or Python.
#--------------------------------------------------------------------------------------------------
def RestoreEnvironment():
    """Checks the environment, i.e. determines the running program and restores PythonWin or Python.
    Syntax      : RestoreEnvironment()

    Parameters  : -

    Return value: -

    Exceptions  : -
    """
    # Determine the Program which runs this script
    executeProgram = GetExecutableFileName()

    if executeProgram in ['python.exe', 'pythonwin.exe']:
        # Use these Python modules for minimize the Windows of Python and Pythonwin.
        from win32ui import GetMainFrame
        from win32con import SW_SHOWNORMAL
        try:
            GetMainFrame().ShowWindow(SW_SHOWNORMAL)
        except Exception:
            # ignore any error
            pass

#--------------------------------------------------------------------------------------------------
# Function Wait:
#    This method stops the script for the given time period, but still pumps the waiting thread 
#    messages.
#--------------------------------------------------------------------------------------------------
def Wait(pTime):
    """This method stops the script for the given time period, but still pumps the waiting thread 
       messages.
    Syntax      : Wait(pTime)

    Parameters  : time - float - The time period in seconds to wait.

    Return value: -

    Exceptions  : -
    """
    import pythoncom
    import time

    # Save current time point.
    startTimePoint = time.time()

    while time.time() - startTimePoint < pTime:
        # Pump all waiting messages of the current thread.
        pythoncom.PumpWaitingMessages()

#--------------------------------------------------------------------------------------------------
# Class DemoDialog:
#    The dialog used in the demos.
#--------------------------------------------------------------------------------------------------
class DemoDialog(object):
    """Creates a DemoDialog object.
    
    Syntax    : Dlg = DemoDialog(Title [, DefaultIcon])
    
    Parameters: Title       - string          - Title of the dialog
                DefaultIcon - DemoDialogIcons - icon to be shown on the dialog
    
    Return value: OBJ - DemoDialog  - The created dialog instance.
    """
    def __init__(self, Title, DefaultIcon=DemoDialogIcons.MB_ICONINFORMATION.value):
        # The dialog title.
        self._Title = Title
        # The dialog icon.
        self._Icon = DefaultIcon
        # True: Don't show the dialog boxes.
        self._Quiet = _DefaultQuiet
        # True: Print everything to the console.
        self._Console = _DefaultConsole

    def _GetQuiet(self):
        return self._Quiet

    def _SetQuiet(self, value):
        self._Quiet = bool(value)

    Quiet = property(_GetQuiet, _SetQuiet, None,\
                     "Returns/Sets if the DemoDialog should be shown.")

    def _GetConsole(self):
        return self._Console

    def _SetConsole(self, value):
        self._Console = bool(value)

    Console = property(_GetConsole, _SetConsole, None,\
                     "Returns/Sets if the DemoDialog print the output to the console.")

    #----------------------------------------------------------------------------------------------
    # Method : ParseArguments
    #      Parses the command line argument to change the dialog behavior.
    #----------------------------------------------------------------------------------------------
    def ParseArguments(self, commandLine):
        """Parses the command line argument to change the dialog behavior.
        Syntax       : Obj.PargsArguments(commandLine)

        Parameters  : commandLine - tuple - The list of command line arguments
                                                  icon.
        Return value: -

        Description : Parses the argument for following options
                        -c or --console : Print everything to the console
                        -q or --quiet   : don't show the dialog box

        Exceptions  : DemoError - Raised if cancel is pressed or the window is closed without Ok button.
        """
        import getopt
        try:
            options, arguments = getopt.getopt(commandLine, "cq", ["console", "quiet"])
        except getopt.GetoptError as err:
            # ignore any error
            pass
        for option, parameter in options:
            if option in ("-c", "--console"):
                self.Console = True
            if option in ("-q", "--quiet"):
                self.Quiet = True

    #----------------------------------------------------------------------------------------------
    # Method : Show
    #      Displays a small message box with an Ok and Cancel button.
    #----------------------------------------------------------------------------------------------
    def Show(self, summary, text=None, icon=None, raiseCancelError=True):
        """Displays a small message box with an Ok and Cancel button.
        Syntax       : Obj.Show(summary [, text=None [, icon = None]])

        Parameters  : summary - string - summary text for the demo dialog.
                      text    - string - MainText of the demo dialog.
                      icon    - DemoDialogIcons - icon to override the default icon.

        Return value: -

        Description : Display a small message box with an Ok and Cancel button
                      and raises a DemoError if cancel was pressed. The display
                      of the dialog could be suppressed it the Quiet property
                      of the dialog was set to true.

        Exceptions  : DemoError - Raised if cancel is pressed or the window
                                  is closed without Ok button.
        """
        from win32con import MB_TOPMOST, MB_OKCANCEL, IDCANCEL
        if text:
            msgText = "\n%s :\n\n%s" % (summary, text)
        else:
            msgText = summary
        if self.Console:
            print(msgText)
        if self.Quiet:
            return
        if not icon:
            icon = self._Icon
        if IsMainThread():
            # Since win32ui.MessageBox blocks the running program
            # if must not be used in a separate thread.
            from win32ui import MessageBox
            result = MessageBox(msgText, self._Title, icon if icon else MB_OKCANCEL)
        else:
            # win32api.MessageBox blocks only the running script
            # and not the program if the first parameter is zero.
            # Therefore it is safe to run this GUI element in a thread.
            from win32api import MessageBox
            result = MessageBox(0, msgText, self._Title, icon if icon else MB_OKCANCEL)
        if result == IDCANCEL and raiseCancelError:
            raise DemoError("DemoDialog canceled demo execution.")

    #----------------------------------------------------------------------------------------------
    # Method : ShowError
    #      Displays a small error message box with an Ok and Cancel button.
    #----------------------------------------------------------------------------------------------
    def ShowError(self, text=None):
        """Displays a small message box with an Ok and Cancel button.
        Syntax       : Obj.ShowError([text=None])

        Parameters  : text    - string - MainText of the demo dialog.

        Return value: -

        Description : Display a small message box with an Ok and Cancel button
                      and raises a DemoError if cancel was pressed. The display
                      of the dialog could be suppressed it the Quiet property
                      of the dialog was set to true.

        Exceptions  : DemoError - Raised if cancel is pressed or the window is closed 
                                  without Ok button.
        """

        # Display information.
        self.Show("Demo Error", text, icon=DemoDialogIcons.MB_ICONERROR.value, raiseCancelError=False)

    #----------------------------------------------------------------------------------------------
    # Method : ShowError
    #      Displays a small error message box with an Ok and Cancel button.
    #----------------------------------------------------------------------------------------------
    def ShowUnexpectedError(self, text=None):
        """Displays a small message box with an Ok and Cancel button.
        Syntax       : Obj.ShowUnexpectedError([text=None])

        Parameters  : text    - string - MainText of the demo dialog.

        Return value: -
        
        Description : Display a small message box with an Ok and Cancel button
                      and raises a DemoError if cancel was pressed. The display
                      of the dialog could be suppressed if the Quiet property
                      of the dialog was set to True.

        Exceptions  : DemoError - Raised if cancel is pressed or the window
                                     is closed without Ok button.
        """

        # Display information.
        self.Show("Unexpected Demo Error", text, icon=DemoDialogIcons.MB_ICONERROR.value, raiseCancelError=False)


    #----------------------------------------------------------------------------------------------
    # Method : ShowQuestion
    #      Displays a small message box with an Yes, No and Cancel button.
    #----------------------------------------------------------------------------------------------
    def ShowQuestion(self, summary, text=None, icon=None, defaultReturnValue=False):
        """Displays a small message box with an Yes, No and Cancel button.
        Syntax       : Obj.ShowQuestion(summary [, text=None [, icon = None]])

        Parameters  : summary - string - summary text for the demo dialog.
                      text    - string - MainText of the demo dialog.
                      icon    - DemoDialogIcons - icon to override the default icon.

        Return value: returnValue - boolean - Is true, if the yes-button was pressed.

        Description : Displays a small message box with an Yes, No and Cancel button and raises a 
                      DemoError if cancel was pressed. The display of the dialog could be suppressed 
                      it the Quiet property of the dialog was set to true.

        Exceptions  : DemoError - Raised if cancel is pressed or the window is closed without the yes
                                  or no button.
        """
        from win32con import MB_TOPMOST, MB_YESNOCANCEL, IDCANCEL, IDYES
        # Define return boolean value.
        returnValue = True
        # Set text.
        if text:
            msgText = "%s :\n\n%s" % (summary, text)
        else:
            msgText = summary
        if self.Console:
            print(msgText)
        if self.Quiet:
            returnValue = defaultReturnValue

        # Don't show the dialog if the demo is running in quiet mode.
        if not self.Quiet:
            if not icon:
                icon = DemoDialogIcons.MB_ICONQUESTION.value
            if IsMainThread():
                # Since win32ui.MessageBox blocks the running program if must not be used in a 
                # separate thread.
                from win32ui import MessageBox
                result = MessageBox(msgText, self._Title, icon | MB_TOPMOST | MB_YESNOCANCEL)
            else:
                # win32api.MessageBox blocks only the running script and not the program if the 
                # first parameter is zero. Therefore it is safe to run this GUI element in a thread.
                from win32api import MessageBox
                result = MessageBox(0, msgText, self._Title, icon | MB_TOPMOST | MB_YESNOCANCEL)
            if result == IDCANCEL:
                raise DemoError("DemoDialog canceled demo execution.")
            elif result != IDYES:
                returnValue = False
        return returnValue

#------------------------------------------------------------------------------
# Import the dialog module from the PythonWin path pywin\mfc.
# The dialog module is the base class for Dialogs.
#------------------------------------------------------------------------------
from pywin.mfc import dialog

#------------------------------------------------------------------------------
# Import the Win32 Python library win32ui and win32gui for encapsulating the
# Microsoft Foundation Classes.
#------------------------------------------------------------------------------
import win32ui
import win32gui
#------------------------------------------------------------------------------
# Import the win32 Python module win32con for getting access to the win32
# Python constants.
#------------------------------------------------------------------------------
import win32con
#------------------------------------------------------------------------------
# Import the Python library pythoncom for encapsulating the
# Microsoft Component Object Model.
#------------------------------------------------------------------------------
import pythoncom

#--------------------------------------------------------------------------------------------------
# Class StatusDialog:
#   This class generates the "StatusDialog" and inherits all elements.
#--------------------------------------------------------------------------------------------------
class StatusDialog(dialog.Dialog):
    """This class generates the "StatusDialog" and inherits all elements.

    Syntax      : Obj = StatusDialog(header, displayText, width, height)    

    Parameters  : -

    Description : This class generates the "StatusDialog" and inherits all elements.
    """
    #------------------------------------------------------------------------------
    # Define some IDs of used controls.
    #------------------------------------------------------------------------------
    IdcStaticHeader = 1000
    IdcStaticProgress = 1001
    IdcListBox = 1002
    IdcProgress = 1003

    #----------------------------------------------------------------------------------------------
    # Method __init__:
    #    This constructor initializes the StatusDialog object.
    #----------------------------------------------------------------------------------------------
    def __init__ (self):
        """This constructor initializes the StatusDialog object.

        Syntax      : OBJ.__init__()

        Description : This constructor initializes the StatusDialog object.

        Parameters  : -

        Return value: -

        Exceptions  : -
        """
        #Set the Range of the progress bar.
        self.Range = (0, 100)

        # Initialize the dialogs return value.
        self.DialogReturnValue = True

        # Initialize our task finished event.
        self.TaskFinished = None

        # True: Don't show the dialog boxes.
        self._Quiet = _DefaultQuiet
        # True: Print everything to the console.
        self._Console = _DefaultConsole


    def _GetQuiet(self):
        return self._Quiet

    def _SetQuiet(self, value):
        self._Quiet = bool(value)

    Quiet = property(_GetQuiet, _SetQuiet, None,\
                     "Returns/Sets if the StatusDialog should be shown.")

    def _GetConsole(self):
        return self._Console

    def _SetConsole(self, value):
        self._Console = bool(value)

    Console = property(_GetConsole, _SetConsole, None,\
                     "Returns/Sets if the StatusDialog print the output to the console.")

    #----------------------------------------------------------------------------------------------
    # Method : ParseArguments
    #      Parses the command line argument to change the dialog behavior.
    #----------------------------------------------------------------------------------------------
    def ParseArguments(self, commandLine):
        """Parses the command line argument to change the dialog behavior.
        Syntax       : Obj.PargsArguments(commandLine)

        Parameters  : commandLine - tuple - The list of command line arguments.

        Return value: -

        Description : Parses the argument for following options
                        -c or --console : Print everything to the console
                        -q or --quiet   : don't show the dialog box
        """
        import getopt
        try:
            options, arguments = getopt.getopt(commandLine, "cq", ["console", "quiet"])
        except getopt.GetoptError as err:
            # ignore any error
            pass
        for option, parameter in options:
            if option in ("-c", "--console"):
                self.Console = True
            if option in ("-q", "--quiet"):
                self.Quiet = True

    #----------------------------------------------------------------------------------------------
    # Method GetDialogStyle:
    #    This method gets the dialog style.
    #----------------------------------------------------------------------------------------------
    def GetDialogStyle(self, header, displayText, width, height):
        """This method gets the dialog style.

        Syntax      : OBJ.GetDialogStyle(header, displayText, width, height)

        Description : This method gets the dialog style.

        Parameters  : header         - string -  The header of the status dialog.
                      displayText    - string -  The display text of the status dialog.                      
                      width          - integer - The width of the status dialog.
                      height         - integer - The height of the status dialog.

        Return value: iddMainDlg - The dialog style.

        Exceptions  : -
        """
        #--------------------------------------------------------------------------------------------------
        # Define the dialog styles.
        #--------------------------------------------------------------------------------------------------
        style = win32con.DS_MODALFRAME | win32con.WS_SYSMENU | win32con.WS_VISIBLE | win32con.WS_POPUP | win32con.WS_CAPTION
        extendedStyle = 0
        buttonStyle = win32con.WS_CHILD | win32con.WS_VISIBLE
        listBoxStyle = win32con.WS_TABSTOP | win32con.WS_VISIBLE | win32con.WS_BORDER | win32con.LBS_NOTIFY | win32con.LBS_HASSTRINGS | win32con.WS_VSCROLL
        staticStyle = win32con.WS_VISIBLE | win32con.SS_LEFT
        progressStyle = win32con.WS_CHILD | win32con.WS_BORDER
        staticProgress = "Progress"
        # Define the dialog style.
        iddMainDlg = [[header, ( 0, 0, width, height), style, extendedStyle, (8, "MS Sans Serif")],
                ["Static", displayText, StatusDialog.IdcStaticHeader, (10, 10, 230, 20), staticStyle],
                ["Static", staticProgress, StatusDialog.IdcStaticProgress, (10 , height - 57, 230, 20), staticStyle],
                ["ListBox", "Test"  , StatusDialog.IdcListBox, (10, 20, width - 20, height - 80), listBoxStyle],
                ["Button", "OK", win32con.IDOK, ( width - 114, height - 20, 50, 16), buttonStyle | win32con.BS_DEFPUSHBUTTON],
                ["Button", "Cancel", win32con.IDCANCEL, ( width - 59, height - 20, 50, 16), buttonStyle]]
        return iddMainDlg

    #----------------------------------------------------------------------------------------------
    # Method OnInitDialog: 
    #      This method initalize the dialog.
    #----------------------------------------------------------------------------------------------
    def OnInitDialog(self):
        """This method initalize the dialog.

        Syntax      : OBJ.OnInitDialog()

        Description : This method initalize the dialog.

        Parameters  : -

        Return value: -

        Exceptions  : -
        """
        # Call the base method.
        retVal = dialog.Dialog.OnInitDialog(self)

        # Get the needed dialog items.
        self.ListBox      = self.GetDlgItem(StatusDialog.IdcListBox)
        self.ButtonOK     = self.GetDlgItem(win32con.IDOK)

        # By default the OK button is disabled.
        self.ButtonOK.EnableWindow(False)

        # Move the dialog to the center screen.
        dialogSize = self.GetWindowRect()
        dialogWidth = dialogSize[2] - dialogSize[0]
        dialogHeight = dialogSize[3] - dialogSize[1]
        desktopSize = win32gui.GetWindowRect(win32gui.GetDesktopWindow())
        desktopWidth = desktopSize[2] - desktopSize[0]
        desktopHeight = desktopSize[3] - desktopSize[1]
        startX = (desktopWidth - dialogWidth) / 2
        startY = (desktopHeight - dialogHeight) / 2
        if startX != dialogSize[0] or startY != dialogSize[1]:
            self.MoveWindow((int(startX), int(startY), int(dialogWidth + startX), int(dialogHeight + startY)))

        # Create the progress control.
        self.CreateProgressControl(14, dialogHeight - 102, dialogWidth - 32, 23)

        return retVal

    #----------------------------------------------------------------------------------------------
    # Method OnOK: 
    #      This method will be called if the button 'OK' gets clicked.
    #----------------------------------------------------------------------------------------------
    def OnOK(self):
        """This method will be called if the button 'OK' gets clicked.

        Syntax      : OBJ.OnOK()

        Description : This method will be called if the button 'OK' gets clicked.

        Return value: -

        Exceptions  : -
        """
        # Set the dialog return value.
        self.DialogReturnValue = True
        # Call the base method.
        dialog.Dialog.OnOK(self)
        # Send WM_QUIT message to end our message pumping.
        win32gui.PostQuitMessage(0)     

    #----------------------------------------------------------------------------------------------
    # Method OnCancel: 
    #      This method will be called if the button 'Cancel' gets clicked.
    #----------------------------------------------------------------------------------------------
    def OnCancel(self):
        """This method will be called if the button 'Cancel' gets clicked.

        Syntax      : OBJ.OnOK()

        Description : This method will be called if the button 'Cancel' gets clicked.

        Return value: -

        Exceptions  : -
        """
        # Set the dialog return value.
        self.DialogReturnValue = False
        # Call the base method.
        dialog.Dialog.OnCancel(self)

    #----------------------------------------------------------------------------------------------
    # Method OnDestroy: 
    #      This method will be called if dialog gets destroyed.
    #----------------------------------------------------------------------------------------------
    def OnDestroy(self, Param):
        """This method will be called if dialog gets destroyed.

        Syntax      : OBJ.OnDestroy(Param)

        Description : This method will be called if dialog gets destroyed.

        Return value: -

        Exceptions  : -
        """
        # Send WM_QUIT message to end our message pumping.
        win32gui.PostQuitMessage(0)
    
    #----------------------------------------------------------------------------------------------
    # Method CreateProgressControl: 
    #      This method creates the progress control.
    #----------------------------------------------------------------------------------------------
    def CreateProgressControl(self, left, top, width, height):
        """This method creates the progress control.

        Syntax      : OBJ.CreateProgressControl(left, top, width, height, Range, step, InitialPos)

        Description : This method creates the progress control.

        Parameters  : left, top       are the left and top position of the
                                      progress control.
                      width, height   are the width and height of the progress
                                      control.

        Return value: -

        Exceptions  : -
        """
        # Create a progress control object.
        self.progress = win32ui.CreateProgressCtrl()

        # Create the actual control.
        #
        # - CreateWindow(<style>, <rect>, <parent>, <id>)
        #   <style>     is the style for the control;
        #   <rect>      is the size and position of the control;
        #   <parent>    is the parent window of the control;
        #   <id>        is the id of the control.
        self.progress.CreateWindow(win32con.WS_CHILD | win32con.WS_BORDER,
                                   (left, top, left + width, top + height),
                                   self, StatusDialog.IdcProgress)
        
        # Set the control's bounds.
        #
        # - SetRange(<nLower>, <nUpper>)
        #   <nLowewr>   specifies the lower limit of the range;
        #   <nUpper>    specifies the upper limit of the range.
        self.progress.SetRange(self.Range[0], self.Range[1])

        # Calculate the step.
        step = (self.Range[1] - self.Range[0]) / 100
        # Specify the step increment for a progress bar control.
        #
        # - SetStep(<nStep>)
        #   <nStep> is the new step increment.
        self.progress.SetStep(int(step))

        # Set the position of the progress bar.
        #
        # - SetPos(<nPos>)
        #   <nPos>  is the new position of the progress bar.
        self.progress.SetPos(self.Range[0])
        #Show the progress bar in the dialog
        self.progress.ShowWindow(win32con.SW_SHOW)

    #----------------------------------------------------------------------------------------------
    # Method SetProgress: 
    #      This method sets the progress on the progress bar window.
    #----------------------------------------------------------------------------------------------
    def SetProgress(self, progress):
        """This method sets the progress on the progress bar window.

        Syntax      : OBJ.SetProgress(progress)

        Description : This method sets the progress on the progress bar window.

        Parameters  : progress - integer - The progress on the progress window.

        Return value: -

        Exceptions  : -
        """
        # If the progress is none do nothing.
        if progress is None:
            return
        # Set the progress within the given range.
        if progress > self.Range[1]:
            progress = self.Range[1]
        if progress < self.Range[0]:
            progress = self.Range[0]
        if progress <= self.Range[1]:
            if self.Console:
                print("progress: %s" % progress)
            if self.Quiet:
                return
            if self.progress.IsWindow():
                # Set the progress within the dialog.
                self.progress.SetPos(int(progress))

    #----------------------------------------------------------------------------------------------
    # Method AddMessage: 
    #      This method adds a string message to the listbox window.
    #----------------------------------------------------------------------------------------------
    def AddMessage(self, message):
        """This method adds a string message to the listbox window.

        Syntax      : OBJ.AddMessage(message)

        Description : This method adds a string message to the listbox window.

        Parameters  : message - string - The string message.

        Return value: -

        Exceptions  : -
        """
        # If the message is none do nothing.
        if message is None:
            return
        if self.Console:
            print(message)
        if self.Quiet:
            return

        if self.ListBox.IsWindow():
            # Add the message to the listbox window.
            self.ListBox.AddString(message)

    #----------------------------------------------------------------------------------------------
    # Method SetTaskFinished: 
    #      Singnal our dialog that the shown task is finished.
    #----------------------------------------------------------------------------------------------
    def SetTaskFinished(self):
        """Singnal our dialog that the shown task is finished.

        Syntax               : OBJ.SetTaskFinished()

        Description          : Singnal our dialog that the shown task is finished.

        Optional Parameters  : -

        Return value         : -

        Exceptions           : -
        """
        import win32event
        if self.Quiet:
            if self.TaskFinished is not None:
                # Set our task finish event to end our message pumping in quiet mode.
                win32event.SetEvent(self.TaskFinished)
            return

        if self.progress.IsWindow():
            # Set our progress to maximum.
            self.progress.SetPos(self.Range[1])

        if self.ButtonOK.IsWindow():
            # Enable the button 'OK'.
            self.ButtonOK.EnableWindow(True)

    #----------------------------------------------------------------------------------------------
    # Method ShowDialog: 
    #      This method shows the Status Dialog.
    #----------------------------------------------------------------------------------------------
    def ShowDialog(self, header, displayText, width, height):
        """This method shows the Status Dialog.

        Syntax      : OBJ.ShowDialog()

        Description : This method shows the Status Dialog.

        parameter:    header         - string -  The header of the status dialog.
                      displayText    - string -  The display text of the status dialog.
                      width          - integer - The width of the status dialog.
                      height         - integer - The height of the status dialog.

        Return value: returnValue - bool - The dialog return value. ('OK' == True, 'Cancel' == False)

        Exceptions  : -
        """
        import win32event
        # Create an event to signal our dialog when the task is finished.
        self.TaskFinished = win32event.CreateEvent(None, 0, 0, None)
        
        if not self.Quiet:
            # Define the style.
            style = self.GetDialogStyle(header, displayText, width, height)
            # Create a dialog object from a template.
            dialog.Dialog.__init__(self, style)
            # create the dialog window if we are not in quiet mode.
            self.CreateWindow()
        # Wait for the dialog to close, but pump all waiting messages for the current thread.
        while True:
            # Wait for any messages to arrive.
            retVal = win32event.MsgWaitForMultipleObjects((self.TaskFinished, ), False, win32event.INFINITE, win32event.QS_ALLEVENTS)
            if retVal == win32event.WAIT_OBJECT_0:
                # End our message pumping if our task finished event gets signaled. This should only happen in quiet mode.
                break
            else:
                # Pump the waiting messages and if the message is WM_QUIT end our loop
                if pythoncom.PumpWaitingMessages():
                    break
        # Release our task finish event.
        self.TaskFinished.Close()
        self.TaskFinished = None
        return self.DialogReturnValue
