# -*- coding: cp1252 -*-
"""
File:           MeasuringAndRecordingResources.py

Description:    This script contains the strings used in the measuring and recording demo.

Preconditions:  -

Tip/Remarks:    -

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
# Define strings for the dialogs.
#--------------------------------------------------------------------------------------------------

# Dialog string with start information.
Start = \
"""Next Steps:

- Start ControlDesk.

- Create demo project root:
  '%s'

- Create project:
  '%s'

- Create experiment:
  '%s'

- Create XCPonCAN platform with variable description.

- Add plotter instrument to layout.

- Connect variable '%s' to plotter instrument.

- Connect variable '%s' to plotter instrument.
"""

# Dialog string with question to remove project.
RemoveProjectQuestion = \
"""The project '%s' does already exist.
Should it be overwritten?
"""

# Dialog string before ControlDesk is closed.
Uninitialize = \
"""Next Steps:

- Stop measuring and online calibration.

- Remove demo project:
  '%s'

- Remove demo project root:
  '%s'

- Stop CalDemo process.
"""

# Dialog string before the measurement is started.
StartMeasurement = \
"""Next Steps:

- Start CalDemo platform.

- Add variables to measurement signal list.

- Configure Measurement.

- Start Measurement.
"""

# Dialog string before the measurement is stopped.
StopMeasurement = \
"""The buffer size is set to 10 s with a warning time of 3 s.
So you should hear a beep after 7 s if you wait for it now.

Next Steps:

- Stop Measurement.

- Stop online calibration.
"""

# Dialog string before information about the measurement signals is shown.
ShowSignalInformation = \
"""Next Step:

- Show information about signals in the measurement signal list.
"""

SignalInformation = \
"""Variable name: '%(name)s'
Raster name: '%(raster)s'
Is connected: '%(connected)s'
Is active: '%(active)s'
Recording enabled: '%(recording)s'

-------------------------------------------------
"""

MainRecorderResultReadyEvent = \
"""The results on the buffer for the raster <%s> on recorder <%s> are ready to fetch.
Fetched %d samples. The newest values on time stamp %g are:
%s
"""

# Dialog string before the regular recording is started.
StartRegularRecording = \
"""Next Steps:

- Configure recording with time limit as stop condition.

- Start recording.

- Stop measurement and online calibration after the recording has stopped.
"""

# Dialog string before the event based recording is started.
StartEventBasedRecording = \
"""Next Steps:

- Configure recording with time limit as stop condition.

- Start recording.

- Log the recorder data getting by event mechanism.

- Stop measurement and online calibration after the recording has stopped.
"""

# Dialog string before the event based recording is started.
StartPollingRecording = \
"""Next Steps:

- Configure recording.

- Start recording.

- Poll the recorder data.

- Stop measurement and online calibration after the recording has stopped.
"""

# Dialog string before the triggered recording is started.
StartTriggeredRecording = \
"""Next Steps:

- Activate all measurement signals for recording.

- Configure triggered recording..

- Start recording.

- Stop measurement and online calibration after the recording has stopped.
"""

# Dialog string before the recorded data is shown.
ShowRecordedData = \
"""Next Step:

- Show information about the first two recorded data objects.
"""

# Dialog string with measurement information.
ShowRecordedDataInformation = \
"""File name: '%(name)s'

Recording start time: '%(start)s'

Length of recording time: '%(time)s's

Following %(count)i variables are included:
"""

# Dialog string with measurement information..
ShowRecordedDataInPlotter = \
"""Next Steps:

- Create new layout with plotter.

- Show measured data from a signal in the first measurement in the plotter.
"""

# Dialog string before a measurement data is exported.
ExportMeasurementData = \
"""Next Step:

- Export measurement data to file '%s'.
"""

# Dialog string before a measurement data is imported.
ImportMeasurementData = \
"""Next Step:

- Import measurement data from file '%s'.
"""

# Dialog string before the page is uploaded.
UploadPage = \
"""Next Steps:

- Activate first layout.

- Change value of parameter '%s' to '%i'.

- Disconnect platform.

- Set working page as initial page.

- Set 'UploadWorkingPageUploadReferencePage' as StartOnlineCalibrationBehavior.
  The working page will be uploaded from the ECU, so the new parameter's value will be set to the original value.

- Start recording.
"""

# Dialog string before the page is downloaded.
DownloadPage = \
"""Next Steps:

- Stop measuring and online calibration.

- Change value of parameter '%s' to '%i'.

- Disconnect platform.

- Set 'DownloadWorkingPageUploadReferencePage' as StartOnlineCalibrationBehavior.
  The working page will be downloaded to the ECU, so new parameter's value will be transferred.

- Start recording.
"""

#--------------------------------------------------------------------------------------------------
# Define error strings.
#--------------------------------------------------------------------------------------------------

# Error because a project root cannot be removed.
RemoveProjectRootError = "Could not remove project root '%s'."

# Error because a platform cannot be created.
RemovePlatformError = "Could not create platform."

# Error because a measurement couldn't be created. 
CreateMeasurementRootError = "Measurement data wasn't created."

# Error because a project that should be created already exists in the project root.
CreatedProjectAlreadyExistsError = "Project '%s' does already exist."
