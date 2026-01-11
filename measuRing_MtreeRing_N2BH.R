# load lib
library(measuRing)

# read in image
n2bh <- "IMG_5932_1.tiff"

# create gray matrix
n2bh_gray <- imageTogray(n2bh, ppi = 375.9)

# open quartz to access interactive plots, GEMINI 3 PRO SOLUTION
# doesn't work
quartz()

# detect rings
det_n2bh <- ringDetect(n2bh_gray, segs = 5, ppi = 375.9)

# manual correction for misplaced markers
sel_n2bh <- ringSelect(det_n2bh)

# GUI is unreliable on Positron and RStudio

# going to try MtreeRing
library(MtreeRing)
library(dplyr)

img_path <- "IMG_5932_1.tiff"

t1 <- ring_read(img = img_path, dpi = 375.9)

t2 <- ring_detect(ring.data = t1, seg = 5, method = "lineardetect")

rwn2bh <- ring_calculate(ring.data = t2, seriesID = "n2bh")

ring_app_launch()

# it works about the same as measuRing's, the gui correction still doesn't work properly. In the Shiny App, the ring detection won't even work at all
# so I am going to use MtreeRing's detection (more options than measuRing) and then update manually with code (instead of point and click)

mtr_n2bh <- ring_read(img = img_path, 
            dpi = 375.9, 
            plot = T, 
            magick = T)

mtr_det_n2bh <- ring_detect(ring.data = mtr_n2bh,
                seg = 7,
                method = "lineardetect", 
                sample.yr = 2024)

# start easy with removals at the wide, earliest rings (section 7-5)
mtr_rem_n2bh <- ring_modify(mtr_det_n2bh,
                del = c(201:199, 197:196, 194:190, 
                        188:187, 185:180, 178:175, 
                        173:169, 166:162, 160:158, 
                        156, 154, 152, 150, 148, 
                        146:144, 142:141, 139, 137, 
                        134, 131, 129:127, 
                        125, 124:122, 120, 119, 
                        117, 116, 114, 112:110, 108))

# rings get narrower around this point so markers are more difficult to see,
# and there are missed rings that will have to be corrected (section 4-1)
mtr_rem_n2bh <- ring_modify(mtr_rem_n2bh, 
                del = c(105, 104, 101, 98, 95, 75, 73,
                        71, 61, 59:57, 55:53, 51:49, 45, 43))

# now to add, but this is honestly so confusing
# it does not work the same as del(), which uses the year markers, instead it uses pixel coordinates
# which are difficult to see on the default plot
mtr_add_n2bh <- ring_modify(mtr_rem_n2bh, 
                add = c(3500))

# this test of adding a new marker at pixel 3500 did nothing
# need to look at the structure of the data
str(mtr_add_n2bh)

# okay lets make a df with marker, year, and pixel coord
data.frame(Year = attr(mtr_rem_n2bh, "year"),
           Pixel = attr(mtr_rem_n2bh, "bor.col"))

mtr_add_n2bh <- ring_modify(mtr_rem_n2bh, 
                             add = c(347, 358))

mtr_add_n2bh # still has 116 markers, confirms add does not work like I think it does
# will solve tomorrow
