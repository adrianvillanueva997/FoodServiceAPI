from typing import List
import asyncpg

from ....models.v1.outlet import Outlet
from ....utils.config import POSTGRESQL_URL
from ....models.v1.menu import Menu, Menu_Outlet


async def create_new_menu(menu: Menu):
    query = """INSERT INTO public.ub_menu
        (outletid, "name", brand, price, volume)
        VALUES($1, $2, $3, $4, $5);"""
    con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
    await con.execute(
        query, menu.outletid, menu.name, menu.brand, menu.price, menu.volume
    )
    await con.close()


async def find_menu_by_price(price: int):
    query = """select * from public.ub_menu um
                where um.price >= $1 order  by um.price asc;"""
    con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
    results = await con.fetch(query, price)
    await con.close()
    menus: List[Menu] = []

    for result in results:
        menus.append(
            Menu(
                outletid=result["outletid"],
                name=result["name"],
                brand=result["brand"],
                price=result["price"],
                volume=result["volume"],
            ),
        )
    return menus


async def find_outlet_by_brand(brand: str):
    query = """SELECT * from ub_menu um 
        inner join vw_outlets uo ON 
        uo.outletid = um.outletid 
        WHERE um.brand like '%' || $1 || '%';"""
    con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
    results = await con.fetch(query, brand)
    await con.close()
    menus: List[Menu_Outlet] = []

    for result in results:
        menus.append(
            Menu_Outlet(
                outlet=Outlet(
                    outletid=result["outletid"],
                    country=result["country"],
                    name=result["name"],
                    address=result["address"],
                    phone=result["phone"],
                    reviews=result["reviews"],
                    source=result["source"],
                ),
                menu=Menu(
                    outletid=result["outletid"],
                    name=result["name"],
                    brand=result["brand"],
                    price=result["price"],
                    volume=result["volume"],
                ),
            ),
        )
    return menus
