import os
import psycopg
from dotenv import load_dotenv
from psycopg.rows import dict_row

load_dotenv()

def get_connection():
   return psycopg.connect(
      dbname = os.getenv('DB_NAME'),
      user = os.getenv('DB_USER'),
      password = os.getenv('DB_PASSWORD'),
      host = os.getenv('DB_HOST', 'localhost'),
      port = os.getenv('DB_PORT', '5432'),
      row_factory = dict_row, # type: ignore
   )

def test_connection():
   print(get_connection().cursor().execute('SELECT version()'))