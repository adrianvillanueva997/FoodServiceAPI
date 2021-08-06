from fastapi import APIRouter

router = APIRouter()


@router.get("/api/v1/ubereats/brands/{brand}")
async def getBrandsbyBrand(brand: str):
    pass


@router.post("api/v1/ubereats/outlet")
async def create_outlet():
    pass


@router.get("api/v1/ubereats/outlet")
async def get_outlets():
    pass
