# Aula08 - Resolução: Sistema de suporte técnico

import sqlite3

connection = sqlite3.connect('ChamadosDB.db')
connection.row_factory = sqlite3.Row # Ja converte para dicionarios

cursor = connection.cursor()

cursor.execute('''
   CREATE TABLE IF NOT EXISTS chamados(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      cliente TEXT NOT NULL,
      descricao TEXT NOT NULL,
      prioridade TEXT NOT NULL CHECK (prioridade IN ('BAIXA', 'MEDIA', 'ALTA')),
      status TEXT NOT NULL CHECK (status IN ('ABERTO', 'EM_AMDAMENTO', 'CONCLUIDO'))
   );
''')

connection.commit()
connection.close()