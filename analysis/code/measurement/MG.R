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
meas_mg <- write.rwl(rwl.df = meas_mg, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/mg_meas.rwl", format = "tucson")

# TRYING AGAIN BECAUSE PHONE CAMERA SUCKS
library(magick)

# stitching image files from microscope together
image_files_mg <- c(
  "analysis/images/mg_2/mg_01.jpg", 
  "analysis/images/mg_2/mg_02.jpg", 
  "analysis/images/mg_2/mg_03.jpg",
  "analysis/images/mg_2/mg_04jpg",
  "analysis/images/mg_2/mg_05.jpg",
  "analysis/images/mg_2/mg_06.jpg",
  "analysis/images/mg_2/mg_07.jpg",
  "analysis/images/mg_2/mg_08.jpg"
)

# read images
imgs <- image_read(image_files_mg)

# append images
full_core <- image_append(imgs, stack = FALSE)

# save full sequence
image_write(full_core, "mg_full.jpg")

img <- image_read("analysis/images/mg_2/mg_full_cropped.jpg")

img_enhanced <- image_normalize(img)

img_enhanced <- image_modulate(img, brightness = 150)

image_write(img_enhanced, "analysis/images/mg_2/mg_full_enhanced.jpg")

img4 = "analysis/images/mg_2/mg_full_enhanced.jpg"

img4  <- ring_read(img4, dpi = 1016)

t1 <- ring_detect(img4, seg = 19, method = 'lineardetect')

img_mg_1 <- ring_read(img_1, dpi = 1016)

rings_mg_1 <- ring_detect(img_mg_1, seg = 3, method = "lineardetect", sample.yr = 1000) # FLOATING CHRONOLOGY

rem_rings_mg_1 <- ring_modify(rings_mg_1, del = c(76:72, 68, 65, 62, 61, 55, 53, 28, 21, 19))

add_rings_mg_1 <- ring_modify(rem_rings_mg_1, add = TRUE) # added marker @ pixel 212 

meas_rings_mg_1 <- ring_calculate(add_rings_mg_1, seriesID = mg)

meas_rings_mg_1

meas_mg <- write.rwl(rwl.df = meas_rings_mg_1, fname = "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/output/output_2/mg_meas_2.rwl", format = "tucson")
