# BIG TREE TWO TREE PROBLEM ANALYSIS
# 
#  load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/btp_crop.jpg"

# read image from disk
img_BTP <- ring_read(img, dpi = 348)

# detect rings 
rings_BTP <- ring_detect(img_BTP, seg = 4, method = "lineardetect", sample.yr = 2024)

# make a dataframe
meas_BTP <- ring_calculate(ring.data = rings_BTP, seriesID = 345371)

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_345346, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/345346_meas.rwl", format = "tucson")
