from fastapi import APIRouter
from starlette.requests import Request

from ....models.v1.user import User
from ....utils.config import limiter
from ....utils.errors import exception_management
from ....database.postgres.v1.user import create_new_user

router = APIRouter()


@router.post("/api/v1/user/")
@limiter.limit("100000/minute")
async def create_user(request: Request, user: User):
    """Creates a new user, by default will create it in users tripadvisor source since there is not ubereats users source"""
    try:
        await create_new_user(user)
        return {"OK"}
    except Exception as exception:
        exception_management(exception)
