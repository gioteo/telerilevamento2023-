# R ocde for downloading and visualizing Copernicus data

# 1- Packages
# install.packages("ncdf4")
library(ncdf4)
library(raster)

# 2- Working directory
setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# 3- Importing imagery
sc <- raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")

# 4- Plotting the image
plot(sc)
