-- Pacientes
CREATE TABLE IF NOT EXISTS patients(
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(255) NOT NULL,
   date_of_birth DATE NOT NULL,
   gender CHAR(1),
   phone VARCHAR(20),
   address VARCHAR(255)
);

-- Especializacoes
CREATE TABLE IF NOT EXISTS specializations(
   id SERIAL PRIMARY KEY,
   specialization_name VARCHAR(100)
);

-- Medicos
CREATE TABLE IF NOT EXISTS doctors(
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(255) NOT NULL,
   phone VARCHAR(20),

   specialization_id INT,
   FOREIGN KEY (specialization_id) REFERENCES specializations (id)
);

-- Consultas
CREATE TABLE IF NOT EXISTS consultations(
   id SERIAL PRIMARY KEY,
   consultation_date DATE,
   observations TEXT,
   service_type VARCHAR(20),

   patient_id INT NOT NULL,
   doctor_id INT NOT NULL,
   FOREIGN KEY (patient_id) REFERENCES patients (id),
   FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

-- Tratamentos
CREATE TABLE IF NOT EXISTS treatments(
   id SERIAL PRIMARY KEY,
   medications VARCHAR(255),
   treatment_description VARCHAR(255),

   consultation_id INT NOT NULL,
   FOREIGN KEY (consultation_id) REFERENCES consultations (id)
);
