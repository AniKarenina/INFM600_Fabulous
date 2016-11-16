# R script for Q3: how strongly/feebly the station location play a role in bike trips

# read the file
R <- read.csv(file.choose()) 
# install the relative package
install.packages("geosphere") 
install.packages("data.table")
library(geosphere)
library(data.table)
?Sattach(R)

# calculate the distance between two groups of long and lat and add the distance into the table
# This is the linear distance based on long and lat. We will try to connect Google MAp API and calculate the route distance in the later
setDT(R)[, distance_hav := distHaversine(matrix(c(R$start_long, R$start_lat), ncol = 2), matrix(c(R$end_long, R$end_lat), ncol = 2))]  
# output the table
write.table(R,'distance.txt',quote=FALSE,sep="\t")
#calculate the corrlaton efficient between distance and ridership
cor.test(R$Ridership,R$distance_hav)

#calculate the mean of distance between start station and end station
mean(R$distance_hav)
#calculate the Standard deviation of distance between group of start station and end station
sd(R$distance_hav)
#calcualte the mean of Ridership for groups of start station and end station
mean(R$Ridership)
#calcualte the stanard deviation of ridership for groups of start station and end station
sd(R$distance_hav)

# do a basic histogram and QQ plot of ridership per group of start station and end station
hist(R$Ridership)
qqnorm(R$Ridership)
qqline(R$Ridership)

# do a basic histogram and QQ plot of distance between group of start station and end station
qqnorm(R$distance_hav)
qqline(R$distance_hav)