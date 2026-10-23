import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from modelos import Base

load_dotenv()

def obter_engine():
  db_user = os.getenv("DB_USER")
  db_password = os.getenv("DB_PASSWORD")
  db_host = os.getenv("DB_HOST", "localhost")
  db_port = os.getenv("DB_PORT", "5432")
  db_name = os.getenv("DB_NAME")

  DATABASE_URL = f"postgresql+psycopg://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

  engine = create_engine(DATABASE_URL, echo=True)

  return engine

engine = obter_engine()
SessionLocal = sessionmaker(engine)

Base.metadata.create_all(engine)