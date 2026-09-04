# Aula05 - Resolução: validador de dados | testes
'''
   Problema 1: Validador de dados
      Enunciado:
         Crie funções que validam dados e levantam exceções:

      validar_idade(idade) - Levanta ValueError se < 0 ou > 150
      validar_senha(senha) - Levanta ValueError se < 8 caracteres ou não possui ao menos 1 letra [a-zA-Z]{1} e 1 número \d

      Exemplo:
         validar_idade(25)  # OK (retorna None)
         validar_idade(-5)  # ValueError

         validar_senha("abc")  # ValueError: Senha muito curta
         validar_senha("senha123")  # OK (retorna None)
'''
def ex01():
   pass

'''
   Problema 2: Testes unitários com pytest
      Enunciado:
         Escreva testes para as funções/classes do problema 1 usando pytest:

      Teste casos válidos usando a palavra-chave nativa assert
      Teste casos que levantam erro usando pytest.raises
      Use fixtures se necessário para inicializar objetos/dados repetitivos

      Exemplo:
         import pytest

         # --- Testes de Funções Isoladas ---
         def test_idade_valida():
            assert validar_idade(25) is None

         def test_idade_negativa():
            with pytest.raises(ValueError):
               validar_idade(-5)
'''

def ex02():
   pass

'''
   Dificuldades?
      Problema 1:
         Use try/except ao testar
         Escreva mensagem de erro clara
      Problema 2:
         Crie funções isoladas que comecem com o prefixo test_ para cada cenário.
         Teste no mínimo 2 casos por função (um caso de sucesso e um de falha).
         Use @pytest.fixture para instanciar objetos que serão reutilizados em múltiplos testes.
         Rode os testes no terminal usando simplesmente o comando: pytest
'''