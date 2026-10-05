import sqlite3
from typing import List, Tuple, Dict, Any
from enum import Enum

class Prioridade(str, Enum):
   BAIXA = 'BAIXA'
   MEDIA = 'MEDIA'
   ALTA = 'ALTA'

class StatusChamado(str, Enum):
   ABERTO = 'ABERTO'
   EM_ANDAMENTO = 'EM_ANDAMENTO'
   CONCLUIDO = 'CONCLUIDO'

class ChamadosDB:
   def __init__(self, db_name: str ='chamados.db'):
      self.connection = sqlite3.connect(db_name)
      self.connection.row_factory = sqlite3.Row
      self._criar_tabela()

   def _criar_tabela(self) -> None:
      self.connection.execute('''
         CREATE TABLE IF NOT EXISTS chamados(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         cliente TEXT NOT NULL,
         descricao TEXT NOT NULL,
         prioridade TEXT NOT NULL CHECK(prioridade IN ('BAIXA', 'MEDIA', 'ALTA')),
         status TEXT NOT NULL CHECK(status IN ('ABERTO', 'EM_ANDAMENTO', 'CONCLUIDO'))
      );     
   ''')

   def abrir_chamado(self, cliente: str, descricao: str, prioridade: Prioridade):
    query = """
      INSERT INTO chamados (cliente, descricao, prioridade, status)
      VALUES (?, ?, ?, ?);
    """

    with self.connection:
      cursor = self.connection.cursor()

      cursor.execute(
        query, (cliente, descricao, prioridade.value, StatusChamado.ABERTO.value)
      )

      return cursor.lastrowid

   def importar_chamados(self, lista_chamados: List[Tuple[str, str, Prioridade]]):
    query = """
      INSERT INTO chamados (cliente, descricao, prioridade, status)
      VALUES (?, ?, ?, ?);
    """

    dados_formatados = [
      (cliente, descricao, prioridade.value, StatusChamado.ABERTO.value)
      for cliente, descricao, prioridade in lista_chamados
    ]

    with self.connection:
      cursor = self.connection.cursor()
      cursor.executemany(query, dados_formatados)
      return cursor.rowcount

   def listar_por_status(self, status: StatusChamado):
      query = "SELECT * FROM chamados WHERE status = ? ORDER BY id DESC;"
      cursor = self.connection.cursor()
      data = cursor.execute(query, (status.value,))
      return [dict(row) for row in data]

   def atualizar_status(self, chamado_id: int, novo_status: StatusChamado):
      query = "UPDATE chamados SET status = ? WHERE id = ?"

      with self.connection:
         cursor = self.connection.cursor()
         cursor.execute(query, (novo_status.value, chamado_id))
         return cursor.rowcount > 0

   def fechar_conexao(self):
      self.connection.close()

if __name__ == '__main__':
   app_db = ChamadosDB()

# id1 = app_db.abrir_chamado("Empresa Alpha", "Servidor fora do ar", Prioridade.ALTA)
#   print(f"Chamado #{id1} criado com prioridade {Prioridade.ALTA.value}.")

'''lote = [
   ("Empresa Beta", "Dúvida sobre fatura", Prioridade.BAIXA),
   ("Empresa Gamma", "Erro na emissão de nota", Prioridade.MEDIA)
]
app_db.importar_chamados(lote)'''

print("\n2. Atualizando status do chamado #1 para EM_ANDAMENTO...")
app_db.atualizar_status(1, StatusChamado.EM_ANDAMENTO)

for chamado in app_db.listar_por_status(StatusChamado.EM_ANDAMENTO):
   print(f"  [#{chamado['id']}] {chamado['cliente']} - {chamado['descricao']} | Status: {chamado['status']}")

try:
   with app_db.connection:
      app_db.connection.execute(
      "INSERT INTO chamados (cliente, descricao, prioridade, status) VALUES (?, ?, ?, ?)",
      ("Empresa Teste", "Teste inválido", "BAIXA", "ABERTA")
      )
except sqlite3.IntegrityError as e:
   print(f"Sucesso: o banco barrou a inserção inválida com o erro: {e}")

app_db.fechar_conexao()