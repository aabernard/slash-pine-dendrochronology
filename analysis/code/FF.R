# FOOD FOREST RING ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/ff_crop.jpg"

# read image from disk
img_ff <- ring_read(img, dpi = 343)

# detect rings 
rings_ff <- ring_detect(img_ff, seg = 4, method = "lineardetect", sample.yr = 2025) 

# make a dataframe
meas_ff <- ring_calculate(ring.data = rings_ff, seriesID = "ff")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_ff, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/ff_meas.rwl", format = "tucson")
