-- Aula11 - Consultando Linhas de uma Tabela

SELECT * FROM clients;

SELECT * FROM suppliers;
SELECT id, name, phone, email FROM suppliers;

SELECT * FROM stock_ingredients WHERE quantity < 20;
SELECT * FROM stock_ingredients;

SELECT id, name, description, price FROM snacks;
SELECT 
   id AS Codigo, name AS Lanche, description AS Descricao, price as PRECO
FROM snacks;

SELECT * FROM stock_ingredients WHERE category = 'Diversos';
SELECT * FROM stock_ingredients WHERE category = 'Diversos' AND quantity < 25;
SELECT * FROM stock_ingredients WHERE category = 'Diversos' OR category = 'Frutas';
SELECT * FROM stock_ingredients WHERE category IN ('Carnes', 'Frutas');