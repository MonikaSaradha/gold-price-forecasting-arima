# -----------------------------
# Gold Price Forecasting (ARIMA)
# -----------------------------

# Install and load libraries
library(ggplot2)
library(imputeTS)
library(tidyverse)
library(lubridate)
library(zoo)
library(forecast)
library(tseries)
library(readxl)

# -----------------------------
# 1. Load Data
# -----------------------------
# NOTE: Update path to your dataset
stocks <- read_excel("data/gold_data.xlsx")

stocks$Date <- as.Date(stocks$Date)

# -----------------------------
# 2. Data Cleaning
# -----------------------------

# Check missing values
colSums(is.na(stocks))

# Interpolate missing values
numerical_data <- stocks[, c("Price", "Open", "High", "Low")]
interpolated_data <- na.interpolation(numerical_data)

stock_data <- cbind(stocks[, c("Date", "Vol.", "Change %")], interpolated_data)

# -----------------------------
# 3. Visualization
# -----------------------------

ggplot(stock_data, aes(x = Date, y = Price)) +
  geom_line() +
  labs(title = "Gold Price Trend", x = "Date", y = "Price") +
  theme_minimal()

# -----------------------------
# 4. Train-Test Split
# -----------------------------

set.seed(123)
train_index <- sample(1:nrow(stock_data), 0.7 * nrow(stock_data))

train_data <- stock_data[train_index, ]
test_data  <- stock_data[-train_index, ]

# -----------------------------
# 5. Time Series Conversion
# -----------------------------

ts_data <- ts(stock_data$Price, frequency = 365)

# -----------------------------
# 6. Decomposition
# -----------------------------

decomp_add <- decompose(ts_data, type = "additive")
plot(decomp_add)

decomp_mult <- decompose(ts_data, type = "multiplicative")
plot(decomp_mult)

# -----------------------------
# 7. Holt-Winters Model
# -----------------------------

hw_model <- hw(ts_data)
forecast_hw <- forecast(hw_model, h = 12)

plot(forecast_hw)

# -----------------------------
# 8. ARIMA Model
# -----------------------------

arima_model <- auto.arima(ts_data)
summary(arima_model)

# Diagnostic check
Box.test(arima_model$residuals, lag = 20, type = "Ljung-Box")

# Residual plots
acf(arima_model$residuals)
pacf(arima_model$residuals)

# -----------------------------
# 9. Forecasting
# -----------------------------

# 1-year forecast
forecast_arima <- forecast(arima_model, h = 365)
plot(forecast_arima)

# 3-month forecast
forecast_3m <- forecast(arima_model, h = 90)
plot(forecast_3m)
