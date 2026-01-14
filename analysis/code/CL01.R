# CAPLES TWIN PINE LEFT 01 TREE RING ANALYSIS
# 
#  load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/cl1_crop.jpg"

# read image from disk
img_cl01 <- ring_read(img, dpi = 340)

# detect rings 
rings_cl01 <- ring_detect(img_cl01, seg = 4, method = "lineardetect", sample.yr = 2024)

meas_cl01 <- ring_modify(rings_cl01, del = c())

# make a dataframe
meas_cl01 <- ring_calculate(ring.data = rings_cl01, seriesID = "CL01")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_345346, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/CL01_meas.rwl", format = "tucson")
