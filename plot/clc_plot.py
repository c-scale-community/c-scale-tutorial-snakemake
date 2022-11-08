import xarray as xr
import matplotlib.pyplot as plt
import numpy as np
output_data4 = xr.open_dataset("../data/u2000_clc1990_v2020_20u1_raster100m/DATA/U2000_CLC1990_V2020_20u1.tif")
min_lon = 1909850
max_lon = 1700150

min_lat = 2700150 
max_lat = 2900000 


cropped_ds = output_data4.sel(band= 1, x=slice(min_lat,max_lat), y=slice(min_lon,max_lon))

arr = np.array(cropped_ds.to_array())
plt.imshow(arr[0])
plt.savefig('output.png')
