-- FOi pedido a AI contextos de queries para que se construa as queries

-- Nível Básico
-- Listar todos os livros: Escreve uma consulta para selecionar todos os campos de todos os livros cadastrados, ordenados pelo título em ordem alfabética.
SELECT * FROM books ORDER BY title;

-- Filtrar por categoria: Seleciona o título e a data de publicação dos livros que pertencem à categoria 'Ficção'.
SELECT title, publication_date 
FROM books 
WHERE category = 'Ficção';

-- Leitores sem nome: Seleciona o e-mail de todos os leitores que se cadastraram sem informar o nome (NULL).
SELECT email from readers WHERE name IS NULL;

-- Avaliações com nota máxima: Lista o comentário e a nota de todas as avaliações que receberam nota 5.
SELECT comment, rating 
FROM rating 
WHERE rating = 5;

-- Nível Intermediário (JOINs)
-- Livros e seus Autores: Consulta o título do livro, a categoria e o nome do seu autor. (Lembre-se de usar a tabela book_authors para fazer a ponte).
SELECT b.title, b.category, a.name AS author_name
FROM book_authors
JOIN books b ON book_authors.book_id = b.id
JOIN authors a ON book_authors.author_id = a.id;

-- Avaliações e Livros: Mostra o título do livro, a nota e o comentário de cada avaliação registrada no sistema.
SELECT title, rating, r.comment
FROM books b
JOIN ratings r ON r.book_id = b.id;

-- Detalhes da Avaliação com Leitor: Cria uma consulta que exiba o título do livro, a nota, o comentário e o nome do leitor. Se o leitor for anônimo, deve aparecer a palavra 'Anônimo'.
SELECT b.title, rating, comment, COALESCE(r.name, 'Anônimo') AS reader_name
FROM ratings
JOIN books b ON ratings.book_id = b.id
JOIN readers r ON ratings.reader_id = r.id;

-- Livros de um Autor Específico: Busca todos os livros associados ao autor 'Machado de Assis'.
SELECT b.title
FROM book_authors
JOIN books b ON book_authors.book_id = b.id
JOIN authors a ON book_authors.author_id = a.id
WHERE a.name = 'Machado de Assis';

-- Nível Avançado (Agrupamentos e Funções de Agregação)
-- Média de Notas por Livro: Exibe o título do livro e a média de suas notas de avaliação. Ordene da maior para a menor média.
SELECT title, ROUND(avg(r.rating), 2) AS average_rating
FROM books
JOIN ratings r ON books.id = r.book_id
GROUP BY books.id, books.title
ORDER BY average_rating DESC;

-- Quantidade de Livros por Autor: Conta quantos livros cada autor possui cadastrado no sistema.
SELECT a.name AS author, COUNT(b.id) AS book_quantity
FROM book_authors
JOIN books b ON book_authors.book_id = b.id
JOIN authors a ON book_authors.author_id = a.id
GROUP BY a.id, a.name;

-- Total de Avaliações por Leitor: Mostra o e-mail do leitor e o total de avaliações que ele já realizou.
SELECT r.email, COUNT(ratings.id) AS rating_quantity
FROM ratings
JOIN readers r ON ratings.reader_id = r.id
GROUP BY r.id, r.email;

-- Livros com Múltiplos Autores: Escreve uma consulta que liste apenas os livros que possuem mais de 1 autor cadastrado.
SELECT title
FROM books
JOIN book_authors ba ON books.id = ba.book_id
GROUP BY b.id, books.title
HAVING COUNT(ba.author_id) > 1;