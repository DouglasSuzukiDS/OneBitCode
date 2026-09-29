-- Aula15 - Atualização e Exclusão de Linhas

SELECT * FROM series;
UPDATE series SET status = 'Airing' WHERE status = 'Em Andamento';
UPDATE series SET status = 'Ended' WHERE status = 'Finalizada';
SELECT id, title, status FROM series;

SELECT * FROM movies;
UPDATE movies SET title = 'Star Wars A New Hope', genre = 'Sci-Fi/Fantasy' WHERE title = 'Star Wars';
SELECT id, title, genre FROM movies;
DELETE FROM series WHERE title = 'The Office';
DELETE FROM series WHERE release_year < 2000 AND seasons > 5;
SELECT * FROM series;