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
