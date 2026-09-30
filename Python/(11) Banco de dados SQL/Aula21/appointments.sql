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
