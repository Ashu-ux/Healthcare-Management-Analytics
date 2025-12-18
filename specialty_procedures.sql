SELECT 
    d.specialty,
    AVG(m.procedures_count) AS avg_procedures_per_patient
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Medical_History m ON a.patient_id = m.patient_id
GROUP BY d.specialty
ORDER BY avg_procedures_per_patient DESC;
