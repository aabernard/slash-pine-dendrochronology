# BIG TREE TWO TREE PROBLEM ANALYSIS
# 
#  load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/btp_crop.jpg"

# read image from disk
img_btp <- ring_read(img, dpi = 340)

# detect rings 
rings_btp <- ring_detect(img_btp, seg = 7, method = "lineardetect", sample.yr = 1000)

# make a dataframe
meas_btp <- ring_calculate(ring.data = rings_btp, seriesID = "btp")

# export to .rwl 
meas_btp <- write.rwl(rwl.df = meas_btp, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/btp_meas.rwl", format = "tucson")
