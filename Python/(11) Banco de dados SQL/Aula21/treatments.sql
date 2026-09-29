-- Por fim, os tratamentos só podem ser criados para uma consulta específica, porém uma mesma consulta pode ter mais de um tratamento associado a ela. O tratamento deve possuir informações sobre os medicamentos a serem usados e uma descrição do tratamento em si.

CREATE TABLE treatments(
   id SERIAL PRIMARY KEY,
   medications TEXT,
   description TEXT,

   appointment_id INT,
   FOREIGN KEY (appointment_id) REFERENCES appointments (id)
);

INSERT INTO treatments (medications, description, appointment_id) VALUES 
   -- PUBLIC    1 1 1 Bruce | Stephen Stranger | Neurosurgeon
   (
      'Gabapentina 300mg, Dipirona 500mg', 
      'Avaliação pós-operatória de hérnia de disco lombar. Paciente apresenta melhora gradual da dor irradiada, sem novos déficits neurológicos.', 
      2
   ),
   -- PRIVATE   3 7 9 Diana | Jane Froost      | Gynecologist  
   (
      'Anticoncepcional Oral Combinado, Ácido Fólico 5mg', 
      'Consulta de rotina anual. Exames preventivos (Papanicolau e ultrassonografia) solicitados. Orientações sobre planejamento familiar.', 
      3
   ),
   -- INSURANCE 2 5 7 Clark | Harleen Quinzel  | Psychiatris
   (  
      'Sertralina 50mg, Clonazepam 0.5mg', 
      'Paciente relata sintomas de ansiedade generalizada e insônia. Iniciado tratamento com antidepressivo e recomendada psicoterapia semanal.', 
      1
   ),
   -- PRIVATE   4 1 1 Peter | Stephen Stranger | Neurosurgeon
   (
      'Ibuprofeno 600mg, Relaxante Muscular (Ciclobenzaprina 5mg)', 
      'Diagnóstico de entorse no ombro direito e contusões generalizadas por impacto contundente. Recomendado repouso rigoroso de 5 dias, evitando balançar-se em teias ou carregar peso.', 
      4
   );  

   -- INSURANCE 2 5 7 Clark | Harleen Quinzel  | Psychiatris
   -- PUBLIC    1 1 1 Bruce | Stephen Stranger | Neurosurgeon
   -- PRIVATE   3 7 9 Diana | Jane Froost      | Gynecologist 
   -- PRIVATE   4 1 1 Peter | Stephen Stranger | Neurosurgeon

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

-- Obter todos os tratamentos em andamento de um determinado paciente.
SELECT 
   t.id,
   t.medications,
   t.description,

   p.name AS patient_name

FROM treatments t
JOIN appointments a ON t.appointment_id = a.id
JOIN patients p ON a.patient_id = p.id
WHERE p.id = 1;