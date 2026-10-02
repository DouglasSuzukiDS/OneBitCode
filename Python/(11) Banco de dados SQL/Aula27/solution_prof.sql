-- Active: 1790208447792@@127.0.0.1@5432@ex04
CREATE DATABASE ex04;

CREATE TABLE IF NOT EXISTS authors (  
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   biography TEXT,
   birthday DATE
);

CREATE TABLE IF NOT EXISTS genres (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS books (
   id SERIAL PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   genre_id INT NOT NULL REFERENCES genres(id),
   publication_date DATE,
   isbn VARCHAR(255),
   summary TEXT
);

CREATE TABLE IF NOT EXISTS book_authors (
   book_id INT,
   author_id INT,
   PRIMARY KEY (book_id, author_id),
   FOREIGN KEY (book_id) REFERENCES books(id),
   FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE IF NOT EXISTS readers (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   email VARCHAR(255) NOT NULL UNIQUE,
   password VARCHAR(255) NOT NULL,
   gender CHAR(1),
   birthday DATE
);

CREATE TABLE IF NOT EXISTS reviews (
   id SERIAL PRIMARY KEY,
   book_id INT NOT NULL REFERENCES books(id),
   readers_id INT NOT NULL REFERENCES readers(id),
   rating INT CHECK (rating >= 1 AND rating <= 5),
   comment TEXT
);

INSERT INTO authors (name) VALUES
   ('Rick Riordan'),
   ('J. R. R. Tolkien'),
   ('Rick Riordan'),
   ('Teste A'),
   ('Teste b');

INSERT INTO genres (name) VALUES
   ('Ficcao'),
   ('Nao Ficcao'),
   ('Biografia');

INSERT INTO books (title, genre_id) VALUES
   ('Percy Jackson', 1),
   ('O Senhor dos Aneia', 1),
   ('Livro 3', 2),
   ('Livro 4', 3);

INSERT INTO book_authors VALUES
   (1, 1),
   (2, 2),
   (3, 3),
   (4, 3),
   (4, 4);

INSERT INTO readers (email, password) VALUES(
   ('user1@email.com', '1234'),
   ('user2@email.com', '5678')
);

INSERT INTO reviews (book_id, readers_id, rating, comment) VALUES
   (1, 1, 4, 'Comentario ...'),
   (2, 1, 5, 'Comentario ...');