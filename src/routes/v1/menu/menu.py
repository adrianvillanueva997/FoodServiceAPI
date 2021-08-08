from fastapi import APIRouter
from starlette.requests import Request

from ....models.v1.menu import Menu
from ....utils.config import limiter
from ....utils.errors import exception_management, NegativePrice, BrandNotFound
from ....database.postgres.v1.menu import (
    create_new_menu,
    find_menu_by_price,
    find_outlet_by_brand,
)


router = APIRouter()


@router.post("/api/v1/menu/")
@limiter.limit("100000/minute")
async def create_menu(request: Request, menu: Menu):
    """Creates a new menu, by default will create it in ubereats source since there is not tripadvisor menu source"""
    try:
        if menu.price < 0:
            raise NegativePrice()
        await create_new_menu(menu)
        return {"OK"}
    except Exception as exception:
        exception_management(exception)


@router.get("/api/v1/menu/price/{price}")
@limiter.limit("100/minute")
async def get_menu_by_price(request: Request, price: int):
    """Finds all the menus given a price"""
    try:
        if price < 0:
            raise NegativePrice
        menus = await find_menu_by_price(price)
        return {"data": menus}
    except Exception as exception:
        exception_management(exception)


@router.get("/api/v1/menu/brand/{brand}")
@limiter.limit("100/minute")
async def get_menu_by_brand(request: Request, brand: str):
    """Creates an outlet given a datasource"""
    try:
        outlets = await find_outlet_by_brand(brand)
        if len(outlets) == 0:
            raise BrandNotFound()
        return {"data": outlets}
    except Exception as exception:
        exception_management(exception)
