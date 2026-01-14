# 345334 TREE ANALYSIS 

# load libs
library(MtreeRing)
library(dplR)

# set image image
img <- "/Users/alyssabernard/Documents/GitHub/fl-dendro/analysis/images/345334_crop.jpg"

# read image from disk
img_345334 <- ring_read(img, dpi = 345)

# detect rings 
rings_345334 <- ring_detect(img_345334, seg = 4, method = "lineardetect", sample.yr = 2024)


