import os
import re

# Usa a pasta do script como base, independentemente da pasta do terminal.
PASTA_SCRIPT = os.path.dirname(os.path.abspath(__file__))

# Arquivo de entrada
ARQUIVO_ENTRADA = os.path.join(PASTA_SCRIPT, "text.txt")

# Pasta onde os exercícios serão criados
PASTA_SAIDA = PASTA_SCRIPT


def criar_exercicios():
   # Lê o arquivo TXT
   with open(ARQUIVO_ENTRADA, "r", encoding="utf-8") as arquivo:
      conteudo = arquivo.read()

   # Procura cada "Desafio XX"
   padrao = r"(Desafio\s+(\d+)\s*:.*?)(?=Desafio\s+\d+\s*:|\Z)"

   exercicios = re.findall(
      padrao,
      conteudo,
      flags=re.DOTALL | re.IGNORECASE
   )

   if not exercicios:
      print("Nenhum exercício encontrado.")
      return

   for exercicio_completo, numero in exercicios:
      numero = int(numero)

      # Nome da pasta e do arquivo
      nome_exercicio = f"ex{numero:02d}"
      pasta_exercicio = os.path.join(
         PASTA_SAIDA,
         nome_exercicio
      )

      arquivo_js = os.path.join(
         pasta_exercicio,
         f"{nome_exercicio}.js"
      )

      # Cria a pasta
      os.makedirs(pasta_exercicio, exist_ok=True)

      # Remove espaços/quebras desnecessárias do começo e fim
      enunciado = exercicio_completo.strip()

      # Conteúdo do arquivo JS
      conteudo_js = f"""/*
{enunciado}
*/


// ========================================
// SOLUÇÃO
// ========================================


"""
   # Cria o arquivo JS
   with open(arquivo_js, "w", encoding="utf-8") as arquivo:
      arquivo.write(conteudo_js)

   print(f"Criado: {arquivo_js}")

   print("\nTodos os exercícios foram processados.")


if __name__ == "__main__":
   criar_exercicios()
