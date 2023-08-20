#Classification fo remote sensing data via Rstoolbox

#Instaling devtools
#installing.packages("devtools")

install.packages("devtools")
library(devtools)

# devtools :: 
install_github("bleutner/RStoolbox")
library(RStoolbox)


# questa parte ora non ci serve piu 

library(raster)
setwd("C:/lab/")

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")  # a istogramma

#classifing the solar data

# 1 (passaggio)trsformare l'immagine in un tabulato con tutti i colori, la funzione getValues prende i valori da un immagine e li mette in u formato tabulare

singlenr <- getValues(so)   #riporto tutte le rifrattanze delle bande in numeri
singlenr

# 2 passaggio classify    funzione kmeans     raggruppo i pixel (in "nuvole") basandosi sulla media, facendo una media x e y della posizione dei pixel, chiamato centroide e trovo la posizione e osservo la distanza per ogni pixel?????

kcluster <- kmeans(singlenr, centers= 3)    # numero di classi che vogliamo = 3      
kcluster


# set values (3 passaggio)  mi riposta i dati nel formato immagine,    la funzione porta i dati in un formato raster 

socclass <- setValues(so[[1]], kcluster$cluster)                                #usiamo solo la prima banda come stampo per mettere i colori di classificazione, unimao il pezzo kcluster con cluster che è al suo interno con $
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(socclass, col=cl)


#class 1:higher energy level
#class 2:medium energy level          non so se è giusto, dovrebbe essere ma non so         
#class 3: lower energy level 

frequencies <- freq(socclass)
frequencies                                   #  2221440 numero totale pixel

tot = 2221440
percentages = frequencies * 100 /tot                 #vedo le percentuali di pixel per ogni classe 

#class 1:higher energy level   41%
#class 2:medium energy level  37,9%       #questo me lo calcola R                 
#class 3: lower energy level 21%









parte meglio 





library(raster)
# install.packages("RStoolbox")
# library(RStoolbox)

setwd("C:/lab/") # Windows


# data import
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# Classifying the solar data

# https://rspatial.org/raster/rs/4-unsupclassification.html

# 1. Get all the single values
singlenr <- getValues(so)
singlenr
#
# set.seed(99)

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# set.seed can be used for repeating the experiment in the same manner for N times
# http://rfunction.com/archives/62

####

# day 2 Grand Canyon

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# rosso = 1
# verde = 2
# blu = 3

plotRGB(gc, r=1, g=2, b=3, stretch="lin")

# change the stretch to histogram stretching
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# classification

# 1. Get values
singlenr <- getValues(gc)
singlenr

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values
gcclass <- setValues(gc[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)

frequencies <- freq(gcclass)
tot = 58076148
percentages = frequencies * 100 /  tot

# Exercise: classify the map with 4 classes












