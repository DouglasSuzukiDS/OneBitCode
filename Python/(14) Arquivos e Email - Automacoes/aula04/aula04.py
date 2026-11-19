# Aula04 - Monitoramento de pastas em tempo real
import time
from pathlib import Path
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

PASTA_MONITORADA = Path.cwd() / 'entrada'
PASTA_MONITORADA.mkdir(exist_ok=True)

def aguardar_conclusao_gravacao(
   caminha: Path, tentativas: int = 10, esperar: float = 0.5
) -> bool:
   tamanho_anterior = -1 # Verifica se o tamanho do arquivo parou de crescer e se ele pode ser aberto

   for _ in range(tentativas):
      # Se o tamanho nao mudou e e maior que zero, tenta abrir em modo exlucivo
      tamanho_atual = caminha.stat().st_size

      try:
         if tamanho_atual == tamanho_anterior and tamanho_atual > 0:
            with open(caminha, 'r'):
               return True

         tamanho_anterior = tamanho_atual
      except Exception (OSError, PermissionError):
         pass

      time.sleep(esperar)

   return False

class ManipuladorArquivos(FileSystemEventHandler):
   def on_created(self, event):
      if event.is_directory:
         return

      caminho_arquivo = Path(event.src_path)
      print(f'\n[Detectado] Novo arquivo recebido: {caminho_arquivo.name}')

      if caminho_arquivo.suffix in ['.tmp', '.crdownload']:
         print(f'[Ignorado] Arquivo temporário: {caminho_arquivo.name}')
         return

      print(f'-> Disparando automacao para processar: {caminho_arquivo.name}')

   def on_modified(self, event):
      print(f'Modificado')
   

def iniciar_monitoramento():
   event_handler = ManipuladorArquivos()
   observer = Observer()

   observer.schedule(event_handler, path=str(PASTA_MONITORADA), recursive=False)
   observer.start()

   print(f'👀 Sentinela ativo vigiando> {PASTA_MONITORADA.resolve()}')
   print('Pressione Ctrl+C para interromper.')

   try:
      while True:
         time.sleep(1)
   except KeyboardInterrupt:
      observer.stop()
      print('\nMonitoramento encerrado com sucesso.')

   observer.join()

if __name__ == '__main__':
   iniciar_monitoramento()