--  As consultas são intermediárias entre pacientes e médicos, onde um paciente pode se consultar com vários médicos diferentes e um médico pode atender vários pacientes. As consultas também precisam possuir as informações: data de quando foi realizada, observações e tipo de atendimento (ex.: plano de saúde ou particular)

CREATE TABLE appointments(
   id SERIAL PRIMARY KEY,
   appointment_date TIMESTAMP NOT NULL,
   appointment_type VARCHAR(30) NOT NULL, -- Private, Insurance (convenio), Public
   notes VARCHAR(255) NOT NULL,

   patient_id INT,
   doctor_id INT,
   specialtie_id INT,

   FOREIGN KEY (patient_id) REFERENCES patients (id),
   FOREIGN KEY (doctor_id) REFERENCES doctors (id),
   FOREIGN KEY (specialtie_id) REFERENCES specialties (id)
);

INSERT INTO appointments (appointment_date, appointment_type, notes, patient_id, doctor_id, specialtie_id) VALUES
   ('2026-09-29 10:15:00', 'Insurance', '', 2, 5, 7),
   ('2026-09-29 12:00:00', 'Public', '', 1, 1, 1),
   ('2026-09-29 15:45:00', 'Private', '', 3, 7, 9),
   ('2026-09-30 16:30:00', 'Private', 'Low light room, and low noise', 4, 1, 1);
   
   -- INSURANCE 2 5 7 Clark | Harleen Quinzel  | Psychiatris
   -- PUBLIC    1 1 1 Bruce | Stephen Stranger | Neurosurgeon
   -- PRIVATE   3 7 9 Diana | Jane Froost      | Gynecologist 
   -- PRIVATE   4 1 1 Peter | Stephen Stranger | Neurosurgeon

-- Obter todos os pacientes juntamente com suas consultas e os médicos que os atenderam.
SELECT
   a.id,
   appointment_date,
   appointment_type,

   p.name AS patiend_name,

   d.name AS doctor_name
FROM appointments a 
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id;

-- Obter todas as consultas de um determinado médico, incluindo informações dos pacientes e observações.
SELECT
   a.appointment_date,
   a.appointment_type,
   a.notes,

   p.name AS pacient_name
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
WHERE d.id = 1;

-- Obter todas as consultas realizadas em uma data específica, incluindo informações de pacientes e médicos.
SELECT
   a.appointment_type,
   a.notes,

   p.name AS patient_name,

   d.name AS doctor_name,

   s.name AS specialty
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
JOIN specialties s ON a.specialtie_id = s.id
WHERE appointment_date = '2026-09-29 15:45:00';

-- Obter uma lista de todos os pacientes que foram atendidos por médicos de uma determinada especialização.
SELECT
   p.name AS patient_name,

   d.name AS doctor_name,

   s.name AS specialty
FROM appointments a
JOIN patients p ON a.patient_id = p.id 
JOIN doctors d ON a.doctor_id = d.id 
JOIN specialties s ON a.specialtie_id = s.id
WHERE s.id = 1;