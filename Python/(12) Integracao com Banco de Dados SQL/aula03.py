# Aula03 - Criando uma tabela (SQLite)
import sqlite3

connection = sqlite3.connect('database.db')
cursor = connection.cursor()

cursor.execute('''
   CREATE TABLE movies(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      year INTEGER NOT NULL,
      score REAL NOT NULL
   );
''')

connection.close()