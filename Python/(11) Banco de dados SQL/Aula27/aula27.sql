-- https://app.diagrams.net
-- Aula27 - Resolução do Exercício 
CREATE DATABASE publisher;

-- Readers
CREATE TABLE IF NOT EXISTS readers(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   email VARCHAR(50) NOT NULL,
   birthdate Date,
   gender VARCHAR(20)
);

-- Authors
CREATE TABLE IF NOT EXISTS authors(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   birthdate Date,
   biography TEXT
);

-- Books
CREATE TABLE IF NOT EXISTS books(
   id SERIAL PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   category VARCHAR(20),
   publication_date DATE NOT NULL,
   isbn VARCHAR(20),
   resume TEXT NOT NULL
);

-- BookAuthors
CREATE TABLE IF NOT EXISTS book_authors(
   id SERIAL PRIMARY KEY,

   author_id INT NOT NULL,
   book_id INT NOT NULL,

   FOREIGN KEY (author_id) REFERENCES authors(id),
   FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Ratings
CREATE TABLE IF NOT EXISTS ratings(
   id SERIAL PRIMARY KEY,
   rating INT NOT NULL,
   comment TEXT NOT NULL,

   reader_id INT NOT NULL,
   book_id INT NOT NULL,
   
   FOREIGN KEY (reader_id) REFERENCES readers(id),
   FOREIGN KEY (book_id) REFERENCES books(id)
);