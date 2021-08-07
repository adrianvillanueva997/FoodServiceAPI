from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from starlette.requests import Request
from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded

from src.routes.v1.outlets import outlet
from src.routes.v1.brands import brands

from src.utils.config import limiter

app = FastAPI()
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

Instrumentator().instrument(app=app).expose(app=app)

app.include_router(outlet.router)
app.include_router(brands.router)


@app.get("/")
@limiter.limit("1/second")
async def read_root(request: Request):
    return {"Hello": "there"}
