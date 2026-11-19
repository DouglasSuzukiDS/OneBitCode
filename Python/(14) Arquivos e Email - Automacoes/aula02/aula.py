# Aula02 - Manipulando diretórios 
from pathlib import Path
import shutil

diretorio_atual = Path.cwd() 
print(f'Diretório atual: {diretorio_atual}') # Apartir do executavel Python
print(f'Diretório do arquivo: {Path(__file__)}')

diretorio_home = Path.home()
print(f'Diretório home: {diretorio_home}')

diretorio_documentos = diretorio_atual / 'documentos'
print(f'Diretório documentos: {diretorio_documentos}')

arquivo = diretorio_documentos / 'exemplo.pdf'
print(f'Nome do arquivo.............: {arquivo.name}')
print(f'Nome do arquivo sem extensao: {arquivo.stem}')
print(f'Extensao do arquivo.........: {arquivo.suffix}')
print(f'Diretório do arquivo........: {arquivo.parent}')
print(f'Arquivo existe?.............: {arquivo.exists()}')

if not arquivo.exists():
   exit()

print(arquivo.is_dir())

# pasta_destino = diretorio_atual / 'backups' / 'v1'
# pasta_destino.mkdir(parents=True, exist_ok=True) # Cria a pasta destino, caso não exista, incluindo as pastas pai (parents=True) e não gera erro se já existir (exist_ok=True)

'''
todos_items = [item.name for item in diretorio_documentos.iterdir()]
arquivos_txt = list(diretorio_documentos.glob('*.txt')) # Lista todos os arquivos com extensão .txt
print(f'Todos os itens do diretório documentos: {todos_items}')
print(f'Todos os arquivos .txt do diretório documentos: {[arquivo.name for arquivo in arquivos_txt]}')
'''

arquivo_exemplo = diretorio_documentos / 'exemplo.txt'

if not arquivo_exemplo.exists():
   exit()

# arquivo_exemplo.rename(diretorio_documentos / 'temp' / 'exemplo.txt') # Move e renomeia o arquivo
destino = diretorio_documentos / 'temp' / 'exemplo.txt'
destino.parent.mkdir(parents=True, exist_ok=True) # Cria a pasta destino, caso não exista, incluindo as pastas pai (parents=True) e não gera erro se já existir (exist_ok=True)
arquivo_exemplo.replace(destino) # Move e renomeia o arquivo

# (diretorio_documentos / 'temp').rmdir() # Remove a pasta temp, caso esteja vazia
shutil.rmtree(diretorio_documentos / 'temp') # Remove a pasta temp, mesmo que não esteja vazia