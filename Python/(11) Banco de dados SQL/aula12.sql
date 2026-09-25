-- Aula12 - Comandos Avançados de Consulta
INSERT INTO clients (name, phone, address) VALUES  
   ('Nadeen Nassy', '(894) 3770999', '344 Comanche Circle'),
   ('Rufe Woolforde', '(876) 3190195', '1199 Garrison Junction'),
   ('Erl Bumphrey', '(828) 4611193', '279 Carey Way'),
   ('Libbey Allbut', '(780) 9682663', '0 Tennyson Pass'),
   ('Vick Saterthwait', '(858) 2707342', '8098 Carpenter Crossing'),
   ('Valma Leathlay', '(988) 1855788', '52 Pankratz Point'),
   ('Cathrin Balcers', '(854) 2908154', '58 Kipling Alley'),
   ('Fidelity Hurleston', '(169) 2896946', '99412 Nova Place'),
   ('Lane Beggio', '(102) 4251437', '625 Mcguire Place'),
   ('Abigale Ofield', '(414) 2709709', '4526 Ronald Regan Point'),
   ('Melisse Stappard', '(828) 1752818', '4 Sunnyside Lane'),
   ('Vito Breach', '(516) 2554781', '86120 Towne Court'),
   ('Jessalin Duckett', '(333) 6498842', '02 Artisan Center'),
   ('Bo Collie', '(163) 2032492', '0 Straubel Terrace'),
   ('Raphaela Krates', '(916) 8872820', '7798 3rd Street'),
   ('Lucian Draxford', '(827) 4937186', '739 Toban Way'),
   ('Philippa Sidon', '(475) 4933015', '64985 Clarendon Way'),
   ('Cordie Voce', '(937) 6629079', '767 Prairieview Road'),
   ('Easter Petrescu', '(135) 9137473', '32 Dayton Crossing');

SELECT * FROM clients;

SELECT * FROM clients ORDER BY name DESC;
SELECT * FROM clients ORDER BY name ASC;
SELECT * FROM clients LIMIT 4;
SELECT * FROM clients ORDER BY name ASC LIMIT 4 OFFSET 4;
SELECT COUNT(id) as clients_count from clients;
SELECT SUM(quantity) AS Total FROM stock_ingredients;
SELECT AVG(quantity) FROM stock_ingredients;
SELECT * FROM clients WHERE name LIKE 'n%'; -- Que contenha o termo e qualquer quantidade de caracteres depois
SELECT * FROM clients WHERE name LIKE '%a%'; -- Que tenha qualquer quantidade de caracteres antes e depois do termo
SELECT * FROM clients WHERE name LIKE '_a%'; -- Que tenha qualquer caracteres antes do termo e qualquer quantidade depois do termo
SELECT * FROM snacks WHERE description LIKE '%tomate%'; -- Case sensitive
SELECT * FROM snacks WHERE description ILIKE '%PAO%'; -- Case insensitive