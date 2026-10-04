# Aula08 - Resolução: Sistema de suporte técnico
import sqlite3
from typing import Literal

Prioridade = Literal['BAIXA', 'MEDIA', 'ALTA']

class ChamadosDB:
   def __init__(self, db_name: str = "database.db"):
      self.__connection = sqlite3.connect(db_name)
      self.__connection.row_factory = sqlite3.Row # Ja converte para dicionarios
      self.__cursor = self.__connection.cursor()

      query = '''CREATE TABLE IF NOT EXISTS chamados(
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               cliente TEXT NOT NULL,
               descricao TEXT NOT NULL,
               prioridade TEXT NOT NULL CHECK (prioridade IN ('BAIXA', 'MEDIA', 'ALTA')),
               status TEXT NOT NULL DEFAULT 'ABERTO' CHECK (status IN ('ABERTO', 'EM_ANDAMENTO', 'CONCLUIDO'))
            );'''

      self.__executar_query(query)

      print(f"Banco '{db_name}' e tabela 'chamados' inicializados com sucesso.")

   def __executar_query(self, query: str, query_params: tuple = ()) -> int:
      try:
         if query_params and isinstance(query_params, (list, tuple)) and isinstance(query_params[0], (list, tuple)):
            self.__cursor.executemany(query, query_params)
         else:
            self.__cursor.execute(query, query_params)

         self.__connection.commit()

         return self.__cursor.lastrowid
      except sqlite3.IntegrityError as error:
         return 0

   def abrir_chamado(self, cliente: str, descricao: str, prioridade: Prioridade) -> int:
      query = '''INSERT INTO chamados (cliente, descricao, prioridade )
         VALUES (?, ?, ?);'''
      
      resultado = self.__executar_query(query, (cliente, descricao, prioridade))

      return resultado

   def importar_chamados(self, lista_chamados: list[tuple[str, str, Prioridade]]) -> int:
      pass
