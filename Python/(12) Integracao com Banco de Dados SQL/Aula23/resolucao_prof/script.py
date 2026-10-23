from conexao_sqlalchemy import SessionLocal
from sqlalchemy import select
from modelos import Cliente, Pedidos

'''with SessionLocal() as session:
   cliente = Cliente(
      nome = 'Mariana Souza',
      email = 'mariana@examplo.com',
      pedidos=[
         Pedidos(item = 'Notebook', valor = 4500.00),
         Pedidos(item = 'Mouse', valor = 150.00),
      ]
   )

   session.add(cliente)
   session.commit()'''

with SessionLocal() as session:
   stmt = select(Cliente).where(Cliente.nome == 'Mariana Souza')
   cliente = session.scalars(stmt).first()

   if not cliente: exit()

   print(f'\nCliente localizado> {cliente.nome}')

   for pedido in cliente.pedidos:
      print(f'- Item: {pedido.item} | Valor: R$ {pedido.valor:.2f}')

   pedido_mouse = next(pedido for pedido in cliente.pedidos if pedido.item == 'Mouse') # Busca a primeira ocorrencia

   cliente.pedidos.remove(pedido_mouse)

   session.commit()
   print(f'\nPedido {pedido_mouse.item} removido e deletado do banco de dados automaticamente')