library(readxl)
library(forecast)
library(seasonal)
library(seasonalview)
library(ggplot2)
library(ggfortify)
library(tseries)

#Import the data
data <- read_xlsx("C:/Desktop/Time series/Ass 1/Deon.xlsx")

#Time series
tsdata = ts(data, start = c(2011,1), frequency = 12)
plot(tsdata)
tsm <- ma(tsdata,order=12)
lines(tsm,col="red")

#check stationarity
m<-Acf(tsdata,lag=180)
autoplot(m) #not stationary
Pacf(tsdata,lag=180)

#Transform to remove variance
log_ts <- log(tsdata)
autoplot(log_ts)

#Differencing
d<-diff(log_ts, lag =1) #remove trends
d<-diff(d, lag =12) #remove seasonality
autoplot(d)

#Augmented Dickey-Fuller test to check for the stationarity
adf_test_result <- adf.test(d, alternative = "stationary")
#display result
print(adf_test_result)

#check stationarity after differencing
Lm<-Acf(d,lag=50)
autoplot(Lm)  #it is stationary
Pacf(d,lag = 50)

#fitting the seasonal ARIMA model
#1
fit1 = Arima(log_ts, order =c(4,1,1), seasonal = c(0,1,0), include.constant = FALSE)
summary(fit1)
checkresiduals(fit1)

#2
fit2 = Arima(log_ts, order =c(4,1,1), seasonal = c(0,1,1), include.constant = FALSE)
summary(fit2)
checkresiduals(fit2)

#3
fit3 = Arima(log_ts, order =c(1,1,1), seasonal = c(0,1,1), include.constant = FALSE)
summary(fit3)
checkresiduals(fit3)

#Forecast 1 year ahead
forecasts <- forecast(fit3, h=12)  
plot(forecasts)
