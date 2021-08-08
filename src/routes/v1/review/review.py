from fastapi import APIRouter
from starlette.requests import Request

from ....models.v1.review import Review
from ....utils.config import limiter
from ....utils.errors import exception_management
from ....database.postgres.v1.review import create_new_review


router = APIRouter()


@router.post("/api/v1/review/")
@limiter.limit("100000/minute")
async def create_review(request: Request, review: Review):
    """Creates a new review, by default will create it in the tripadvisor source since there is not ubereats reviews source"""
    try:
        await create_new_review(review)
        return {"OK"}
    except Exception as exception:
        exception_management(exception)
