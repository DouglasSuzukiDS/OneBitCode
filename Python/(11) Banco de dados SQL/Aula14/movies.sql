-- Create Table
CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    rating DECIMAL(3, 2) NOT NULL,
    box_office DECIMAL(15, 2) NOT NULL,
    cost DECIMAL(15, 2) NOT NULL
);

-- Insert Values
INSERT INTO
    movies (
        title,
        director,
        release_year,
        genre,
        duration,
        rating,
        box_office,
        cost
    )
VALUES (
        'Mad Max: Fury Road',
        'George Miller',
        2015,
        'Ação',
        120,
        8.1,
        375200000.00,
        150000000.00
    ),
    (
        'Star Wars',
        'George Lucas',
        1977,
        'Sci-Fi',
        121,
        8.6,
        775398007.00,
        11000000.00
    ),
    (
        'Super Mario Bros',
        'Aaron Horvath, Michael Jelenic',
        2023,
        'Animação',
        92,
        7.3,
        1300000000.00,
        100000000.00
    ),
    (
        'Pride and Prejudice',
        'Joe Wright',
        2005,
        'Romance',
        129,
        7.8,
        121147947.00,
        28000000.00
    ),
    (
        'Back to the Future',
        'Robert Zemeckis',
        1985,
        'Sci-Fi',
        116,
        8.5,
        381109762.00,
        19000000.00
    ),
    (
        'The Godfather',
        'Francis Ford Coppola',
        1972,
        'Crime',
        175,
        9.2,
        246120974.00,
        6000000.00
    ),
    (
        'The Lord of the Rings: The Return of the King',
        'Peter Jackson',
        2003,
        'Fantasia',
        201,
        9.0,
        1146030912.00,
        94000000.00
    ),
    (
        'Treasure Planet',
        'Ron Clements, John Musker',
        2002,
        'Animação',
        95,
        7.2,
        109578115.00,
        140000000.00
    ),
    (
        'Jurassic Park',
        'Steven Spielberg',
        1993,
        'Aventura',
        127,
        8.1,
        1043580597.00,
        63000000.00
    ),
    (
        'About Time',
        'Richard Curtis',
        2013,
        'Romance',
        123,
        7.8,
        87100000.00,
        12000000.00
    ),
    (
        'Transformers',
        'Michael Bay',
        2007,
        'Ação',
        144,
        7.0,
        709709780.00,
        150000000.00
    )

-- Todos os filmes em ordem alfabética.
SELECT * FROM movies ORDER BY title ASC;

-- Todos os filmes com bilheteria acima de US$ 500 milhões.
SELECT * FROM movies WHERE box_office > 500000000;

-- Todos os filmes lançados antes dos anos 2000.
SELECT * FROM movies WHERE release_year < 2000;

-- Os títulos, anos de lançamento, gênero e avaliação dos filmes ordenados por sua avaliação pela crítica.
SELECT title, release_year, genre, rating FROM movies ORDER BY rating DESC;

-- A média de avaliação entre os filmes de até 2 horas e a média de avaliação dos filmes de mais de 2 horas (em colunas separadas).
SELECT 
   AVG(rating) FILTER (WHERE duration <= 120) AS rating_less_2, 
   AVG(rating) FILTER (WHERE duration > 120 ) AS rating_more_2
FROM movies;

-- Resolucao da aula
SELECT 
   AVG(CASE WHEN duration <= 120 THEN rating ELSE NULL END) AS avg_rating_up_to_2_hours,
   AVG(CASE WHEN duration > 120 THEN rating ELSE NULL END) AS avg_rating_over_2_hours
FROM movies;

-- Os nomes, anos de lançamento e avaliações dos filmes ordenados pelo lucro obtido, além do próprio lucro obtido (considere lucro como bilheteria - custo).
SELECT 
   title, release_year, rating, (box_office - cost) AS profit 
FROM movies ORDER BY profit DESC;