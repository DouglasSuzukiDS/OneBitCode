-- Create Tables
CREATE TABLE IF NOT EXISTS series (
   id SERIAL PRIMARY KEY, 
   title VARCHAR(255) NOT NULL,
   creator VARCHAR(255) NOT NULL,
   release_year INT NOT NULL,
   genre VARCHAR(255) NOT NULL,
   seasons INT NOT NULL,
   episodes INT NOT NULL,
   rating DECIMAL(3, 2) NOT NULL,
   channel VARCHAR(255) NOT NULL,
   status VARCHAR(255) NOT NULL
);

-- Insert Values
INSERT INTO series (title, creator, release_year, genre, seasons, episodes, rating, channel, status) VALUES
   ('Breaking Bad', 'Vince Gilligan', '2008', 'Drama', '5', '62', '9.5', 'AMC', 'Finalizada'),
   ('Game of Thrones', 'David Benioff, D.B. Weiss', '2011', 'Fantasia', '8', '73', '9.3', 'HBO', 'Finalizada'),
   ('Stranger Things', 'The Duffer Brothers', '2016', 'Sci-Fi', '4', '34', '8.7', 'Netflix', 'Em Andamento'),
   ('Friends', 'David Crane, Marta Kauffman', '1994', 'Comédia', '10', '236', '8.9', 'NBC', 'Finalizada'),
   ('The Office', 'Greg Daniels', '2005', 'Comédia', '9', '201', '8.8', 'NBC', 'Finalizada'),
   ('Vikings', 'Michael Hirst', '2013', 'Drama Histórico', '6', '89', '8.5', 'History Channel', 'Finalizada'),
   ('Lost', 'J.J. Abrams, Damon Lindelof', '2004', 'Mistério', '6', '121', '8.4', 'ABC', 'Finalizada'),
   ('Once Upon a Time', 'Edward Kitsis, Adam Horowitz', '2011', 'Fantasia', '7', '155', '7.7', 'ABC', 'Finalizada'),
   ('The Mentalist', 'Bruno Heller', '2008', 'Crime', '7', '151', '8.1', 'CBS', 'Finalizada'),
   ('Star Trek', 'Gene Roddenberry', '1966', 'Sci-Fi', '3', '79', '8.4', 'NBC', 'Finalizada'),
   ('Cobra Kai', 'Josh Heald, Jon Hurwitz, Hayden Schlossberg', '2018', 'Ação', '5', '50', '8.6', 'Netflix', 'Em Andamento')

-- Os IDs, nomes, anos de lançamento, gêneros, número de temporadas e episódios, avaliações e situações das séries, ordenadas da mais recente para a mais antiga.
SELECT id, title, release_year, genre, seasons, episodes, rating, status FROM series ORDER BY release_year DESC;

-- Todas as séries já finalizadas ordenadas da melhor avaliação para a pior.
SELECT * FROM series WHERE status = 'Finalizada' ORDER BY rating DESC;