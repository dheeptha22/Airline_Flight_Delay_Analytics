# ✈️ Cloud-Based Airline Flight Delay Analysis and Prediction Using R

## 📖 Introduction

Airline flight delays are a common problem that can affect passengers, airline operations, airport management, and overall travel efficiency. Analyzing historical flight data can help identify patterns and factors associated with flight delays.

This project focuses on developing a **Cloud-Based Airline Flight Delay Analysis and Prediction System using R**. Historical airline flight data is stored in **Google Drive cloud storage** and accessed using the `googledrive` package.

The data is cleaned and preprocessed using R, followed by **Exploratory Data Analysis (EDA)** to identify delay patterns based on airlines, months, departure hours, days of the week, flight distance, and airports.

A **Random Forest Classification algorithm** is then used to predict whether a flight is likely to be delayed. The system also calculates the probability of delay.

Finally, an interactive **R Shiny dashboard** is developed to display key statistics, interactive charts, and flight-delay predictions.

The project demonstrates an end-to-end **Data Analytics on Cloud workflow**, starting from cloud-based data storage and ending with data analysis, Machine Learning, prediction, and visualization.

---

## 🎯 Objectives

- ☁️ Store and access airline datasets using cloud storage
- 🧹 Clean and preprocess historical flight data
- 📊 Perform Exploratory Data Analysis (EDA)
- 🔍 Identify important flight-delay patterns
- 🤖 Build a Machine Learning model for flight-delay prediction
- 📈 Evaluate the prediction model
- 🖥️ Develop an interactive R Shiny dashboard
- 🔮 Predict whether a flight is likely to be delayed

---

## 🔄 Project Workflow

**1. ☁️ Cloud Data Storage**

Historical airline datasets are stored in a dedicated Google Drive folder.

↓

**2. 📥 Data Loading**

R connects to Google Drive using the `googledrive` package and accesses the required datasets.

↓

**3. 🧹 Data Preprocessing**

The flight data is cleaned by removing cancelled flights, selecting relevant variables, handling data types, and preparing the dataset for analysis.

↓

**4. 🔧 Feature Engineering**

New features are created, including:

- Departure Hour
- Origin Airport Delay Rate
- Destination Airport Delay Rate
- Is Delayed

↓

**5. 📊 Exploratory Data Analysis**

The data is analyzed based on:

- Airline
- Month
- Day of Week
- Departure Hour
- Flight Distance
- Origin Airport
- Destination Airport

↓

**6. 🤖 Machine Learning**

A Random Forest Classification algorithm is trained using historical flight information.

↓

**7. 🔮 Flight Delay Prediction**

The trained model predicts:

- Delayed
- Not Delayed

and calculates the probability of delay.

↓

**8. 🖥️ R Shiny Dashboard**

The final results are displayed through an interactive R Shiny dashboard containing analytics, visualizations, KPIs, and prediction results.

---

## 🏗️ System Architecture

**☁️ Google Drive Cloud Storage**

↓

**📥 Data Collection**

↓

**🧹 Data Preprocessing**

↓

**🔧 Feature Engineering**

↓

**📊 Exploratory Data Analysis**

↓

**🤖 Random Forest Model**

↓

**🔮 Flight Delay Prediction**

↓

**🖥️ R Shiny Dashboard**


---

## 📁 Project Structure

```text
Airline_Flight_Delay_Analytics/
│
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── processed/
│
├── R/
│   ├── 01_cloud_data_loading.R
│   ├── 01_data_loading.R
│   ├── 01_data_preprocessing.R
│   ├── 01_setup.R
│   ├── 02_eda.R
│   ├── 03_model_training.R
│   └── 04_prediction_function.R
│
├── models/
│   └── airline_delay_rf_model.rds
│
├── dashboard/
│   ├── app.R
│   └── www/
│       └── style.css
│
├── visualizations/
├── reports/
├── screenshots/
│   ├── system_architecture.png
│   ├── dashboard.png
│   ├── prediction.png
│   ├── analytics.png
│   └── cloud_storage.png
│
├── .gitignore
├── README.md
└── Airline_Flight_Delay_Analytics.Rproj
```

---

## 🤖 Machine Learning Algorithm

### Random Forest Classification

The project uses the **Random Forest Classification algorithm** to predict whether a flight is likely to be delayed.

### Input Features

- Month
- Day
- Day of Week
- Airline
- Departure Hour
- Flight Distance
- Origin Airport Delay Rate
- Destination Airport Delay Rate

### Target Variable

```text
Departure Delay > 15 minutes
              ↓
           Delayed

Departure Delay ≤ 15 minutes
              ↓
        Not Delayed
```

### Prediction Threshold

The prediction system uses a **0.30 probability threshold**.

```text
Delay Probability ≥ 30%
        ↓
     Delayed
```

```text
Delay Probability < 30%
        ↓
   Not Delayed
```

---

## 📊 Project Results

### Dataset Results

| Metric | Result |
|---|---:|
| Original Flight Records | ~5.82 million |
| Non-Cancelled Flights | 5,729,195 |
| Delayed Flights | 1,016,536 |
| Not Delayed Flights | 4,712,659 |
| Overall Delay Rate | 17.75% |

### Machine Learning Results

| Metric | Result |
|---|---:|
| Accuracy | 75.53% |
| Sensitivity / Recall | 34.09% |
| Specificity | 84.47% |
| Precision | 32.14% |
| F1 Score | 33.08% |
| Balanced Accuracy | 59.28% |
| ROC-AUC | **0.6693** |
| Prediction Threshold | **30%** |

---

## 🔮 Prediction Result

### Example Input

| Feature | Value |
|---|---|
| Airline | AA |
| Month | June |
| Day | 15 |
| Day of Week | Monday |
| Departure Hour | 9 |
| Distance | 1235 |
| Origin Delay Rate | 18% |
| Destination Delay Rate | 20% |

### Output

**Prediction:** 🟢 Not Delayed

**Delay Probability:** **16%**

<img width="1082" height="600" alt="image" src="https://github.com/user-attachments/assets/2831baee-09a5-4be1-a279-c6dd98023ba2" />


---

## 🖥️ R Shiny Dashboard

The project includes an interactive **R Shiny dashboard** providing:

- 📊 Key Performance Indicators
- 📈 Monthly delay analysis
- ✈️ Airline analysis
- 🕐 Hourly analysis
- 📏 Distance analysis
- 📆 Day-of-week analysis
- 🔮 Flight delay prediction

<img width="1052" height="841" alt="image" src="https://github.com/user-attachments/assets/21e88ffa-ea8d-4692-831c-a4ab13bd24b1" />
<img width="1055" height="826" alt="image" src="https://github.com/user-attachments/assets/573b372a-5e99-4ec1-b3d1-f12ccbe61d5f" />
---

## 📸 Results Screenshots

### 📊 Analytics

<img width="1062" height="587" alt="image" src="https://github.com/user-attachments/assets/38a576af-9522-4a37-82f1-aa264cdae463" />
<img width="1078" height="666" alt="image" src="https://github.com/user-attachments/assets/8867c907-c5be-4b48-8ff6-92093e8f3aeb" />
<img width="1061" height="615" alt="image" src="https://github.com/user-attachments/assets/24ee0da7-f953-4067-8fb2-b7c9566b475b" />


### ☁️ Cloud Storage

<img width="1531" height="467" alt="image" src="https://github.com/user-attachments/assets/bd5fd9e8-4b0f-4627-bd06-01c055b3a3a4" />


---

## 💡 Key Findings

- Overall historical flight delay rate was **17.75%**.
- June recorded a delay rate of approximately **22.8%**.
- February recorded a delay rate of approximately **21.5%**.
- September recorded a delay rate of approximately **12.1%**.
- October recorded a delay rate of approximately **11.9%**.
- Different airlines showed different historical delay patterns.
- Departure time showed variation in delay occurrence.
- Airport historical delay rates were incorporated into the Machine Learning model.
- The Random Forest model achieved an **ROC-AUC of 0.6693**.
- The dashboard provides interactive analytics and flight-delay prediction.

---

## ☁️ Cloud-Based Data Analytics Workflow

```text
Google Drive
     ↓
Cloud Data Access
     ↓
Data Preprocessing
     ↓
Feature Engineering
     ↓
Exploratory Data Analysis
     ↓
Random Forest
     ↓
Flight Delay Prediction
     ↓
R Shiny Dashboard
     ↓
Results & Visualization
```

---

## ✅ Final Outcome

The project successfully implements a **Cloud-Based Airline Flight Delay Analysis and Prediction System using R**.

It demonstrates a complete **Data Analytics on Cloud workflow**, from cloud data storage and preprocessing to Exploratory Data Analysis, Machine Learning, prediction, and interactive visualization.
