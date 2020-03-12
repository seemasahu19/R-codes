

######## Arimaxxx ############

setwd("D:/AP/Forecasting")

require(ggplot2)
require(gridExtra)
df = read.csv("Icecream.csv")
head(df)

icecreamts = ts(df$cons)

plot.ts(icecreamts)

icecream.arima = auto.arima(icecreamts)

icecream.arima

acf(icecreamts)
pacf(icecreamts)

p1 = ggplot(df, aes(x = X, y = cons)) +
  ylab("Consumption") +
  xlab("") +
  geom_line() +
  expand_limits(x = 0, y = 0)
p2 = ggplot(df, aes(x = X, y = temp)) +
  ylab("Temperature") +
  xlab("") +
  geom_line() +
  expand_limits(x = 0, y = 0)
p3 = ggplot(df, aes(x = X, y = income)) +
  ylab("Income") +
  xlab("Period") +
  geom_line() +
  expand_limits(x = 0, y = 0)
grid.arrange(p1, p2, p3, ncol=1, nrow=3)

##### forecast using arima 

require(forecast)
fit_cons = auto.arima(df$cons)
fcast_cons = forecast(fit_cons, h = 6)

plot(fcast_cons)
accuracy(fit_cons)

####  Arimax model with one variable 
fit_cons_temp = auto.arima(df$cons, xreg = df$temp)
fcast_temp = c(70.5, 66, 60.5, 45.5, 36, 28)
fcast_cons_temp = forecast(fit_cons_temp, xreg = fcast_temp, h = 6)
plot(fcast_cons_temp)

accuracy(fit_cons_temp)
summary(fit_cons_temp)

x = as.matrix( df[, 3:5])
##  arimax model with all vars 
fit_cons_temp_all = auto.arima(df$cons, xreg = x)


accuracy(fit_cons_temp_all)


summary(fit_cons_temp_all)
summary(fit_cons)

acf(fit_cons$residuals)

library(car)
durbinWatsonTest(fit_cons, max.lag = 1)

?durbinWatsonTest
?Box.test
Box.test(fit_cons$residuals, lag=20, type="Ljung-Box")
library(car)

Box.test(fit_cons_temp_all$residuals, lag=20, type="Ljung-Box")

### auto correlations of residuals 
acf(fit_cons$residuals)
hist(fit_cons$residuals)


