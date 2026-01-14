# 345346 TREE RING ANALYSIS
# 
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/345346_crop.jpg"

# read image from disk
img_345346 <- ring_read(img, dpi = 340)

# detect rings 
rings_345346 <- ring_detect(img_345346, seg = 4, method = "lineardetect", sample.yr = 2024)

# make a dataframe
meas_345346 <- ring_calculate(ring.data = rings_345346, seriesID = 345346)

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_345346, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/345346_meas.rwl", format = "tucson")
