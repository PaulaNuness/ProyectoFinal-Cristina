from fastapi import APIRouter,Depends
from app.schemas import Actor
from app.db.database import get_db
from sqlalchemy.orm import Session
from app.db import models
from sqlalchemy.orm import joinedload

router = APIRouter(
    prefix="/actores",
    tags=["Actores"]
)

##################################################################################################
    
@router.get("/todos_los_actores")
def obtener_actores(db: Session = Depends(get_db)):
    # Usando joinedload para carregar as informações da película associada a cada ator
    actores_con_peliculas = db.query(models.Actor).options(joinedload(models.Actor.pelicula)).all()

    # Restante do código permanece o mesmo
    for actor in actores_con_peliculas:
        print(f"Actor: {actor.nombre_actor}, Película: {actor.pelicula.nombre_pelicula if actor.pelicula else 'N/A'}")

    return actores_con_peliculas

@router.get("/actor/{id}")
def obtener_actor(id: int, db: Session = Depends(get_db)):
    # Utilizando join para carregar as informações da película associada ao ator
    actor_con_pelicula = db.query(models.Actor).filter(models.Actor.id_actor == id).join(models.Pelicula).first()

    if not actor_con_pelicula:
        raise HTTPException(status_code=404, detail="Actor no encontrado")

    return {
        "id_actor": actor_con_pelicula.id_actor,
        "nombre": actor_con_pelicula.nombre_actor,
        "pelicula": {
            "id_pelicula": actor_con_pelicula.pelicula.id_pelicula,
            "nmbre_pelicula": actor_con_pelicula.pelicula.nombre_pelicula if actor_con_pelicula.pelicula else 'N/A',
            # Incluir outros campos da tabela Pelicula conforme necessário
        }
    }

#creando un actor
@router.post("/crear_actor")
def crear_actor(actor:Actor,db:Session=Depends(get_db)): 
    actor = actor.model_dump()  
    nuevo_actor=models.Actor(
        id_pelicula=actor["id_pelicula"],
        nombre_actor=actor["nombre_actor"]
    )
    db.add(nuevo_actor)
    db.commit()
    db.refresh(nuevo_actor)
    return True                      
    

#Atualizar um actor
@router.put("/actualizar_actor/{id}")
def actualizar_actor(id: int, updateActor: Actor,db:Session=Depends(get_db)):
    actor=db.query(models.Actor).filter(models.Actor.id_actor==id)
    if not actor.first():
        return{"Respuesta":"Actor no encontrado"}
    actor.update(updateActor.model_dump(exclude_unset=True))
    db.commit()
    return{"Respuesta":"Actor actualizado"}

#deletar un actor
@router.delete("/eliminar_actor/{id}")
def eliminar_actor(id: int,db:Session=Depends(get_db)):
    actor=db.query(models.Actor).filter(models.Actor.id_actor==id)
    if not actor:
        return{"Respuesta":"Actor no encontrado"}
    actor.delete(synchronize_session=False)
    db.commit()
    return{"Respuesta":"Actor eliminada"}

##################################################################################################