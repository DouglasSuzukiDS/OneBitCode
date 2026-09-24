-- Aula10 - Inserindo Linhas em uma Tabela
INSERT INTO clients (name, address, phone, created_at) 
   VALUES('Nick', 'Rua A, numero 12', '(11) 99876-5432', '2026-09-23');

INSERT INTO suppliers (name, phone, email, notes)
   VALUES ('ACME Inc.', '(11) 99876-5433', 'acme@email.com', 'N/A');

INSERT INTO snacks (name, description, price)
   VALUES ('Hamburguer', 'Pao, carne, alface, tomate, molho especial, batata palha', '8');

INSERT INTO stock_ingredients (name, category, quantity)
   VALUES 
      ('Ovos', 'Diversos', 24),
      ('Tomate', 'Frutas', 14),
      ('Queijo', 'Diversos', 40),
      ('Presunto', 'Carnes', 40);
 