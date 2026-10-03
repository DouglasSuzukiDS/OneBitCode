# Aula05 - Lendo dados de uma tabela (SQLite)

import sqlite3

connection = sqlite3.connect('database.db')
connection.row_factory = sqlite3.Row # Ja converte para dicionarios

cursor = connection.cursor()

data = cursor.execute('''
  SELECT * FROM movies ORDER BY id DESC;
''')

# fetchall, fetchone, fetchmany(QTD)
# print(data.fetchmany(2)) 
print(dict(data.fetchone()))
print(tuple(data.fetchone()))
print(data.fetchone()['name'])

connection.close()