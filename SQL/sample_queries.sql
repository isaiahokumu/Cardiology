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

-- Count of heart disease cases by sex
SELECT p.sex, COUNT(*) AS disease_cases
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
WHERE d.has_disease = TRUE
GROUP BY p.sex;

-- Query to find top 5 high blood pressure patients with disease
SELECT p.patient_id, p.age, cf.blood_pressure
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
JOIN Clinical_Factors cf ON d.factor_id = cf.factor_id
WHERE d.has_disease = TRUE
ORDER BY cf.blood_pressure DESC
LIMIT 5;

-- Query to find chest pain types in patients with heart disease
SELECT cf.chest_pain_type, COUNT(*) AS cases
FROM Clinical_Factors cf
JOIN Diagnosis d ON cf.factor_id = d.factor_id
WHERE d.has_disease = TRUE
GROUP BY cf.chest_pain_type
ORDER BY cases DESC;
