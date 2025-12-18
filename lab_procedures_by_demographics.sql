SELECT 
    p.gender,
    p.age_group,
    AVG(m.procedures_count) AS avg_procedures
FROM Patients p
JOIN Medical_History m ON p.patient_id = m.patient_id
GROUP BY p.gender, p.age_group;
