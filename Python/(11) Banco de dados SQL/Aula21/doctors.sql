-- Os médicos devem possuir nome completo, telefone e também uma especialização (da tabela de especializações).

CREATE TABLE doctors (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phone VARCHAR(15) NOT NULL,
   
   specialties_id INT, 
   FOREIGN KEY (specialties_id) REFERENCES specialties (id)
);

INSERT INTO doctors (name, phone, specialties_id) VALUES
   ('Stephen Strange', '(11) 97777-1111', 1), 
   ('Bruce Banner', '(11) 98888-2222', 2), 
   ('Michael Morbius', '(11) 99999-3333', 1), 
   ('Donald Blake', '(11) 96666-4444', 3), 
   ('Harleen Quinzel', '(11) 95555-5555', 6), 
   ('Midnighter', '(11) 94444-6666', 2), 
   ('Jane Foster', '(11) 93333-7777', 3), 
   ('Reed Richards', '(11) 92222-8888', 5), 
   ('Charles McNider', '(11) 91111-9999', 7), 
   ('Curt Connors', '(11) 90000-0000', 5);

-- Obter todas as consultas de um determinado médico, incluindo informações dos pacientes e observações.

-- Obter todos os médicos com suas respectivas especializações.