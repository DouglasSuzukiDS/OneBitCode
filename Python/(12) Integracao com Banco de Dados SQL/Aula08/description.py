'''
   Desenvolva uma classe de persistência em Python chamada ChamadosDB utilizando o módulo nativo sqlite3. O módulo deve gerenciar os chamados de um sistema de suporte técnico (Helpdesk), aplicando restrições de integridade tanto na camada de aplicação (Python) quanto na camada de banco de dados (SQLite).

   Requisitos e Especificações

   1. Enumerações
      - Prioridade: "BAIXA", "MEDIA", "ALTA".
      - StatusChamado: "ABERTO", "EM_ANDAMENTO", "CONCLUIDO".

   2. Estrutura da Tabela e Restrições (Camada SQLite)
   A classe deve inicializar a conexão e criar a tabela “chamados” (caso não exista) com os seguintes campos e regras de integridade via CHECK constraints:
      - id: Chave primária autoincrementada (INTEGER PRIMARY KEY AUTOINCREMENT).
      - cliente: Texto não nulo (TEXT NOT NULL).
      - descricao: Texto não nulo (TEXT NOT NULL).
      - prioridade: Texto não nulo com CHECK aceitando apenas 'BAIXA', 'MEDIA' ou 'ALTA'.
      - status: Texto não nulo, com valor padrão 'ABERTO' e CHECK aceitando apenas 'ABERTO', 'EM_ANDAMENTO' ou 'CONCLUIDO'.

   3. Métodos da Classe ChamadosDB
      Implemente os seguintes métodos com tipagem adequada e uso de consultas parametrizadas (?):

      1) init(self, db_name: str = "database.db")
         - Inicializa a conexão com o banco de dados.
         - Configura row_factory = sqlite3.Row para permitir acesso aos campos por nome.
         - Executa a criação da tabela “chamados”.

      2) abrir_chamado(self, cliente: str, descricao: str, prioridade: Prioridade) -> int
         - Insere um novo chamado com o status inicial StatusChamado.ABERTO.
         - Retorno: O id numérico gerado pelo banco para o novo registro (cursor.lastrowid).

      3) importar_chamados(self, lista_chamados: list[tuple[str, str, Prioridade]]) -> int
         - Recebe uma lista de tuplas contendo (cliente, descricao, prioridade) e realiza a inserção em lote via cursor.executemany().
         - Todos os chamados importados devem iniciar com o status StatusChamado.ABERTO.
         - Retorno: A quantidade total de registros inseridos (cursor.rowcount).

      4) listar_por_status(self, status: StatusChamado) -> list[dict]
         - Realiza uma consulta filtrando os chamados pelo status informado.
         - Itera sobre o cursor e retorna os registros como uma lista de dicionários Python.

      5) atualizar_status(self, chamado_id: int, novo_status: StatusChamado) -> bool
         -  Atualiza o status do chamado correspondente ao chamado_id.
         - Retorno: True se o registro foi encontrado e alterado; False caso o id não exista.

      6) fechar_conexao(self) -> None
         - Encerra a conexão com o banco de dados.

   4. Na aplicação:
      - Uso obrigatório de parâmetros (?) em todas as queries para prevenção de SQL Injection.
      - Tratamento e bloqueio de dados fora dos enums estabelecidos tanto em tempo de código quanto pelo banco SQLite (sqlite3.IntegrityError).
'''
