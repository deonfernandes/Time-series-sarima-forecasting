# Time Series Analysis and Forecasting using SARIMA

This project demonstrates the application of advanced time series analysis techniques to forecast future values based on historical data. The analysis focuses on stationarity, differencing, model selection using SARIMA, and comparing the model's performance to STL-based random walk forecasting.

---

## Introduction
Time series analysis involves understanding and modeling patterns in data over time. This project applies SARIMA (Seasonal Autoregressive Integrated Moving Average) modeling to address seasonality, trends, and stationarity issues, producing accurate forecasts. Additionally, the project contrasts SARIMA's performance with STL decomposition combined with random walk forecasting.

---

## Dataset
The dataset represents monthly observations of a trade index from 2011 to 2025. It exhibits strong seasonal and trend components, which are addressed through transformations and SARIMA modeling.

---

## Methodology
1. **Data Preprocessing:**
   - Logarithmic transformation to stabilize variance.
   - First differencing to remove trends.
   - Seasonal differencing to address periodicity.
2. **Stationarity Checks:**
   - Autocorrelation (ACF) and Partial Autocorrelation (PACF) plots.
   - Augmented Dickey-Fuller (ADF) test for statistical validation of stationarity.
3. **Model Selection:**
   - Box-Jenkins methodology to determine ARIMA (p, d, q) and SARIMA (P, D, Q, s) parameters.
   - Fitted multiple SARIMA models with varying parameters.
   - Compared models using metrics like AIC, BIC, and residual diagnostics.
4. **Forecasting:**
   - One-year forecast using the best SARIMA model.
   - Comparison with STL-based random walk forecasting.
5. **Visualization:**
   - Diagnostic plots for stationarity, residuals, and forecasts.

---

## Results
- **Best SARIMA Model:** ARIMA(1,1,1)(0,1,1)[12]
  - Log-Likelihood: 127.55
  - AIC: -247.11
  - BIC: -234.47
  - Residual diagnostics show no significant autocorrelation or deviation from normality.
- **Forecast:**
  - Captured seasonal and trend components effectively.
  - Provided narrow confidence intervals, indicating lower uncertainty compared to STL-based random walk forecasting.
- **Comparison with STL Forecasting:**
  - SARIMA produced denser forecasts, better suited for recurring seasonal patterns.
  - STL forecasts had wider intervals, highlighting higher uncertainty.

---

## Setup Instructions
Install R and the following R packages:

install.packages(c("readxl", "forecast", "seasonal", "seasonalview", "ggplot2", "ggfortify", "tseries"))

Prepare the dataset:

Place your dataset file (Data.xlsx) in the appropriate directory as specified in the R script.

Run the analysis -- Execute the provided R script to reproduce results

## Key Findings
SARIMA models are highly effective for forecasting when data has recurring seasonal patterns.

STL forecasting is more versatile but introduces greater uncertainty when future trends deviate from historical patterns.

Diagnostics suggest that the SARIMA model captures the underlying patterns in the data well, with minimal residual autocorrelation and close-to-normal residuals.

## Future Work
Experiment with advanced models like Exponential Smoothing State Space (ETS) and neural networks (e.g., LSTM).

Extend the analysis to include exogenous variables (SARIMAX).

Automate model selection using hyperparameter tuning or grid search.
