# Cardiology - Heart Disease Analytics Tool

A Python + SQL + Visualization capstone project supervised by ~ Melody Bonareri  

---

## Project Description  
This project is a **data-driven analytics tool** focused on **heart disease research and diagnosis patterns**.  
It integrates **SQL, Python (Pandas), and visualization dashboards** to uncover hidden relationships between risk factors such as **age, sex, chest pain, cholesterol, blood pressure, fasting blood sugar, and affected vessels**.  

The goal is to support clinicians, policymakers, and individuals in **understanding, managing, and reducing the burden of heart disease**.  

---

## Problem Statement  
Despite advancements in medicine, **heart disease remains under-diagnosed and poorly understood** in many populations.  
By leveraging **data analytics**, we can uncover patterns, trends, and predictive insights to:  
- Improve early diagnosis  
- Inform treatment strategies  
- Guide public health interventions  

---

## Research Questions  
1. Disease distribution by sex, chest pain type, and origin
2. Relationship between maximum heart rate (thalch) and age
3. Distribution of fasting blood sugar (fbs > 120 mg/dl)
4. How does the number of affected vessels (CA) correlate with severity?
5. Distribution of resting blood pressure (trestbps)
6. How cholesterol (chol) varies with age
7. Association of exercise-induced angina (exang) with oldpeak
8. What role does ST depression (Oldpeak) play in predicting heart disease?  

---

## Features  

### Interactive Dashboard  
- **KPIs**: % of patients with heart disease, average cholesterol & BP by age, gender prevalence  
- **Visualizations & Insights**:  
  - By Sex → Higher prevalence in men (AHA, 2022)  
  - By Chest Pain → Typical angina correlates with confirmed cases (Mayo Clinic, 2021)  
  - By FBS → High fasting sugar = elevated risk (WHO, 2022)  
  - By Vessels (CA) → More blocked vessels = higher risk (NIH, 2020)  
  - Resting BP & Age → Hypertension rises with age (CDC, 2023)  
  - HR vs Age → Younger = more variability (EHJ, 2019)  
  - Cholesterol vs Age → Middle-aged = peak levels (NIH, 2021)  
  - Oldpeak (ST Depression) → Predicts ischemia (Cleveland Clinic, 2020)  

---

## SQL Schema & Queries  

```sql
-- CREATE DATABASE heart_disease_db;

USE heart_disease_db;

-- CREATE TABLE Patients (
--     patient_id INT PRIMARY KEY,
--     age INT NOT NULL,
--     sex VARCHAR(10) NOT NULL,
--     location VARCHAR(100),
--     age_group VARCHAR(20),
--     INDEX idx_sex (sex),
--     INDEX idx_agegroup (age_group)
-- );

-- CREATE TABLE Clinical_Factors (
--     factor_id INT PRIMARY KEY,
--     chest_pain_type VARCHAR(50),
--     blood_pressure FLOAT,
--     cholesterol FLOAT,
--     fasting_blood_sugar VARCHAR(10),
--     rest_ecg VARCHAR(50),
--     max_heart_rate FLOAT,
--     exercise_angina VARCHAR(10),
--     oldpeak FLOAT,
--     slope VARCHAR(20),
--     ca INT,
--     INDEX idx_chestpain (chest_pain_type),
--     INDEX idx_chol (cholesterol)
-- );

-- CREATE TABLE Diagnosis (
--     diagnosis_id INT PRIMARY KEY,
--     patient_id INT NOT NULL,
--     factor_id INT NOT NULL,
--     has_disease BOOLEAN,
--     FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
--     FOREIGN KEY (factor_id) REFERENCES Clinical_Factors(factor_id),
--     INDEX idx_disease (has_disease),
--     INDEX idx_patient (patient_id)
-- );


-- SAMPLE QUERIES
-- Query to find all patients with heart disease
SELECT p.sex, COUNT(DISTINCT p.patient_id) AS patients_with_disease
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
WHERE d.has_disease = TRUE
GROUP BY p.sex;

-- Average cholesterol levels by age group
SELECT p.age_group, AVG(cf.cholesterol) AS avg_cholesterol
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
JOIN Clinical_Factors cf ON d.factor_id = cf.factor_id
GROUP BY p.age_group
ORDER BY avg_cholesterol DESC;
```

---

## Data Pipeline
- **Data Source:** UCI / Kaggle Heart Disease Dataset  
- **Ingestion:** CSV → Python (Pandas)  
- **Cleaning:** Handle missing values, encode categorical variables  
- **Storage:** MySQL / PostgreSQL  
- **Transformation:** SQL queries + Pandas aggregations  
- **Visualization:** Streamlit Dashboard / Power BI  
- **Deployment:** GitHub repo + hosted dashboard  

---

## Data Dictionary (Sample)
- `age`: Patient age in years  
- `sex`: Male/Female  
- `chest_pain`: Type of chest pain (typical, atypical, non-anginal, asymptomatic)  
- `resting_bp`: Resting blood pressure (mmHg)  
- `cholesterol`: Serum cholesterol (mg/dl)  
- `fbs`: Fasting blood sugar > 120 mg/dl (1 = true, 0 = false)  
- `oldpeak`: ST depression induced by exercise  
- `ca`: Number of major vessels (0–3)  
- `target`: Diagnosis of heart disease (1 = present, 0 = absent)  

---

## Technologies Used
- **Frontend:** Streamlit, Power BI  
- **Backend:** Python (Pandas, NumPy)  
- **Database:** MySQL 
- **Visualization:** Matplotlib, Seaborn, Plotly  
- **ETL Pipeline:** Python + SQL  

---

## Success Criteria
The project will be considered successful if it:  
- Handles >1,000 patient records  
- Provides interactive visualizations with key insights  
- Supports SQL queries for trend analysis  
- Outputs clear recommendations with references  

---

## Stretch Goals
- Add **machine learning models** for prediction  
- Integrate **real-time hospital datasets**  
- Deploy cloud dashboard (**Streamlit Cloud / Heroku / Power BI Service**)  
- Enable **voice-assisted queries** for clinicians  

---

## Installation
```bash
# Clone the repository
git clone https://github.com/isaiahokumu/Cardiology.git

# Navigate into the folder
cd Cardiology

# Install dependencies
pip install -r requirements.txt

# Run the app
streamlit run app.py
```
---

## References

* World Health Organization – Heart Disease (2023)
* American Heart Association (2022)
* Mayo Clinic – Angina (2021)
* CDC Hypertension Report (2023)
* NIH Cholesterol & Heart Study (2021)
* Cleveland Clinic – ST Depression (2020)
* Kaggle Heart Disease Dataset: [Heart Disease Data](https://www.kaggle.com/datasets/redwankarimsony/heart-disease-data)

- 🔗 Power BI Dashboard: *(insert link here)*
- 🔗 View on Web App: [Heartbeat Analytics](https://heartbeat-insights.lovable.app/)
- 🔗 GitHub Repository: [Cardiology](https://github.com/isaiahokumu/Cardiology)

---

