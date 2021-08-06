from fastapi import APIRouter

router = APIRouter()


@router.get("/api/v1/ubereats/brands/{brand}")
async def getBrandsbyBrand(brand: str):
    pass


@router.post("api/v1/ubereats/outlet")
async def createOutlet():
    pass


@router.get("api/v1/ubereats/outlet")
async def getOutlets():
    pass
