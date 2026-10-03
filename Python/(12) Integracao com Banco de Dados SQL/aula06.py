# Aula06 - Atualizando e removendo dados de uma tabela (SQLite)

import sqlite3

connection = sqlite3.connect('database.db')
connection.row_factory = sqlite3.Row # Ja converte para dicionarios

cursor = connection.cursor()

cursor.execute('''
  UPDATE movies SET name = ? WHERE id = ?;
''', ('Outro nome', 5))

filme_excluido = cursor.execute("""
   DELETE FROM movies WHERE id = ? RETURNING id,name;
""", (6,)).fetchone()

if not filme_excluido:
   print('Nenhum filme foi encontrado')
else:
   print(f'O filme {filme_excluido['name']} foi excluido. Id {filme_excluido['id']}')

print(cursor.rowcount) # Mostra as linhas afetadas

connection.commit()

connection.close()