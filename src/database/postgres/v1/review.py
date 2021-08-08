import asyncpg
from ....models.v1.review import Review
from ....utils.config import POSTGRESQL_URL


async def create_new_review(review: Review):
    query = """INSERT INTO public.ta_reviews
        ("user", outletid, review, rate)
        VALUES($1, $2, $3, $4);"""
    con: asyncpg.Connection = await asyncpg.connect(POSTGRESQL_URL)
    await con.execute(query, review.user, review.outletid, review.review, review.rate)
    await con.close()
