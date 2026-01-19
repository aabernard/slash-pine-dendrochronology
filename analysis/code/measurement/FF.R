# FOOD FOREST RING ANALYSIS
#
# load libs
library(MtreeRing)
library(dplR)

# set image path
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/ff_crop.jpg"

# read image from disk
img_ff <- ring_read(img, dpi = 340)

# detect rings 
rings_ff <- ring_detect(img_ff, seg = 4, method = "lineardetect", sample.yr = 2025) 

# make a dataframe
meas_ff <- ring_calculate(ring.data = rings_ff, seriesID = "ff")

# export to .rwl 
meas_ff <- write.rwl(rwl.df = meas_ff, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/ff_meas.rwl", format = "tucson")

# TRYING AGAIN WITH MICROSCOPE PICTURES
library(magick)

# stitching image files from microscope together
image_files <- c(
  "analysis/images/ff_2/ff_01.jpg", 
  "analysis/images/ff_2/ff_02.jpg", 
  "analysis/images/ff_2/ff_03.jpg",
  "analysis/images/ff_2/ff_04.jpg",
  "analysis/images/ff_2/ff_05.jpg",
  "analysis/images/ff_2/ff_06.jpg", 
  "analysis/images/ff_2/ff_07.jpg", 
  "analysis/images/ff_2/ff_08.jpg", 
  "analysis/images/ff_2/ff_09.jpg" 
)

# read images
imgs <- image_read(image_files)

# append images
full_core <- image_append(imgs, stack = FALSE)

# save full sequence
image_write(full_core, "ff_full.jpg")

# read in cropped images
img <- "analysis/images/ff_2/ff_full_cropped.jpg"
img_ff <- ring_read(img, dpi = 1016)

# detect rings 
rings_ff <- ring_detect(img_ff, seg = 6, method = "lineardetect", sample.yr = 1000)

# remove false rings
rem_ff <- ring_modify(rings_ff, del = c(95, 94))
