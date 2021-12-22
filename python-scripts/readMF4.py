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
channel_name="Model Root/behavior/TRooAir"
var = mdf.whereis(channel_name)
var_val = mdf.get(channel_name)
print(var_val.samples)
print(var_val.timestamps)
df=mdf.to_dataframe()
print(df)
