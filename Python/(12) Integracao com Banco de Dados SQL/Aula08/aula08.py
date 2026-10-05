# Aula08 - Resolução: Sistema de suporte técnico
import sqlite3
from typing import Literal, TypeAlias, Optional

Prioridade = Literal['BAIXA', 'MEDIA', 'ALTA']
StatusChamado = Literal['ABERTO', 'EM_ANDAMENTO', 'CONCLUIDO']
chamados_params: TypeAlias = tuple[str, str, Prioridade]

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

   def __executar_query(self, query: str, query_params: list[chamados_params] | chamados_params | tuple = ())-> int:
      is_insert = 'INSERT' in query

      try:
         if query_params and isinstance(query_params, (list, tuple)) and isinstance(query_params[0], (list, tuple)):
            self.__cursor.executemany(query, query_params)
         else:
            self.__cursor.execute(query, query_params)

         self.__connection.commit()

         return self.__cursor.lastrowid if is_insert else self.__cursor.rowcount
      except sqlite3.IntegrityError as error:
         self.__connection.rollback()
         return 0

   def abrir_chamado(self, cliente: str, descricao: str, prioridade: Prioridade) -> int:
      query = '''INSERT INTO chamados (cliente, descricao, prioridade)
         VALUES (?, ?, ?);'''
      
      return self.__executar_query(query, (cliente, descricao, prioridade))

   def importar_chamados(self, lista_chamados: list[chamados_params]) -> int:
      query = '''
         INSERT INTO chamados (cliente, descricao, prioridade) 
         VALUES (?, ?, ?);      
      '''

      self.__executar_query(query, lista_chamados)

      return self.__cursor.rowcount

   def listar_por_status(self, status: StatusChamado) -> list[dict]:
      query = '''
         SELECT * FROM chamados WHERE status = ?;
      '''

      return [dict(row) for row in self.__cursor.execute(query, (status,))]

   def atualizar_status(self, chamado_id: int, novo_status: StatusChamado) -> bool:
      query = '''
         UPDATE chamados SET status = ? WHERE id = ?;
      '''

      resultado = self.__executar_query(query, (novo_status, chamado_id))

      return resultado > 0

   def fechar_conexao(self) -> None:
      self.__connection.close()
   def excluir(self) -> str:
      self.__connection.execute('DROP TABLE chamados;')

lista_chamados = [
   ('Mike', 'Maquina desligando ao abrir programas com alto consumo de processamento', 'MEDIA'),
   ('Mary', 'Servidor superaquecendo e desligando impedindo acessos a ele', 'ALTA'),
   ('Freddy', 'Impressora nao conecta na maquina da recepcao', 'BAIXA'),
]

chamados = ChamadosDB()
chamados.abrir_chamado('John Doe', 'Relata problema de travamento na maquina', 'BAIXA') # OK
print(chamados.importar_chamados(lista_chamados)) # OK 
# print(chamados.listar_por_status('ABERTO'))
# print('Chamado atualizado' if chamados.atualizar_status(7, 'CONCLUIDO') else 'Erro ao atualizar chamado')
# chamados.excluir()
# chamados.fechar_conexao()