# Aula03 - Manipulando arquivos
from pathlib import Path
import shutil
import tempfile

arquivo_origem = Path('documentos/exemplo.txt')
pasta_destino = Path('backups/v1')
pasta_destino.mkdir(parents=True, exist_ok=True)  # Cria a pasta de destino se não existir

# destino = shutil.copy2(arquivo_origem, pasta_destino)  # Copia o arquivo para a pasta de destino com seus metadados

# shutil.move(arquivo_origem, pasta_destino / 'exemplo2.txt')  # Move o arquivo para a pasta de destino

if not arquivo_origem.exists():
   exit()

info = arquivo_origem.stat()  # Obtém informações sobre o arquivo
print(f'Tamanho do arquivo: {info.st_size / 1024} kb')
print(f'Tamanho do arquivo: {info.st_size / 1024 / 1024} mb')

# arquivo_origem.unlink(missing_ok=True)  # Remove o arquivo sem lancar erro se ele não existir

'''with tempfile.NamedTemporaryFile(delete=True, suffix='.csv') as temp_file:
   caminho_temporario = Path(temp_file.name)
   print(f'Arquivo temporário criado em: {caminho_temporario}')

   temp_file.write(b'id;status\n101\sucesso\n102;pendend\n')  # Escreve conteúdo no arquivo temporário
   temp_file.flush()  # Garante que os dados sejam gravados no arquivo'''

diretorio_origem = Path('documentos')

shutil.make_archive(
   base_name='documentos', 
   format='zip',
   root_dir=diretorio_origem)  # Cria um arquivo zip do diretório de origem

shutil.unpack_archive(
   filename='documentos.zip',
   extract_dir='backups/v2')  # Extrai o arquivo zip para o diretório especificado