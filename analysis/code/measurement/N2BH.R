# NEXT TO BOAT HOUSE RING MEASUREMENT
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/n2bh_crop.jpg"

# read image from disk
img_n2bh <- ring_read(img, dpi = 340)

# detect rings 
rings_n2bh <- ring_detect(img_n2bh, seg = 7, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

# remove false rings
rem_n2bh <- ring_modify(rings_n2bh, del = c(140:136, 134, 133, 132:130, 128:126, 124:122, 120:118, 116:114, 110))

# add missed rings
add_n2bh <- ring_modify(rem_n2bh, add = TRUE)

# make a dataframe
meas_n2bh <- ring_calculate(ring.data = rings_n2bh, seriesID = "n2bh")

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_n2bh, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/n2bh_meas.rwl", format = "tucson")
