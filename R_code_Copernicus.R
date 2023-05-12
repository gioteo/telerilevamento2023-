# R code for dowloding and visualizing Copernicus data 

install.packages("ncdf4")
library(ncdf4)
library(ratser)

setwd("C:/lab/")

# dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc  


sc <-raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")
plot(sc)

#with the raster package -> RasterLayer


ggplot() +
+ geom_raster(sc, mapping = aes(x=x, y=y, fill = 
