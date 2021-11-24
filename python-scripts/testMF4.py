"""
About: Load MDF log files & DBCs from an input folder and showcase various operations.
Note: Example assumes v6.4.4+ of asammdf
"""
from asammdf import MDF

# set variables
mdf_file = "measurement.mf4"

# load MDF/DBC files from input folder
mdf = MDF(mdf_file)
print(mdf.version)
x1=mdf.get_channel_name(0,1)
print(x1)
var = mdf.whereis("Model Root/behavior/TRooAir")
var_val = mdf.get("Model Root/behavior/TRooAir")
print(var_val.samples)
print(var_val.timestamps)
df=mdf.to_dataframe()
#print(df)
