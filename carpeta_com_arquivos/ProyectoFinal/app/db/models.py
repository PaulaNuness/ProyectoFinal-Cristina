from app.db.database import Base 
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

# No arquivo app/db/database.py, adicione o relacionamento bidirecional na tabela Pelicula:
class Pelicula(Base):
    __tablename__ = "pelicula"

    id_pelicula = Column(Integer, primary_key=True, autoincrement=True)
    nombre_pelicula = Column(String, index=True)
    genero_pelicula = Column(String)

    # Adicione o relacionamento bidirecional com a tabela Actor
    actores = relationship("Actor", backref="pelicula", cascade="delete,merge")

    # Adicione o relacionamento bidirecional com a tabela Director
    directores = relationship("Director", backref="pelicula", cascade="delete,merge")


class Actor(Base):
    __tablename__ = "actor"

    id_actor = Column(Integer, primary_key=True, autoincrement=True)
    id_pelicula = Column(Integer, ForeignKey("pelicula.id_pelicula", ondelete="CASCADE"))
    nombre_actor = Column(String)

class Director(Base):
    __tablename__ = "director"

    id_director = Column(Integer, primary_key=True, autoincrement=True)
    id_pelicula = Column(Integer, ForeignKey("pelicula.id_pelicula", ondelete="CASCADE"))
    nombre_director = Column(String)