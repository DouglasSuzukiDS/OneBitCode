# Aula02 - Criando um banco de dados (SQLite)
import sqlite3

connection = sqlite3.connect('database.db') # Se o arquivo nao existir, ele cria

print(connection.total_changes)

connection.close()