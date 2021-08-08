import asyncpg
from fastapi import HTTPException


class InvalidSource(Exception):
    pass


class NegativeReviews(Exception):
    pass


class EmptyBrand(Exception):
    pass


class NegativePrice(Exception):
    pass


class BrandNotFound(Exception):
    pass


def exception_to_string(exception: Exception) -> str:
    return str(exception.args)


def exception_management(exception: Exception):
    print(type(exception))
    print(exception.args)
    if type(exception) == asyncpg.exceptions.UniqueViolationError:
        raise HTTPException(status_code=400, detail={"error": "Item already exists."})
    if type(exception) == asyncpg.exceptions.ForeignKeyViolationError:
        raise HTTPException(
            status_code=404, detail={"error": "Unique Identifier does not exist."}
        )
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
    if type(exception) == EmptyBrand:
        raise HTTPException(status_code=400, detail={"error": "Empty brand."})
    if type(exception) == NegativePrice:
        raise HTTPException(
            status_code=400, detail={"error": "Price can not be negative."}
        )
    if type(exception) == BrandNotFound:
        raise HTTPException(status_code=404, detail={"error": "Brand does not exist."})
    else:
        print(exception)
        raise HTTPException(
            status_code=500, detail={"error": exception_to_string(exception)}
        )
