from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from starlette.requests import Request
from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded

from src.routes.v1.outlets import outlet
from src.routes.v1.menu import menu
from src.routes.v1.review import review
from src.routes.v1.user import user
from src.utils.config import limiter


app = FastAPI()

# Slowapi http request limiter configuration
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

# Prometheus metrics generator
Instrumentator().instrument(app=app).expose(app=app)

# Our routers go here!
app.include_router(outlet.router)
app.include_router(menu.router)
app.include_router(review.router)
app.include_router(user.router)
