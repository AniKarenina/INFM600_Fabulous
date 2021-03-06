#All datasets using in R script could be found in Github:/INFM600_Fabulous/INFM600_0201_Fabulous_DataSet 
#R script for Research Question #1:how do the weather conditions effect bike trips?
#read the file
data = read.csv("C:\\Users\\masage\\Desktop\\WeatherRide.csv")

#view the column names
head(data)

#correlation test between temperature and ridership
cor.test(data$mean_temperature, data$rides)

#correlation test between dew point and ridership
cor.test(data$mean_dew, data$rides)

#Multiple Linear Regression
m = lm(rides ~ mean_temperature + mean_dew, data = data)
summary(m)

#test of assumptions

#compute correlations between IVs to check for multicollinearity
cor.test(data$mean_temperature, data$mean_dew)
#the result violates the assumption that there should be no relationship between IVs. 

#plot each IV against the DV to check for non-linearity
plot(data$mean_temperature, data$rides)
plot(data$mean_dew, data$rides)

#check for outliers (Residuals vs Fitted)
plot(lm(rides ~ mean_temperature + mean_dew, data = data))
#there are 3 outliers that are more than 3 standard deviations away

#create a histogram of residuals to check for non-normality of error
resid = m$residuals
hist(resid)
#residuals are normally distributed, which does not violate the assumption




#Rscript for Research Question #2: what are the peak hours on bike trips in a day

#read the file naming "INFM600_0201_Fabulous_RidershipPerHour.csv"
#the dataset genereate by aggregating data per hour
q = read.csv(file.choose())

#show the basic structure of the dataset
head(q)

#basic desscriptive statistics, like mean and SD
mean(q$Ridership)
sd(q$Ridership)

#do a basic plot for the trends of picking up bikes in time of aday
plot(q$Hour,q$Ridership,main="the trends of picking up bike in a day", xlab="The time of a day",ylab="Ridership",type="s")

#read the file naming "INFM600_0201_Fabulous_RidershipPerDatePerHour.csv"
#the dataset generated by aggreagating data per date per hour
p = read.csv(file.choose())
attach(p)

#show the basic structure of the dataset
head(p)

#convert the numeric variables to factor/levels
p$Category_ID = factor(p$Category_ID)

#loading the car package
library(car)
#test the homogeneity of variance
leveneTest(p$Ridership~p$Category_ID,p)
#However, after testing the assumption of homogeneity of variance, we found that our dataset violates this assumption

#perform ANOVA
panova=aov(p$Ridership~p$Category_ID,data=p)
summary(panova)

#perform pairwise t-test
pairwise.t.test(p$Ridership,p$Category_ID,p.adj="bonferroni")



# R script for Q3: how strongly/feebly the station location play a role in bike trips

# read the file
R <- read.csv("INFM600_0201_Fabulous_DataSet\\INFM600_0201_Fabulous_DistanceBetweenStartAndEnd.txt") 
# install the relative package

library(geosphere)
library(data.table)
attach(R)

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




#R script for Research Question #4:how do the national holidays impact the bike ride counts?
#Read the file naming "INFM600_0201_Fabulous_RidershipPerDate_holiday.csv"
h = read.csv(file.choose())
head(h)

#subset records based on whether the date is holiday or not
h.holiday=subset(h,h$DayType=="Yes")
h.nonholiday=subset(h,h$DayType=="No")

#calculate the mean of Ridership on holiday and non-holiday
mean(h.holiday$Ridership)
mean(h.nonholiday$Ridership)

#calcualte the SD of Ridership on holiday and non-holiday
sd(h.holiday$Ridership)
sd(h.nonholiday$Ridership)

#check the normality of these two data groups
hist(h.holiday$Ridership)
hist(h.nonholiday$Ridership)
qqnorm(h.holiday$Ridership)
qqline(h.holiday$Ridership)
qqnorm(h.nonholiday$Ridership)
qqline(h.nonholiday$Ridership)

#if the above test for normality is right and the distribution will be normal,we will 
#perform two sample t-test
t.test(h$Ridership~h$DayType,data=h)

