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


