//read the file
data = read.csv("C:\\Users\\masage\\Desktop\\WeatherRide.csv")

//view the column names
head(data)

//correlation test between temperature and ridership
cor.test(data$mean_temperature, data$rides)

//correlation test between dew point and ridership
cor.test(data$mean_dew, data$rides)

//Multiple Linear Regression
m = lm(rides ~ mean_temperature + mean_dew, data = data)
summary(m)


//test of assumptions

//compute correlations between IVs to check for multicollinearity
cor.test(data$mean_temperature, data$mean_dew)
//the result violates the assumption that there should be no relationship between IVs. 

//plot each IV against the DV to check for non-linearity
plot(data$mean_temperature, data$rides)
plot(data$mean_dew, data$rides)

//check for outliers (Residuals vs Fitted)
plot(lm(rides ~ mean_temperature + mean_dew, data = data))
//there are 3 outliers that are more than 3 standard deviations away

//create a histogram of residuals to check for non-normality of error
resid = m$residuals
hist(resid)
//residuals are normally distributed, which does not violate the assumption