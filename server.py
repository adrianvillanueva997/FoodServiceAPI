from typing import Optional
from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from starlette.requests import Request
from src.routes.v1.tripadvisor import tripadvisor
from src.routes.v1.ubereats import ubereats

from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded

limiter = Limiter(key_func=get_remote_address)

app = FastAPI()
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

Instrumentator().instrument(app=app).expose(app=app)

app.include_router(tripadvisor.router)
app.include_router(ubereats.router)


@app.get("/")
@limiter.limit("5/minute")
async def read_root(request: Request):
    return {"Hello": "there"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
