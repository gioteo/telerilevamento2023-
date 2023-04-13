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
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
