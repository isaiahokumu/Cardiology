CREATE DATABASE heart_disease_db;

USE heart_disease_db;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    age INT NOT NULL,
    sex VARCHAR(10) NOT NULL,
    location VARCHAR(100),
    age_group VARCHAR(20),
    INDEX idx_sex (sex),
    INDEX idx_agegroup (age_group)
);

CREATE TABLE Clinical_Factors (
    factor_id INT PRIMARY KEY,
    chest_pain_type VARCHAR(50),
    blood_pressure FLOAT,
    cholesterol FLOAT,
    fasting_blood_sugar VARCHAR(10),
    rest_ecg VARCHAR(50),
    max_heart_rate FLOAT,
    exercise_angina VARCHAR(10),
    oldpeak FLOAT,
    slope VARCHAR(20),
    ca INT,
    INDEX idx_chestpain (chest_pain_type),
    INDEX idx_chol (cholesterol)
);

CREATE TABLE Diagnosis (
    diagnosis_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    factor_id INT NOT NULL,
    has_disease BOOLEAN,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (factor_id) REFERENCES Clinical_Factors(factor_id),
    INDEX idx_disease (has_disease),
    INDEX idx_patient (patient_id)
);
