import asyncpg
from ....models.v1.user import User
from ....utils.config import POSTGRESQL_URL


async def create_new_user(user: User):
    query = """INSERT INTO public.ta_user
    ("user", likes, reviews, address)
    VALUES($1, $2, $3, $4);"""
    con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
    await con.execute(query, user.userid, user.likes, user.reviews, user.address)
    await con.close()
