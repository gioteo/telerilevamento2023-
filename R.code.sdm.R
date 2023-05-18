#Species Disribution Modelling

install.packages("sdm")
library(sdm)

library(rgdal) # Species

library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm")

file   # serve a vedere il pecorso per avere i dati

species <- shapefile(file)
species

# "occorenza" è la presenza o meno di una specie,   1 è presente 0 è assente 
