#How to measure landscape variability with R

library(raster)  # or require()
library(patchwork)
library(ggplot2)

setwd("C:/lab/")

sen <- brick("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

plotRGB(sen, 1,2,3, stretch = "Lin") 
plotRGB(sen, 2,1,3, stretch = "Lin") 

# standard deviation on the NIR band

nir <- sen[[1]]
mean3 <- focal(nir,matrix(1/9, 3, 3), fun=mean)    # matrix function 

plot(mean3)

sd3 <- focal(nir,matrix(1/9, 3, 3), fun=sd) 
plot(sd3)



sd3d <- as.data.frame(sd3, xy=TRUE)
sd3d

ggplot() +
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) +        # x corrisponde alla x dell'immagine, y corrisponde a y dell'immagine, fill corrisponde al nome
ggtitle("standard deviation moving window 3x3")      

# darà errore 



sd3d <- as.data.frame(sd3, xy=TRUE)
sd3d

ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +        # x corrisponde alla x dell'immagine, y corrisponde a y dell'immagine, fill corrisponde al nome
ggtitle("standard deviation moving window 3x3")  


# using viridis

install.packages("viridis")
library(viridis)

ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation by viridis package")

# cividis
ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "cividis") +
ggtitle("Standard deviation by viridis package")

# magma
ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package")

# patchwork
p1 <- ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation by viridis package")

p2 <- ggplot() +
geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package")

