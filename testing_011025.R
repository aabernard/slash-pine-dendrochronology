# testing measuRing

library(measuRing)

# load image
img <- "IMG_5932_1.tiff"

# first pass
dt_1 <- ringDetect(img, segs = 3, ppi = 375.9)

# pretty good, but many false positives and negatives present

# second try with increased contrast and brightness
img1 <- "IMG_5932_2.tiff"

dt_2 <- ringDetect(img1, segs = 3, ppi = 375.9)

# arguably worse

# this could be because i'm using an iphone and not a scanner, measuRing will need to be tuned to what the iphone sees
# ppi calculations could be wrong also. the ruler and the sample do not sit on the same plane (about a 2-3 mm difference)

# some solutions wouid include: fine tuning in the gui that lets you edit the detected ring boundaries
# or use imageTogray() first to create the gray matrix outside of the ringDetect()

img_gray <- imageTogray(img, ppi = 375.9)

dt_3 <- ringDetect(img_gray, segs = 3)

# nothing changes when using imageTogray(), let's use the gui

dt_4 <- ringDetect(img, segs = 5, ppi = 375.9)

dt_4 <- ringSelect(dt_4)

# the gui does not want to open, maybe a positron issue?
# when opened in Rstudio, I could get the gui to start but actually moving the markers was immpossible
# maybe I need to switch IDEs? 

