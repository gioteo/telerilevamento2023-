# R code for dowloding and visualizing Copernicus data 

install.packages("ncdf4")
library(ncdf4)
library(ratser)

setwd("C:/lab/")

# dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc  


sc <-raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")
plot(sc)

# with the raster package -> RasterLayer
# With the terra package -> SpatRaster

scd <- as.data.frame(sc, xy= T)       # trasformo il dato raster in un dato tabellare
scd

ggplot() +                                            
+ geom_raster(scd, mapping = aes(x=x, y=y, fill = Surface.Soil.Moisture))
ggtitle("Surface.Soil.Moisture")        #ci serve una geometria raster


#cropping an image

ext <- c(23, 30, 62, 68)  # predno le coordinate dal plott della mappa   
sc.crop <- crop(sc, ext)

extension <- crop(s, ext)

#exercise: plot via ggplot the cropped image

sc.crop.d <- as.data.frame(sc, xy= T)
head(sc.crop.d)
names(sc.crop.d)

ggplot() +                                            
geom_raster(sc.crop.d, mapping = aes(x=x, y=y, fill = Surface.Soil.Moisture))+
ggtitle("Surface.Soil.Moisture")  

