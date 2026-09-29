-- Active: 1790208447792@@127.0.0.1@5432@aula_relacionamentos
-- Aula18 - Relacionamentos 1:1 e 1:n
CREATE DATABASE aula_relacionamentos;

CREATE TABLE employees(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phone VARCHAR(30)
);

CREATE TABLE addresses(
   id SERIAL PRIMARY KEY,
   street VARCHAR(255) NOT NULL,
   number VARCHAR(10),
   complement VARCHAR(255),
   city VARCHAR(255) NOT NULL,

   employee_id INT UNIQUE,
   FOREIGN KEY (employee_id) REFERENCES employees (id)
);

CREATE TABLE departments(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

ALTER TABLE employees ADD COLUMN department_id INT;

ALTER TABLE employees ADD CONSTRAINT fk_department 
   FOREIGN KEY (department_id) REFERENCES departments (id);

DROP TABLE address;
DROP TABLE employees;

# Relacionamento 1:N
CREATE TABLE employees(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phone VARCHAR(30),

   department_id INT NOT NULL,
   FOREIGN KEY (department_id) REFERENCES departments (id)
);

# Recriar a table address

-- Comece pelos departamentos, a tabela mais independente
INSERT INTO departments (name) 
   VALUES ('Imprensa'), ('Investigação'), ('Diplomacia');

-- Insira os funcionários
INSERT INTO employees (name, phone, department_id) 
	VALUES ('Clark Kent', '1111-1111', 1);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Bruce Wayne', '2222-2222', 2);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Diana Prince', '3333-3333', 3);

INSERT INTO employees (name, phone, department_id)
	VALUES ('John Jones', '4444-4444', 2);
	
-- Confira os IDs de cada um
SELECT * FROM employees;

-- A partir disso, insira os endereços
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua A', 'Metropolis', 1);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua B', 'Gotham', 2);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua C', 'Themyscira', 3);

-- Repare que agora não é possível inserir mais endereços para esses IDs
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Fazenda Kent', 'Smallville', 1);

SELECT * FROM employees JOIN addresses 
   ON employees.id = addresses.employee_id;

SELECT * FROM employees JOIN departments 
   ON employees.department_id = departments.id;

SELECT employees.id, employees.name, phone, departments.name FROM employees JOIN departments 
   ON employees.department_id = departments.id;

SELECT * FROM departments JOIN employees 
   ON departments.id = employees.department_id;

SELECT 
   employees.id AS ID_do_funcionario,
   employees.name AS nome_do_funcionario,
   employees.phone AS Telefone,
   departments.id AS ID_do_departamento,
   departments.name AS Departamento
FROM departments JOIN employees 
ON departments.id = employees.department_id;