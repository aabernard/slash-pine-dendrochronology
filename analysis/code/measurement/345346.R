# 345346 TREE RING ANALYSIS
# 
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/345346_crop.jpg"

# read image from disk
img_345346 <- ring_read(img, dpi = 340)

# detect rings 
rings_345346 <- ring_detect(img_345346, seg = 8, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY
 
# make a dataframe
meas_345346 <- ring_calculate(ring.data = rings_345346, seriesID = 345346)

# export to .rwl 
meas_345346 <- write.rwl(rwl.df = meas_345346, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/345346_meas.rwl", format = "tucson")

# TRYING AGAIN BECAUSE PHONE CAMERA SUCKS
library(magick)

# stitching image files from microscope together
image_files <- c(
  "analysis/images/345346_f/345346_01.jpg", 
  "analysis/images/345346_f/345346_02.jpg", 
  "analysis/images/345346_f/345346_03.jpg",
  "analysis/images/345346_f/345346_04.jpg",
  "analysis/images/345346_f/345346_05.jpg"
)

# read images
imgs <- image_read(image_files)

# append images
full_core <- image_append(imgs, stack = FALSE)

# save full sequence
image_write(full_core, "345346_full.jpg")

img_1 <- "analysis/images/345346_f/345346_full_cropped.jpg"

img_345346_1 <- ring_read(img_1, dpi = 1016)

rings_345346_1 <- ring_detect(img_345346_1, seg = 8, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

rem_rings_345346_1 <- ring_modify(rings_345346_1, del = c(76:72, 68, 65, 62, 61, 55, 53, 28, 21, 19))

add_rings_345346_1 <- ring_modify(rem_rings_345346_1, add = TRUE) # added marker @ pixel 212 

meas_rings_345346_1 <- ring_calculate(add_rings_345346_1, seriesID = 345346)

meas_rings_345346_1

meas_345346 <- write.rwl(rwl.df = meas_rings_345346_1, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/output_2/345346_meas_2.rwl", format = "tucson")
