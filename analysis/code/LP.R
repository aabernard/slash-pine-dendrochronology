# LONE PINE ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/lp_crop.jpg"

# read image from disk
img_lp <- ring_read(img, dpi = 343)

# detect rings 
rings_lp <- ring_detect(img_lp, seg = 4, method = "lineardetect", sample.yr = 2025)

meas_lp <- ring_calculate(ring.data = rings_lp, seriesID = "lp")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_lp, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/lp_meas.rwl", format = "tucson")
