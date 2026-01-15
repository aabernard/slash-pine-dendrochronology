# CAPLES TWIN PINE LEFT 02 TREE RING ANALYSIS
# 
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/cl2_crop.jpg"

# read image from disk
img_cl2 <- ring_read(img, dpi = 340)

# detect rings 
rings_cl2 <- ring_detect(img_cl2, seg = 4, method = "lineardetect", sample.yr = 2025)

# remove false years
rem_cl2 <- ring_modify(rings_cl2, del = c(2,3,5,7,8,9,11,13,14,16,18,19,21,22,24,25,27))

# make a dataframe
meas_cl2 <- ring_calculate(ring.data = rem_cl2, seriesID = "cl2")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_cl2, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/cl2_meas.rwl", format = "tucson")
