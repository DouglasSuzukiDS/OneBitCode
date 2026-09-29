-- As especializações só precisam de um nome/título, e podem ser usadas para múltiplos médicos (ex.: a linha “Cardiologia” pode ser a especialização de 3 médicos simultaneamente)

CREATE TABLE specialties(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO specialties (name) VALUES
   ('Neurosurgeon'),
   ('Cardiologist'),
   ('Pediatrician'),
   ('Dermatologist'),
   ('Orthopedist'),
   ('Neurologist'),
   ('Psychiatrist'),
   ('Ophthalmologist'),
   ('Gynecologist')