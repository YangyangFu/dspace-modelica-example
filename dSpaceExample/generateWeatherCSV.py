from __future__ import print_function
from __future__ import absolute_import, division

from pyfmi import load_fmu
import pandas as pd 
import numpy as np
import os

model=load_fmu('WeatherReader.fmu')
## simulation settings
ts = 0
te = 30*24*3600
dt = 300.
## fmu settings
options = model.simulate_options()
options['ncp'] = 5000.
options['initialize'] = True

## simulate
res = model.simulate(start_time = ts,
                    final_time = te, 
                    options = options)

## get key measurements
time = res['time']
TDryBul = res['TDryBul']


## post-processing: interpolate
weather = pd.DataFrame({'TDryBul':np.array(TDryBul)},
                            index=time)

def interp(df, new_index):
    """Return a new DataFrame with all columns values interpolated
    to the new_index values."""
    df_out = pd.DataFrame(index=new_index)
    df_out.index.name = df.index.name

    for colname, col in df.iteritems():
        df_out[colname] = np.interp(new_index, df.index, col)

    return df_out

#interpolate one minute data
time_intp = np.arange(ts,te+1,dt) 
weather_intp = interp(weather, time_intp)

# save as Modelica table file
outTable = 'weather.txt'
if os.path.exists(outTable):
	os.remove(outTable)

nRow = len(weather_intp)
nCol = len(weather_intp.columns)
print(weather_intp.columns)

f = open(outTable,'w')
f.writelines('#1 \n')
f.writelines('double tab('+str(nRow)+','+str(nCol+1)+')\n')
for i in range(nRow):
	f.writelines(str(weather_intp.index[i])+' '+str(weather_intp.loc[weather_intp.index[i],'TDryBul'])+'\n')
f.close()