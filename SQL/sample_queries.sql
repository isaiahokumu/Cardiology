-- Query to find all patients with heart disease
SELECT p.sex, p.patient_id, p.age, d.has_disease
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
WHERE d.has_disease = TRUE
GROUP BY p.sex, p.patient_id, p.age, d.has_disease;

-- Average cholesterol levels by age group and sex
SELECT p.sex, p.age_group, AVG(cf.cholesterol) AS avg_cholesterol
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
JOIN Clinical_Factors cf ON d.factor_id = cf.factor_id
GROUP BY p.sex, p.age_group
ORDER BY p.sex, avg_cholesterol DESC;

-- Count of heart disease cases by sex
SELECT p.sex, COUNT(*) AS disease_cases
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
WHERE d.has_disease = TRUE
GROUP BY p.sex;

-- Query to find top 5 high blood pressure patients with disease, grouped by sex
SELECT p.sex, p.patient_id, p.age, cf.blood_pressure
FROM Patients p
JOIN Diagnosis d ON p.patient_id = d.patient_id
JOIN Clinical_Factors cf ON d.factor_id = cf.factor_id
WHERE d.has_disease = TRUE
ORDER BY p.sex, cf.blood_pressure DESC
LIMIT 5;

-- Query to find chest pain types in patients with heart disease, grouped by sex
SELECT p.sex, cf.chest_pain_type, COUNT(*) AS cases
FROM Clinical_Factors cf
JOIN Diagnosis d ON cf.factor_id = d.factor_id
JOIN Patients p ON d.patient_id = p.patient_id
WHERE d.has_disease = TRUE
GROUP BY p.sex, cf.chest_pain_type
ORDER BY p.sex, cases DESC;
