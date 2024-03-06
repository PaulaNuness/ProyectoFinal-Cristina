from fastapi import FastAPI
import uvicorn
from app.routers import pelicula,actor,director
from app.db.database import Base,engine

import logging

logging.basicConfig(level=logging.INFO)

#funcion para crear las tablas
def create_tables():
    logging.info("Creating tables...")
    Base.metadata.create_all(bind=engine)
    logging.info("Tables created.")

create_tables()


app=FastAPI()
app.include_router(pelicula.router)
app.include_router(actor.router)
app.include_router(director.router)


if __name__=="__main__":
    uvicorn.run("main:app", port=8000, reload=True)



