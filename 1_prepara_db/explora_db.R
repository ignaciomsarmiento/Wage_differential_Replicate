# # -----------------------------------------------------------------------
# Wage Differentials  -----------------------------------------------------
# Author: Ignacio Sarmiento-Barbieri --------------------------------------
# # -----------------------------------------------------------------------


#Load Packages
pkg<-list("here","tidyverse","haven","ggplot2")
lapply(pkg, library, character.only=T,verbose=FALSE, quietly = TRUE)
rm(pkg)



# Dta  -------------------------------------------------------------
M<-read_csv(here("../Wage_differential/data_o","data_occ_201810_fullsample.csv"))

d_y<-M[,3]
d_pop2k<-M[,4]
d_p<-log(d_pop2k)

d_f<-M[,5:18]
d_d<-M[,19:82]

d_flag = M[,1]
d_city = unique(d_flag)


require("lfe")

reg<-felm(d_y~d_d+d_f|factor(d_flag))

