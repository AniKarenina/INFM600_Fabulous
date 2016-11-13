R <- read.csv(file.choose()) # read the file
install.packages("geosphere") # install the package
library(geosphere)
install.packages("data.table")
library(data.table)
attach(R)
setDT(R)[, distance_hav := distHaversine(matrix(c(R$start_long, R$start_lat), ncol = 2),
                                         matrix(c(R$end_long, R$end_lat), ncol = 2))]  # calculate the distance between two long and lat
                                                                                      # and add the distance into the table
write.table(R,'test123.txt',quote=FALSE,sep="\t")
cor.test(R$Ridership,R$distance_hav) #calculate the corrlaton efficient
summary(R$Ridership)
