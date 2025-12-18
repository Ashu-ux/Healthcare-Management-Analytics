CREATE TRIGGER after_patient_update
AFTER UPDATE ON Patients
FOR EACH ROW
INSERT INTO Audit_Trail(patient_id, change_type, changed_by, timestamp)
VALUES(OLD.patient_id, 'UPDATE', USER(), NOW());
