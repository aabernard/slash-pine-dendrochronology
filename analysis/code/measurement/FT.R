# FAV TREE RING ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/ft_crop.jpg"

# read image from disk
img_ft <- ring_read(img, dpi = 340)

# detect rings 
rings_ft <- ring_detect(img_ft, seg = 4, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

# make a dataframe
meas_ft <- ring_calculate(ring.data = rings_ft, seriesID = "ft")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_ft, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/ft_meas.rwl", format = "tucson")

