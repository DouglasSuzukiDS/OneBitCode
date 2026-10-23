# Aula24 - Assincronicidade no Python
import time

def preparar_prato_sincrono(nome_prato: str, tempo: int):
   print(f'Comecou a preparar: {nome_prato}')
   time.sleep(tempo) # Pausa o codigo
   print(f'Prato pronto: {nome_prato}')

def principal_sincrono():
   tempo_inicial = time.time() # Tempo atual

   # Execita um de cada vez, de forma sequencial
   preparar_prato_sincrono('Lasanha', 3)
   preparar_prato_sincrono('Salada', 1)

   tempo_total = time.time() - tempo_inicial
   print(f'Tempo total gasto: {tempo_total:.2f} segundos')

if __name__ == '__main__':
   principal_sincrono()