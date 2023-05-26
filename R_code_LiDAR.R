#3D in R

setwd("C:/lab/dati")
library(raster)
library(ggplot2)
library(viridis)


dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013

# abbiamo creato un dataframe 
dsm_2013d <- as.data.frame(dsm_2013, xy = T)
head(dsm_2013d)

ggplot() +
geom_raster(dsm_2013d, mapping = aes(x=x, y=y, fill= X2013Elevation_DigitalElevationModel.0.5m))+
scale_fill_viridis() +
ggtitle("dsm_2013)


dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")


