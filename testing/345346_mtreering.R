library(MtreeRing)

img <- "IMG_6001_crop.jpg"

img_345346 <- ring_read(img = img, dpi = 840) # DPI on 2x lens, found through GIMP

img_345346 <- ring_detect(ring.data = img_345346, seg = 3, method = "lineardetect", sample.yr = 2024)

# now remove false positives
img_345346 <- ring_modify(img_345346, del = c(69, 70))

img_345346_meas <- ring_calculate(ring.data = img_345346, seriesID = "345346")

img_345346_meas # ITS RIGHT 

# write to .rwl
library(dplR)
caples_345346_meas.rwl <- tempfile(fileext = ".rwl")
write.rwl(rwl.df = img_345346_meas, fname = caples_345346_meas.rwl, format = "tucson")