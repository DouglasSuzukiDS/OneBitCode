import asyncio
from conexao_sqlalchemy import AsyncSessionLocal
from sqlalchemy import select
from modelos import Usuario
import selectors

async def obter_usurauios():
   async with AsyncSessionLocal() as session:
      stmt = select(Usuario)
      resultado = await session.scalars(stmt)
      usuarios = resultado.all()

      for usuario in usuarios:
         print(usuario.email)

if __name__ == '__main__':
   asyncio.run(
      obter_usurauios(),
      # Passa o loop_factory diretamente aqui para forçar o SelectorEventLoop no Windows
      loop_factory=lambda: asyncio.SelectorEventLoop(selectors.SelectSelector()) # linha extra adicionada para nao dar erro na hora de executar
   )