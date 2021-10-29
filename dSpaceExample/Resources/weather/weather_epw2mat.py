"""
read weather data from year-long simulation using weather reader
1. run dSpaceExample.Debug.WeatherReader using the existing epw/mos file
2. save the results and post-process in Pythong using this script
"""
from buildingspy.io.outputfile import Reader
import pandas as pd
import numpy as np
import os
import sys
# 1. assume the weather file is simulated in Modleica first, and we have the results file as weatherModelica.mat

# 2. post-process the result mat file to generate new weather data in "mat" for HIL implementation.
weather_modelica = Reader("WeatherReader.mat", "dymola")
print(weather_modelica.values("weaBus.HDirNor"))

names = [
'HDifHor', 
'HDirNor',
'HGloHor',
'HHorIR', 
'TBlaSky',
'TDewPoi',
'TDryBul',
'TWetBul', 
'ceiHei', 
'cloTim', 
'nOpa', 
'nTot', 
'relHum', 
'solAlt', 
'solDec', 
'solHouAng', 
'solTim', 
'solZen', 
'winDir', 
'winSpe']

weather_python = pd.DataFrame()

for name in names:
    print("weaBus."+name)
    time, y = weather_modelica.values("weaBus."+name)
    # save in pandas
    weather_python[name]=y
weather_python.index=time
print(weather_python.head())

## ['lat', 'lon', 'pAtm', ]
constant_columns= ['lat', 'lon', 'pAtm']
for cons_col in constant_columns:
    n = len(weather_python.index)
    print(n)
    t,cons_var = weather_modelica.values("weaBus."+cons_col)
    weather_python[cons_col] = cons_var[0]*np.ones([n,1])
print(weather_python[['lat','lon','pAtm','TDryBul']])

weather_python.to_csv("weather_python.csv",index_label="time")

# call matlab to conver csv to desired mat file format for dspace
