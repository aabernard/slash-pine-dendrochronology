# LITTLE TREE TWO TREE PROBLEM 
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/ltp_crop.jpg"

# read image from disk
img_ltp <- ring_read(img, dpi = 343)

# detect rings 
rings_ltp <- ring_detect(img_ltp, seg = 4, method = "lineardetect", sample.yr = 2025) # FLOATING CHRONOLOGY

# make a dataframe
meas_ltp <- ring_calculate(ring.data = rings_ltp, seriesID = "ltp")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_ltp, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/ltp_meas.rwl", format = "tucson")
