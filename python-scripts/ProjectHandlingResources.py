# -*- coding: cp1252 -*-
"""
File:           ProjectHandlingResources.py

Description:    This script contains the strings used in the project handling demo.

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
Start= \
"""Next Steps:

- Start ControlDesk.

- Create temporary demo project root:
  '%s'
"""

# Uninitialize string.
Uninitialize = \
"""Next Step:

- Remove demo project root:
  '%s'
"""

# Dialog string with question to remove project.
RemoveProjectQuestion = \
"""The project '%s' does already exist.
Should it be overwritten?
"""

# Dialog string before the project root information is read.
ProjectRootGetInfo = \
"""Next Step:

- Read information from projects in all project roots.
"""

# Dialog string with the project root information.
ProjectRootShowInfo = \
"""This is a list of all found project root paths associated with the number of projects:
%s
"""

# Dialog string before the project creation.
CreateNewProjectRoot= \
"""Next Steps:

- Create new project root '%s'.

- Activate new project root.
"""

# Dialog string after the project is created.
DeleteNewProjectRoot = \
"""Next Step:

- Remove new project root.
"""


# Dialog string for project creation.
CreateProject = \
"""Next Step:

- Create new project '%s'.
"""

# Dialog string before project deletion.
DeleteProject = \
"""Next Step:

- Close and remove the created project '%s'.
"""

# Dialog string to load project.
LoadProject = \
"""Next Step:

- Load existing project '%s'.
  If the project cannot be found, open the first project in the current project root 
  or create a new project if no project exists.
"""

# Dialog string before reading the project information.
ReadActiveProjectInfo = \
"""Next Step:

- Show information for active project.
"""

# Dialog string with the project information.
ShowActiveProjectInfo = \
"""Project name: 
'%(Name)s'

Project path: 
'%(Path)s'

Is project modified: 
%(IsModified)s

Number of experiments: 
%(ExpNo)s

Number of files:
%(FilesNo)s

Project description: 
%(Description)s
"""

# Dialog string at the beginning of "EditNewProject".
AddExperimentAndPlatform = \
"""Next Steps:

- Activate demo project root.

- Create new project '%s'.

- Add new experiment '%s'.

- Add a XCP on CAN platform.
"""

# Second dialog string in "EditNewProject".
RemoveExperimentAndPlatform = \
"""Next Steps:

- Create project backup '%s'.

- Remove platform.

- Save changes and remove project.
"""

# Third dialog string in "EditNewProject".
ReloadBackup = \
"""Next Steps:

- Remove project.

- Reload backup '%s' to project '%s'.
"""

# Last dialog string in "EditNewProject".
CloseBackup = \
"""Next Step:

- Close backup project:
 '%s'
"""

#--------------------------------------------------------------------------------------------------
# Define error strings.
#--------------------------------------------------------------------------------------------------

# Error because a project cannot be loaded.
CannotLoadActiveProjectError = "No active project found!"

# Error because a project root cannot be removed.
RemoveProjectRootError = "Could not remove project root '%s'!"

# Error because a project cannot be found.
CannotFindProjectError = "Could not find project '%s'!"

# Error because a project that should be created already exists in the project root.
CreatedProjectAlreadyExistsError = "Project '%s' does already exist!"

# Error because no project was loaded..
CannotFindAnyProjectError = "No project found in current project root.\nSo create a new project for the next steps."
