# CAPLES TWIN PINE LEFT 01 TREE RING ANALYSIS
# 
#  load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/cl1_crop.jpg"

# read image from disk
img_cl01 <- ring_read(img, dpi = 340, magick = TRUE)

# detect rings 
rings_cl01 <- ring_detect(img_cl01, seg = 4, method = "lineardetect", sample.yr = 1000)

# remove false rings
rem_cl1 <- ring_modify(rings_cl01, del = c(2,5,6,8,9,11,18,20,22,24,25,28,30,32:39))

# make a dataframe
meas_cl01 <- ring_calculate(ring.data = rem_cl1, seriesID = "CL01")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_cl01, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/cl1_meas.rwl", format = "tucson")

