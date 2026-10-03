INSERT INTO movies (name, year, score) VALUES
   ('Como treinar seu Dragao', 2025, 7.7);

CREATE TABLE IF NOT EXISTS chamados(
   id PRIMARY KEY AUTOINCREMENT,
   cliente TEXT NOT NULL,
   descricao TEXT NOT NULL,
   prioridade TEXT NOT NULL CHECK (prioridade IN ('BAIXA', 'MEDIA', 'ALTA')),
   status TEXT NOT NULL CHECK (status IN ('ABERTO', 'EM_AMDAMENTO', 'CONCLUIDO'))
);