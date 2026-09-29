-- Active: 1790208447792@@127.0.0.1@5432@clinic
-- Os pacientes devem possuir nome completo, data de nascimento, gênero, telefone e endereço.
CREATE TABLE patients(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   birthdate DATE NOT NULL,
   genre VARCHAR(10) NOT NULL,
   phone VARCHAR(15) NOT NULL,
   address VARCHAR(255) NOT NULL
);

INSERT INTO patients (name, birthdate, genre, phone, address) VALUES
   ('Clark Kent', '1988-06-18', 'Male', '(11) 98765-4321', 'Metropolis'),
   ('Bruce Wayne', '1985-02-19', 'Male', '(11) 91234-5678', 'Gotham City'),
   ('Diana Prince', '1990-03-22', 'Female', '(11) 99888-7766', 'Paris'),
   ('Peter Parker', '2001-10-10', 'Male', '(11) 99888-7766', 'New York');
