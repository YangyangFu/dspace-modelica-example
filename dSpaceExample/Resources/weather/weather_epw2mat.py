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
weather_modelica = Reader("ChicagoWeatherReader.mat", "dymola")
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

# interpolate to 1 hour weather data
def interp(df, new_index):
    """Return a new DataFrame with all columns values interpolated
    to the new_index values."""
    df_out = pd.DataFrame(index=new_index)
    df_out.index.name = df.index.name

    for colname, col in df.iteritems():
        df_out[colname] = np.interp(new_index, df.index, col)

    return df_out

#interpolate one hour data
ts = weather_python.index[0]
te = weather_python.index[-1]
time_intp = np.arange(ts,te+1,3600) 
weather_hourly = interp(weather_python, time_intp)
#average every 15 minutes
weather_hourly.to_csv('weather_hourly.csv')

# write to modelica txt format
outTable = 'weather_hourly.txt'
if os.path.exists(outTable):
	os.remove(outTable)
nRow=len(weather_hourly.index)
column_names = weather_hourly.columns

f = open(outTable,'w')
f.writelines('#1 \n')
f.writelines('double tab('+str(nRow)+','+str(len(column_names)+1)+')\n')
for i in range(nRow):
    strs = str(weather_hourly.index[i])+' '
    for col in column_names:
        strs += str(weather_hourly.loc[weather_hourly.index[i],col])+' '
    # replace the last , as  ;
    strs=strs[:-1]
    f.writelines(strs+'\n')
f.close()

# offset start time in HIL: dspace cannot only start simulation from t=0, 
#we need sync the time between dspace time and modelica time if modelica model needs start from a nonzero time.
starttime=212*24*3600. 
endtime = starttime + 7*24*3600. # only copy past one week data

# write to modelica txt format and need to copy to weather model developed for dspace modelica running
outTable = 'weather_hourly_fordspace.txt'
if os.path.exists(outTable):
	os.remove(outTable)
weather_slice=weather_hourly.loc[starttime:endtime,:]
nRow=len(weather_slice.index)
column_names = weather_slice.columns

f = open(outTable,'w')
f.writelines('#1 \n')
f.writelines('double tab('+str(nRow)+','+str(len(column_names)+1)+')\n')
for i in range(nRow):
    strs = str(weather_slice.index[i]-starttime)+','
    for col in column_names:
        strs += str(weather_slice.loc[weather_slice.index[i],col])+','
    # replace the last , as  ;
    strs=strs[:-1]+";"
    f.writelines(strs+'\n')
f.close()
