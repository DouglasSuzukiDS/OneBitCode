'''​
   Você está construindo o módulo de gerenciamento de cursos de uma plataforma de tecnologia. O objetivo é criar o arquivo cursos.py para cadastrar, consultar, atualizar a carga horária e desativar cursos no PostgreSQL.

   1. Estrutura da Tabela no PostgreSQL
      Crie a tabela “cursos” com restrições de integridade:

         CREATE TABLE IF NOT EXISTS cursos (    
            id SERIAL PRIMARY KEY,
            titulo TEXT NOT NULL,
            instrutor TEXT NOT NULL,
            duracao_horas INT NOT NULL CHECK (duracao_horas > 0),
            nivel TEXT NOT NULL CHECK (nivel IN ('INICIANTE', 'INTERMEDIARIO', 'AVANCADO'))
         );
         
   2. Funções a Implementar no arquivo cursos.py
      Importe a função get_connection() do seu módulo conexao.py e crie as seguintes funções:

      cadastrar_curso(titulo: str, instrutor: str, duracao_horas: int, nivel: str) -> int
         Insere um novo curso utilizando parâmetros seguros (%s).
         
         Retorno: O id numérico gerado pelo PostgreSQL para o curso (RETURNING id).

      listar_cursos_por_nivel(nivel: str) -> list[dict]
         Consulta os cursos filtrando pelo nível informado (ex.: buscar apenas cursos 'INICIANTE') e ordenando alfabeticamente pelo título.

         Retorno: Lista de dicionários representando os cursos encontrados.

      atualizar_duracao(curso_id: int, novas_horas: int) -> bool
         Atualiza a carga horária do curso correspondente ao curso_id.

         Retorno: True se o curso foi localizado e alterado; False se o id não existia no banco.

      remover_curso(curso_id: int) -> dict | None
         Remove o curso do banco utilizando a cláusula RETURNING titulo, instrutor.

         Retorno: Um dicionário com o titulo e o instrutor do curso removido, ou None caso o id não tenha sido localizado.
'''