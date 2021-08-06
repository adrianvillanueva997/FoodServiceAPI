from typing import Optional
from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

from src.utils.config import load_env

from src.routes.v1.tripadvisor import tripadvisor
from src.routes.v1.ubereats import ubereats

load_env()
app = FastAPI()
Instrumentator().instrument(app=app).expose(app=app)

app.include_router(tripadvisor.router)
app.include_router(ubereats.router)


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
