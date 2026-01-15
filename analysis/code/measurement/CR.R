# CAPLES TWIN PINE RING ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/cr_crop.jpg"

# read image from disk
img_cr <- ring_read(img, dpi = 340)

# detect rings 
rings_cr <- ring_detect(img_cr, seg = 4, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY, TO BE CROSSDATED

# make a dataframe
meas_cr <- ring_calculate(ring.data = rings_cr, seriesID = "cr")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_cr, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/cr_meas.rwl", format = "tucson")
