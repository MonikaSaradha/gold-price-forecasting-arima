# Gold Price Forecasting using ARIMA

## Overview

This project applies time series analysis techniques to forecast gold prices using historical financial data.

The analysis includes data preprocessing, trend and seasonality decomposition, and the application of forecasting models such as Holt-Winters and ARIMA to understand and predict price movements.

This project demonstrates a full time-series forecasting pipeline, from data preprocessing to model validation and forecasting.

---

## Dataset

* Financial time series dataset containing daily gold price data
* Features include:

  * Date
  * Price (closing price)
  * Open, High, Low
  * Volume
  * Percentage Change

---

## Problem Statement

Gold prices fluctuate due to market dynamics, making it challenging for investors and businesses to anticipate future trends.

This project aims to analyze historical price data and build forecasting models to support better financial decision-making.

---

## Objectives

* Clean and preprocess time series data
* Analyze trends and seasonal patterns
* Apply decomposition techniques
* Build forecasting models (Holt-Winters, ARIMA)
* Evaluate model performance and generate forecasts

---

## Data Preprocessing

* Handled missing values using interpolation
* Checked for outliers using boxplots
* Converted daily data into time series format
* Split dataset into training and testing sets

---

## Time Series Analysis

### Decomposition

* Additive and multiplicative decomposition applied
* Identified:

  * Trend (long-term movement)
  * Seasonality (recurring patterns)
  * Residual (noise)

---

## Forecasting Models

### Holt-Winters Model

* Captures level, trend, and seasonality
* Used for 1-year forecasting

### ARIMA Model

* Applied to model time-dependent structure
* Diagnostic checks performed:

  * ACF & PACF
  * Residual analysis
  * Ljung-Box test

* Model validity was assessed using residual diagnostics and Ljung-Box test, ensuring residuals behave approximately as white noise.

---

## Key Insights

* Gold prices show a clear upward trend over time
* Seasonal patterns are present in the data
* ARIMA captures short-term dependencies but may miss complex patterns
* Forecasts indicate moderate growth with fluctuations

---

## Forecasting Results

* 1-year forecast using Holt-Winters
* Short-term (3-month) forecast using ARIMA
* Confidence intervals highlight uncertainty in predictions

---

## Limitations

* Model assumes past patterns continue into the future
* ARIMA may not capture complex seasonal behavior fully
* External factors (economic events, policy changes) not included

---

## Future Improvements

* Apply Seasonal ARIMA (SARIMA)
* Incorporate external variables (macroeconomic indicators)
* Compare with machine learning models

---

## Tech Stack

* R (forecast, tseries, ggplot2, imputeTS)
* Time Series Modeling (ARIMA, Holt-Winters)

---

## Project Structure

* analysis.R – data preprocessing, decomposition, ARIMA & Holt-Winters modeling
* data/ – historical gold price dataset 
* README.md – project overview
* project_report.pdf – detailed academic report (supporting material)

