# NEXT TO BOAT HOUSE RING MEASUREMENT
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/n2bh_crop.jpg"

# read image from disk
img_n2bh <- ring_read(img, dpi = 343)

# detect rings 
rings_n2bh <- ring_detect(img_n2bh, seg = 7, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

# make a dataframe
meas_n2bh <- ring_calculate(ring.data = rings_n2bh, seriesID = "n2bh")

# NEEDS MODIFICATIONS

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_n2bh, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/n2bh_meas.rwl", format = "tucson")
