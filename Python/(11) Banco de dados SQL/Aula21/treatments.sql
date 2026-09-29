-- Por fim, os tratamentos só podem ser criados para uma consulta específica, porém uma mesma consulta pode ter mais de um tratamento associado a ela. O tratamento deve possuir informações sobre os medicamentos a serem usados e uma descrição do tratamento em si.

CREATE TABLE treatments(
   id SERIAL PRIMARY KEY,
   medications TEXT,
   description TEXT,

   appointment_id INT,
   FOREIGN KEY (appointment_id) REFERENCES appointments (id)
);

-- Obter uma lista de todos os tratamentos prescritos em consultas, incluindo informações dos médicos e pacientes.

-- Obter todos os tratamentos em andamento de um determinado paciente.