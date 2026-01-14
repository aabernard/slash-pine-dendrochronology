# PARKING PINE RING MEASUREMENT
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/pp_crop.jpg"

# read image from disk
img_pp <- ring_read(img, dpi = 343)

# detect rings 
rings_pp <- ring_detect(img_pp, seg = 4, method = "lineardetect", sample.yr = 2025)

# make a dataframe
meas_pp <- ring_calculate(ring.data = rings_pp, seriesID = "pp")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_pp, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/pp_meas.rwl", format = "tucson")
