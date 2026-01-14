# 345334 TREE ANALYSIS 

# load libs
library(MtreeRing)
library(dplR)

# set image image
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/345334_crop.jpg"

# read image from disk
img_345334 <- ring_read(img, dpi = 345)

# detect rings 
rings_345334 <- ring_detect(img_345334, seg = 4, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

# make a dataframe
meas_345334 <- ring_calculate(ring.data = rings_345334, seriesID = 345334)

# export to .rwl 
meas_345334 <- write.rwl(rwl.df = meas_345334, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/345334_meas.rwl", format = "tucson")


