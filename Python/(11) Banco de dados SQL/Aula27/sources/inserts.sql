-- 1. Inserir Autores
INSERT INTO authors (name, birthdate, biography) VALUES
('Machado de Assis', '1839-06-21', 'Um dos maiores nomes da literatura brasileira, fundador da Academia Brasileira de Letras.'),
('Clarice Lispector', '1920-12-10', 'Escritora e jornalista nascida na Ucrânia e naturalizada brasileira, autora de romances marcantes.'),
('George Orwell', '1903-06-25', 'Escritor e ensaísta britânico, conhecido pelas suas obras de crítica social e distopia.');

-- 2. Inserir Livros
INSERT INTO books (title, category, publication_date, isbn, resume) VALUES
('Dom Casmurro', 'Ficção', '1899-01-01', '9788535902778', 'A história de Bentinho e a sua dúvida obsessiva sobre a fidelidade de Capitu.'),
('A Hora da Estrela', 'Ficção', '1977-10-01', '9788535914849', 'A vida simples e trágica de Macabéa, uma datilógrafa nordestina no Rio de Janeiro.'),
('1984', 'Distopia', '1949-06-08', '9788535902785', 'Uma crítica ao totalitarismo num mundo vigiado constantemente pelo Grande Irmão.'),
('Obra Coletiva: Grandes Vozes', 'Ensaios', '2023-05-15', '9788535999999', 'Uma compilação especial que reúne ensaios de múltiplos autores renomeados.');

-- 3. Vincular Livros e Autores (Relacionamento N:N)
INSERT INTO book_authors (author_id, book_id) VALUES
(1, 1), -- Machado de Assis -> Dom Casmurro
(2, 2), -- Clarice Lispector -> A Hora da Estrela
(3, 3), -- George Orwell -> 1984
(1, 4), -- Machado de Assis -> Obra Coletiva (Coautoria)
(2, 4); -- Clarice Lispector -> Obra Coletiva (Coautoria)

-- 4. Inserir Leitores (Incluindo leitores anónimos com name = NULL)
INSERT INTO readers (name, email, birthdate, gender) VALUES
('João Silva', 'joao.silva@email.com', '1995-04-12', 'Masculino'),
('Maria Santos', 'maria.santos@email.com', '1988-11-23', 'Feminino'),
(NULL, 'anonimo1@email.com', '2000-01-15', 'Prefiro não dizer'), -- Leitor Anónimo
(NULL, 'anonimo2@email.com', NULL, NULL);                    -- Leitor Anónimo com dados opcionais nulos

-- 5. Inserir Avaliações e Resenhas
INSERT INTO ratings (rating, comment, reader_id, book_id) VALUES
(5, 'Uma obra-prima da literatura! A dúvida sobre Capitu é fascinante.', 1, 1),
(4, 'Muito bom, escrita tocante e emocionante.', 2, 2),
(5, 'Assustadoramente atual. Leitura obrigatória!', 3, 3), -- Avaliação feita por leitor anónimo
(3, 'Gostei da compilação de ensaios, mas alguns capítulos são densos.', 4, 4);