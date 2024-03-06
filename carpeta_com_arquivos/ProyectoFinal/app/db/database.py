from sqlalchemy import create_engine 
from sqlalchemy.ext.declarative import declarative_base 
from sqlalchemy.orm import sessionmaker

#URL de la base de datos
SQLALCHEMY_DATABASE_URL ="postgresql://odoo:odoo@localhost:5342/fastapi-database"

engine=create_engine(SQLALCHEMY_DATABASE_URL) 
SessionLocal=sessionmaker(bind=engine,autocommit=False,autoflush=False) 
Base = declarative_base()

#Esta función devuelve la sesión de la BBDD.
def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()


