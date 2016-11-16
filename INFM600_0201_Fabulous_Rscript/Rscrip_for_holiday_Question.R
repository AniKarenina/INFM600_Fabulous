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

