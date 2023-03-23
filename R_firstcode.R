# My first code in Git Hub
#Let's install the raster package

install.packages("raster")

library(raster)

# Import data, setting the working directory
# setwd("C:/lab/") #windows

l2011 <- brick("p224r63_2011_masked.grd") # Ho assegnato brick a un nome (2011)

#plotting the data

plot(l2011) # le varie bande nel plot rilettono delle lunghezze d'onda es. B1 riflettanza blu, B2 riflette verde....

cl <- colorRampPalette(c("red", "orange", "yellow")) (100)                   #100 sono le sfumature


plot(l2011, col=cl)

#plotting one element      seleziono solo il 4 elemento
plot(l2011[[4]], col=cl)

plot(l2011$B4_sre, col=cl)   # si utlizza il dollaro per legare due cose, in questo caso la banda 4

nir <- l2011[[4]]    # o nir <- l2011$B4_sre
plot(nir, col=cl)

# lezione 17 marzo

# RGB plotting    colori rosso verde blu
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")  # Ho cambiato banda di riflessione, così ho slittato di una banda quelli precedenti, così che si possa vedere la banda dell' infrarosso
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")  # ho messo l'infrarosso nella banda verde
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")
# Multiframe with natural and false colours
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")


# Histogram stretching
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

# Linear vs. Histogram stretching
par(mfrow=c(2,1))
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

#lezione 23 marzo
# exercise;plot the NIR bond, è un ripasso della scorsa volta, si dicono le stesse cose

plot(l2011[[4]])

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")     #fino a qua cose gia scritte sopra

#exercise: import the 1988 image

l1988 <- brick("p224r63_1988_masked.grd")

#Exercise: plot in RGBspace (natural colours)

plotRGB(l1988, r=3, g=2, b=1, stretch="lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l1988, 4, 3, 2, stretch="lin")  #è la stessa cosa anche senza mettere r, g, b


#multiframe 

par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")

dev.off()  # per chiudere il device (l'immagine raffiguata da i passaggi prima)

plotRGB(l1988, r=4, g=3, b=2, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

#multiframe x 4 immagini
par(mfrow=c(2,2))
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")



