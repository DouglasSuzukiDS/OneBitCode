CREATE  DATABASE ex03;

-- Obter todos os pacientes juntamente com suas consultas e os médicos que os atenderam.
SELECT
   patients.id AS pacient_id,
   patients.full_name AS pacient_name,
   consultations.id AS consultation_id,
   consultations.consultation_date,
   patients.id AS pacient_id,
   doctors.id as doctor_id,
   doctors.full_name as doctor_name
FROM patients
JOIN 
   consultations ON patients.id = consultations.patient_id
JOIN
   doctors ON doctors.id = consultations.doctor_id
ORDER BY consultations.consultation_date DESC;

-- Obter todas as consultas de um determinado médico, incluindo informações dos pacientes e observações.
SELECT
   doctors.id AS doctor_id,
   doctors.full_name AS doctor_name,
   consultations.id AS consultation_id,
   consultations.consultation_date,
   consultations.observations,
   patients.id AS patient_id,
   patients.full_name AS patient_name
FROM doctors
JOIN consultations ON doctors.id = consultations.doctor_id
JOIN patients ON consultations.patient_id = patients.id
WHERE doctors.full_name = 'Dr. João Silva';

-- Obter uma lista de todos os tratamentos prescritos em consultas, incluindo informações dos médicos e pacientes.
SELECT
   treatments.id AS treatment_id, 
   treatments.treatment_description, 
   treatments.medications, 
   consultations.consultation_date,
   doctors.full_name AS doctor_full_name,
   patients.full_name AS patient_full_name
FROM
	treatments
JOIN
	consultations ON treatments.consultation_id = consultations.id
JOIN
	patients ON consultations.patient_id = patients.id
JOIN
   doctors ON doctors.id = consultations.doctor_id;

-- Obter todos os médicos com suas respectivas especializações.
SELECT 
   doctors.id AS doctor_id, 
   doctors.full_name AS doctor_full_name,
   doctors.phone AS doctor_phone,
   specializations.specialization_name
FROM 
   doctors
JOIN 
   specializations ON doctors.specialization_id = specializations.id;

-- Obter todas as consultas realizadas em uma data específica, incluindo informações de pacientes e médicos.
SELECT
   consultations.id AS consultation_id, 
   consultations.consultation_date, 
   patients.full_name AS patient_full_name, 
   doctors.full_name AS doctor_full_name, 
   consultations.observations, 
   consultations.service_type
FROM
	consultations
JOIN
	patients ON patients.id = consultations.patient_id
JOIN
	doctors ON doctors.id = consultations.doctor_id
WHERE
	consultations.consultation_date = '2024-06-01'; -- Substitua por qualquer data

-- Obter uma lista de todos os pacientes que foram atendidos por médicos de uma determinada especialização.
SELECT 
	patients.id AS patient_id, 
	patients.full_name AS patient_full_name, 
	doctors.full_name AS doctor_full_name, 
	specializations.specialization_name
FROM 
	patients
JOIN 
	consultations ON patients.id = consultations.patient_id
JOIN 
	doctors ON consultations.doctor_id = doctors.id
JOIN 
	specializations ON doctors.specialization_id = specializations.id
WHERE 
	-- Substitua por qualquer especialização
	specializations.specialization_name = 'Cardiologia'; 

-- Obter todos os tratamentos em andamento de um determinado paciente.
SELECT
	patients.id AS patient_id, 
	patients.full_name AS patient_full_name, 
   treatments.treatment_description,
   treatments.medications,
   consultations.consultation_date
FROM
	patients
JOIN
	consultations ON patients.id = consultations.patient_id
JOIN
   treatments ON treatments.consultation_id = consultations.id
WHERE
	patients.id = 1;
