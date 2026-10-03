# Aula04 - Inserindo dados na tabela (SQLite)
import sqlite3

connection = sqlite3.connect('database.db')
cursor = connection.cursor()

# name = input('Nome do filme: \n')
# year = input('Ano de lancamento: \n')
# score = float(input('Nota do filme: \n'))

# Aqui da uma brecha de seguranca para rodarem um SQL Injection
# cursor.execute(f"""
#    INSERT INTO movies (name, year, score) VALUES
#       ('{name}', {year}, {score});
# """)

# Com tuplas
# cursor.execute(f"""
#    INSERT INTO movies (name, year, score) VALUES
#       (?, ?, ?);
# """, (name, year, score))

movie = {'name': 'Homem Aranha', 'year': 2026, 'score': 9.0}

# Com Dicionario
# cursor.execute(f"""
#    INSERT INTO movies (name, year, score) VALUES
#       (:name, :year, :score);
# """, movie)

# Insercao de multiplos valores
movies_list = [
   ('A casa Winchester', 2018, 8.5),
   ('Annabelle', 2014, 8.3),
   ('Sobrenatural', 2010, 9.0),
]

cursor.executemany("""
   INSERT INTO movies (name, year, score) VALUES
      (?, ?, ?);
""", movies_list)

connection.commit() # Confirma as operacoes
connection.close()