# dspace-modelica-example
Modelica example model for hardware-in-the-loop using dSpace

# Configuration

## dSpace Hardware Configuration

## ALC Hardware and Software

## Virtul Buildings

### Modelica/FMU

### Configuration/Control Desk

1. Dymola-simulink interface

follow this link: https://www.claytex.com/blog/dymola-simulink-interface/.

2. FMU

# ALC WEBCTRL Settings

## VAV Controller

### I/O Points
Space Temp: space temperature, which is used to replace the Zone Temp sensed by the controller.

VAV Cooling Flow Control/Flow Input: vav flow rate measurement

Supply Air Temp: supply air temperature measurement


**The controller requires the outdoor conditions, how to pass??**

OAT:

RH

**The VAV Controller read measurements for air flow from built sensors, and send anaolog output to built-in damper motor, how to overwrite these two I/Os**
