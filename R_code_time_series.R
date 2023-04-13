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

TGr <- stack(import)
TGr

plot(TGr)

plotRGB(TGr, r = 1, g = 2, b = 3, stretch = "lin")                       
plotRGB(TGr, r = 2, g = 3, b = 4, stretch = "lin")                       

dift <- TGr[[2]] - TGr[[1]]
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)


# Nuovo studio. scaricato i dati della cartela En per fare una analisi multitemporale delle emissioni di ossidi di azoto in europa

# lezione 13 aprile    Exercise 2 
library (raster)
setwd("C:/lab/EN")

# importing a file 

en_first <- raster("EN_0001.png")
en_first

cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(en_first, col=cl)

rlist <- list.files(pattern="EN") # faccio una lista 
rlist

import <- lapply(rlist, raster) # importiamo tutti e i 13 file 
import

TGr <- stack(import)  # comprimo tutti e i 13 file 
TGr

plot(TGr, col=cl)

# check

par(mfrow=c(1,2))
plot(en_first, col=cl)
plot(EN[[1]], col=cl)


