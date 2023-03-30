# R code for importing and anylizing several images

library(raster)
setwd("C:/lab/greenland")

lst_2000 <- raster("lst_2000.tif")
plot(lst_2000)

#exercise: import all the data

lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")

ls()


rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist, raster)
import
