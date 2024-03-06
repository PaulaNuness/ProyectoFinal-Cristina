from fastapi import APIRouter,Depends
from app.schemas import Director
from app.db.database import get_db
from sqlalchemy.orm import Session
from app.db import models
from sqlalchemy.orm import joinedload


router = APIRouter(
    prefix="/directores",
    tags=["Directores"]
)

##################################################################################################

@router.get("/todos_los_directores")
def obtener_directores(db: Session = Depends(get_db)):
    # Usando joinedload para carregar as informações da película associada a cada director
    directores_con_peliculas = db.query(models.Director).options(joinedload(models.Director.pelicula)).all()

    # Restante do código permanece o mesmo
    for director in directores_con_peliculas:
        print(f"Director: {director.nombre_director}, Película: {director.pelicula.nombre_pelicula if director.pelicula else 'N/A'}")

    return directores_con_peliculas

@router.get("/director/{id}")
def obtener_director(id: int, db: Session = Depends(get_db)):
    # Utilizando join para carregar as informações da película associada ao director
    director_con_pelicula = db.query(models.Director).filter(models.Director.id_director == id).join(models.Pelicula).first()

    if not director_con_pelicula:
        raise HTTPException(status_code=404, detail="Director no encontrado")

    return {
        "id_director": director_con_pelicula.id_director,
        "nombre_director": director_con_pelicula.nombre_director,
        "pelicula": {
            "id_pelicula": director_con_pelicula.pelicula.id_pelicula,
            "nombre_pelicula": director_con_pelicula.pelicula.nombre_pelicula if director_con_pelicula.pelicula else 'N/A',
            # Incluir outros campos da tabela Pelicula conforme necessário
        }
    }

#creando un director
@router.post("/crear_director")
def crear_director(director:Director,db:Session=Depends(get_db)): 
    director = director.model_dump()  
    nuevo_director=models.Director(
        id_pelicula=director["id_pelicula"],
        nombre_director=director["nombre_director"]
    )
    db.add(nuevo_director)
    db.commit()
    db.refresh(nuevo_director)
    return True                      
    

#Atualizar um director
@router.put("/actualizar_director/{id}")
def actualizar_director(id: int, updateDirector: Director,db:Session=Depends(get_db)):
    director=db.query(models.Director).filter(models.Director.id_director==id)
    if not director.first():
        return{"Respuesta":"Director no encontrado"}
    director.update(updateDirector.model_dump(exclude_unset=True))
    db.commit()
    return{"Respuesta":"Director actualizado"}

#deletar un director
@router.delete("/eliminar_director/{id}")
def eliminar_director(id: int,db:Session=Depends(get_db)):
    director=db.query(models.Director).filter(models.Director.id_director==id)
    if not director:
        return{"Respuesta":"Director no encontrado"}
    director.delete(synchronize_session=False)
    db.commit()
    return{"Respuesta":"Director eliminada"}

##################################################################################################