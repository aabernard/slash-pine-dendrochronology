# MAMA G'S RING ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/mg_crop.jpg"

# read image from disk
img_mg <- ring_read(img, dpi = 340)

# detect rings 
rings_mg <- ring_detect(img_mg, seg = 4, method = "lineardetect", sample.yr = 2025)

# make a dataframe
meas_mg <- ring_calculate(ring.data = rings_mg, seriesID = "mg")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_mg, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/mg_meas.rwl", format = "tucson")
