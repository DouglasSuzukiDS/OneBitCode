from sqlalchemy.ext.associationproxy import association_proxy, AssociationProxy
from sqlalchemy import ForeignKey, String
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship

class Base(DeclarativeBase):
   pass

class Inscricao(Base):
   __tablename__ = "inscricoes"

   estudante_id: Mapped[int] = mapped_column(ForeignKey("estudantes.id"), primary_key=True)
   disciplina_id: Mapped[int] = mapped_column(ForeignKey("disciplinas.id"), primary_key=True)

   estudante: Mapped["Estudante"] = relationship(back_populates="inscricoes")
   disciplina: Mapped["Disciplina"] = relationship(back_populates="inscricoes")

class Estudante(Base):
   __tablename__ = "estudantes"

   id: Mapped[int] = mapped_column(primary_key=True)
   nome: Mapped[str] = mapped_column(String(50))

   # Relacionamento com a tabela intermediária
   inscricoes: Mapped[list["Inscricao"]] = relationship(back_populates="estudante")

   # Proxy de Associação: atalho direto para as disciplinas
   disciplinas: AssociationProxy[list["Disciplina"]] = association_proxy("inscricoes", "disciplina")

class Disciplina(Base):
   __tablename__ = "disciplinas"

   id: Mapped[int] = mapped_column(primary_key=True)
   nome: Mapped[str] = mapped_column(String(50))

   inscricoes: Mapped[list["Inscricao"]] = relationship(back_populates="disciplina")