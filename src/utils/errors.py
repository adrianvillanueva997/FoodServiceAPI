import asyncpg
from fastapi import HTTPException


class InvalidSource(Exception):
    pass


class NegativeReviews(Exception):
    pass


def exception_to_string(exception: Exception) -> str:
    return str(exception.args[0])


def exception_management(exception: Exception):
    print(type(exception))
    if type(exception) == asyncpg.exceptions.UniqueViolationError:
        raise HTTPException(status_code=400, detail={"error": "Outlet already exists."})
    if type(exception) == InvalidSource:
        raise HTTPException(
            status_code=400,
            detail={"error": "Source not valid, it has to be tripadvisor or ubereats."},
        )
    if type(exception) == NegativeReviews:
        raise HTTPException(
            status_code=400,
            detail={"error": "Reviews can not be negative."},
        )
    else:
        print(exception.with_traceback)
        raise HTTPException(
            status_code=500, detail={"error": exception_to_string(exception)}
        )
