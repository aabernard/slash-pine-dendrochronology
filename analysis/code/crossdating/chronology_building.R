# load libs
library(dplR)

# combine the dated series 
dated_files <- c("analysis/output/cl2_meas.rwl", "analysis/output/ff_meas.rwl", "analysis/output/lp_meas.rwl", "analysis/output/mg_meas.rwl")
dated_list <- lapply(dated_files, read.rwl)
dated_rwl <- combine.rwl(dated_list)


# combine the floating series
floating_files <- c("analysis/output/345334_meas.rwl", "analysis/output/345346_meas.rwl", "analysis/output/btp_meas.rwl", 
                    "analysis/output/cl1_meas.rwl", "analysis/output/cr_meas.rwl", "analysis/output/ft_meas.rwl", "analysis/output/ltp_meas.rwl",
                    "analysis/output/n2bh_meas.rwl", "analysis/output/pp_meas.rwl")
floating_list <- lapply(floating_files, read.rwl)




