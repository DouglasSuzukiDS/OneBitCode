# Aula-03 - Utilizando o Pathlib
from pathlib import Path

p1 = Path('dados', 'teste.txt')
print(p1)
print(type(p1))
print(p1.name)
print(p1.stem) # Pega o que vem antes do .
print(p1.suffix) # Pega o que vem depois do .
print(p1.exists())

if p1.exists():
   with open(p1, 'r', encoding='utf-8') as file:
      print(file.read())

p2 = Path('dados')
print(list(p2.iterdir())) # Verifica os arquivos existentes no diretorio