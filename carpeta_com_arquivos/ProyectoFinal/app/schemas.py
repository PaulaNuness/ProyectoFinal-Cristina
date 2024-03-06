from pydantic import BaseModel



peliculas =[]
actores =[]
directores =[]

#Pelicula Model
class Pelicula(BaseModel): #Schema
    id_pelicula:int
    nombre_pelicula:str
    genero_pelicula:str



#Actor Model
class Actor(BaseModel): #Schema
    id_actor:int
    id_pelicula:int
    nombre_actor:str


#Director Model
class Director(BaseModel): #Schema
    id_director:int
    id_pelicula:int
    nombre_director:str   