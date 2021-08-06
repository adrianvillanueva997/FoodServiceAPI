from fastapi import APIRouter

router = APIRouter()


@router.get("/api/v1/tripadvisor/outlets")
async def outlets():
    pass
