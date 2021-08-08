from typing import Optional
from fastapi import APIRouter
from starlette.requests import Request
from fastapi.responses import JSONResponse

from ....models.v1.outlet import Outlet
from ....utils.config import limiter
from ....utils.errors import exception_management, InvalidSource, NegativeReviews
from ....database.postgres.v1.outlet import (
    create_tripadvisor_outlet,
    create_ubereats_outlet,
    fetch_outlets_by_source,
    fetch_outlets,
)

router = APIRouter()


@router.post("/api/v1/outlet/{source}")
@limiter.limit("100/minute")
async def create_outlet(request: Request, source: str, outlet: Outlet):
    """Creates an outlet given a datasource"""
    try:
        if (
            source is not None and (source == "ubereats" or source == "tripadvisor")
        ) == False:
            raise InvalidSource()
        if outlet.reviews is not None and outlet.reviews < 0:
            raise NegativeReviews()
        if source == "tripadvisor":
            await create_tripadvisor_outlet(outlet)
        elif source == "ubereats":
            await create_ubereats_outlet(outlet)
        return JSONResponse(status_code=200, content={"message": "OK"})
    except Exception as exception:
        exception_management(exception)


@router.get("/api/v1/outlet/{source}")
@limiter.limit("100/minute")
async def get_outlets(request: Request, source: Optional[str]):
    try:
        if source == "all":
            response = await fetch_outlets()
            return {"outlets": response}
        if source is not None and (source == "ubereats" or source == "tripadvisor"):
            response = await fetch_outlets_by_source(source)
            return {"outlets": response}
        else:
            raise InvalidSource()

    except Exception as exception:
        exception_management(exception)
