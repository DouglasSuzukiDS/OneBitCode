-- Aula21 - Exercício 3: Tabelas Relacionadas

CREATE DATABASE clinic;

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

-- Obter uma lista de todos os tratamentos prescritos em consultas, incluindo informações dos médicos e pacientes.
SELECT
   t.id,
   t.medications,
   t.description,

   a.appointment_date ,
   a.appointment_type ,
   a.notes,

   p.name AS patient_name,

   d.name AS doctor_name,

   s.name AS specialty

FROM treatments t
JOIN appointments a ON t.appointment_id = a.id
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON  a.doctor_id = d.id
JOIN specialties s ON d.specialtie_id = s.id;

-- Obter todos os médicos com suas respectivas especializações.
SELECT 
   d.id,
   d.name,
   d.phone,

   s.name as speciealty 
FROM doctors d
JOIN specialties s ON d.specialtie_id = s.id;

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

-- Obter todos os tratamentos em andamento de um determinado paciente.
SELECT 
   t.id,
   t.medications,
   t.description,

   p.name AS patient_name

FROM treatments t
JOIN appointments a ON t.appointment_id = a.id
JOIN patients p ON a.patient_id = p.id
WHERE p.id = 4;
