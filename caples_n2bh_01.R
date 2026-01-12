library(MtreeRing)

# load in cropped image
n2bh <- "IMG_5932_1.tiff"

# what does this do?
cap_n2bh_01 <- ring_read(img = n2bh, 
            dpi = 375.9)


# detect rings using linear detection algo
cap_n2bh_01 <- ring_detect(ring.data = cap_n2bh_01, 
            seg = 5, method = "lineardetect", 
            sample.yr = 2024)

# remove false positives
cap_n2bh_02 <- ring_modify(cap_n2bh_01,
              del = c(201:199, 197:196, 194:190, 
                      188:187, 185:180, 178:175, 
                      173:169, 166:162, 160:158, 
                      156, 154, 152, 150, 148, 
                      146:144, 142:141, 139, 137, 
                      134, 131, 129:127, 
                      125, 124:122, 120, 119, 
                      117, 116, 114, 112:110, 108,
                      105, 104, 101, 98, 95, 75, 73,
                      71, 61, 59:57, 55:53, 51:49, 45, 43, 27, 24))

# add missing rings using interactive plotting method
# WILL NOT WORK IN POSITRON, ONLY RSTUDIO
cap_n2bh_02 <- ring_modify(cap_n2bh_02, 
            add = TRUE)

cap_n2bh_03 <- ring_modify()

# double check additions worked
data.frame(
  Year = attr(cap_n2bh_02, "year"),
  Pixel = attr(cap_n2bh_02, "bor.col")
)

# convert ring boundaries into width measurements
cap_n2bh_meas <- ring_calculate(cap_n2bh_02, seriesID = "n2bh")
cap_n2bh_meas

# write to .rwl 
library(dplR)
cap_n2bh_meas.rwl <- tempfile(fileext = ".rwl")
write.rwl(rwl.df = cap_n2bh_meas, fname = cap_n2bh_meas.rwl, format = "tucson")

# comparing the algorithmic measurements with my mechanical caliper, the dpi is wrong (algo measurements show 5.06mm for 1906, while caliper shows 7.62 mm)
# GEMINI 3 PRO suggested this solution

# 1. Update the DPI to 250
attr(cap_n2bh_02, "x.dpi") <- 250

# 2. Recalculate all ring widths with the new scale
cap_n2bh_final_measurements <- ring_calculate(cap_n2bh_02, seriesID = "n2bh")

# 3. Verify: Year 1906 should now be exactly 7.62 mm
View(cap_n2bh_final_measurements)

# 1906 is correct, but now 1907 is off 


