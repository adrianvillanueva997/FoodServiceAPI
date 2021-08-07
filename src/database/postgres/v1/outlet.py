import asyncpg
from typing import List
from ....models.v1.outlet import Outlet
from ....utils.config import POSTGRESQL_URL


async def create_ubereats_outlet(outlet: Outlet):
    try:
        query = """INSERT INTO public.ub_outlet
        (outletid, country, "name", address, reviews)
        VALUES($1, $2, $3, $4, $5);"""
        con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
        if outlet.reviews is None:
            outlet.reviews = 0
            await con.execute(
                query,
                outlet.outletid,
                outlet.country,
                outlet.name,
                outlet.address,
                outlet.reviews,
            )
            await con.close()
    except Exception as e:
        print(e)


async def create_tripadvisor_outlet(outlet: Outlet):
    try:
        query = """INSERT INTO public.ta_outlet
        (outletid, country,"name", address, phone ,reviews)
        VALUES($1, $2, $3, $4, ,$5 $6);"""
        con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
        if outlet.reviews is None:
            outlet.reviews = 0
            await con.execute(
                query,
                outlet.outletid,
                outlet.country,
                outlet.name,
                outlet.address,
                outlet.phone,
                outlet.reviews,
            )
            await con.close()
    except Exception as e:
        print(e)


async def fetch_outlets_by_source(source: str) -> List[Outlet]:
    try:
        print("atasda")
        query = """SELECT * FROM public.vw_outlets WHERE source = $1;"""
        con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
        results = await con.fetch(query, source)
        outlets: List[Outlet] = []
        for result in results:
            outlet = Outlet(
                outletid=result["outletid"],
                country=result["country"],
                name=result["name"],
                address=result["address"],
                phone=result["phone"],
                reviews=result["reviews"],
                source=result["source"],
            )
            outlets.append(outlet)
        return outlets
    except Exception as e:
        print(e)


async def fetch_outlets() -> List[Outlet]:
    try:
        print("atasda")
        query = """SELECT * FROM public.vw_outlets;"""
        con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
        results = await con.fetch(query)
        outlets: List[Outlet] = []
        for result in results:
            outlet = Outlet(
                outletid=result["outletid"],
                country=result["country"],
                name=result["name"],
                address=result["address"],
                phone=result["phone"],
                reviews=result["reviews"],
                source=result["source"],
            )
            outlets.append(outlet)
        return outlets
    except Exception as e:
        print(e)
