from fastapi import APIRouter,Depends
from app.schemas import Pelicula
from app.db.database import get_db
from sqlalchemy.orm import Session
from app.db import models
from sqlalchemy.orm import joinedload

router = APIRouter(
    prefix="/peliculas",
    tags=["Peliculas"]
)

##################################################################################################
    
#buscando todas las peliculas
@router.get("/todas_las_peliculas")
def obtener_peliculas(db:Session=Depends(get_db)):
    data=db.query(models.Pelicula).all()
    return data 

#buscar una pelicula
@router.get("/pelicula/{id}") 
def obtener_pelicula(id:int,db:Session=Depends(get_db)):  
    pelicula=db.query(models.Pelicula).filter(models.Pelicula.id_pelicula==id).first()
    if not pelicula:
        return{"Respuesta":"Pelicula no encontrada"}
    return pelicula

#creando una pelicula,OKEY
@router.post("/crear_pelicula")
def crear_pelicula(pelicula:Pelicula,db:Session=Depends(get_db)): 
    pelicula = pelicula.model_dump()  
    nueva_pelicula=models.Pelicula(
        nombre_pelicula=pelicula["nombre_pelicula"],
        genero_pelicula=pelicula["genero_pelicula"]
    )
    db.add(nueva_pelicula)
    db.commit()
    db.refresh(nueva_pelicula)
    return True                      
    

#Atualizar uma pelicula
@router.put("/actualizar_pelicula/{id}")
def actualizar_pelicula(id: int, updatePelicula: Pelicula,db:Session=Depends(get_db)):
    pelicula=db.query(models.Pelicula).filter(models.Pelicula.id_pelicula==id)
    if not pelicula.first():
        return{"Respuesta":"Pelicula no encontrada"}
    pelicula.update(updatePelicula.model_dump(exclude_unset=True))
    db.commit()
    return{"Respuesta":"Usuario actualizado"}

#deletar una pelicula
@router.delete("/eliminar_pelicula/{id}")
def eliminar_pelicula(id: int,db:Session=Depends(get_db)):
    pelicula=db.query(models.Pelicula).filter(models.Pelicula.id_pelicula==id)
    if not pelicula:
        return{"Respuesta":"Pelicula no encontrada"}
    pelicula.delete(synchronize_session=False)
    db.commit()
    return{"Respuesta":"Pelicula eliminada"}

##################################################################################################