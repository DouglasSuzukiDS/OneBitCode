from typing import Optional
from sqlalchemy import String, ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, MappedAsDataclass, relationship

class Base(MappedAsDataclass, DeclarativeBase):
   pass

class Cliente(Base):
   __tablename__ = 'clientes'

   id: Mapped[int] = mapped_column(primary_key=True, init=False)
   nome: Mapped[str] = mapped_column(String(50))
   email: Mapped[Optional[str]] = mapped_column(String(100), unique=True)

   pedidos: Mapped[list['Pedidos']] = relationship(
      back_populates='cliente',
      cascade='all, delete-orphan'
   )

class Pedidos(Base):
   __tablename__ = 'pedidos'

   id: Mapped[int] = mapped_column(primary_key=True, init=False)
   item: Mapped[str] = mapped_column(String(100))
   valor: Mapped[float] = mapped_column()
   cliente_id: Mapped[int] = mapped_column(ForeignKey('clientes.id'), init=False)

   cliente: Mapped['Cliente'] = relationship(back_populates='pedidos', init=False)