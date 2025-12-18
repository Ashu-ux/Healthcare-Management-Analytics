DELIMITER //
CREATE PROCEDURE BookAppointment(
    IN p_patient_id INT,
    IN p_doctor_id INT,
    IN p_date DATE
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM Appointments 
        WHERE doctor_id = p_doctor_id AND appointment_date = p_date
    ) THEN
        INSERT INTO Appointments(patient_id, doctor_id, appointment_date, status)
        VALUES(p_patient_id, p_doctor_id, p_date, 'Scheduled');
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Doctor not available on selected date';
    END IF;
END //
DELIMITER ;
