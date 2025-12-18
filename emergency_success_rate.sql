SELECT 
    admission_type,
    COUNT(CASE WHEN outcome = 'Successful' THEN 1 END) * 100.0 / COUNT(*) AS success_rate
FROM Appointments
WHERE admission_type = 'Emergency'
GROUP BY admission_type;
