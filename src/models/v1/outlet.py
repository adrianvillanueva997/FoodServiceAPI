from typing import Optional
from pydantic import BaseModel


class Outlet(BaseModel):
    outletid: str
    country: str
    name: str
    address: str
    phone: Optional[str]
    reviews: Optional[int]
    source: Optional[str]

    def to_dict(self) -> dict:
        return {
            "outletid": self.outletid,
            "country": self.country,
            "name": self.name,
            "address": self.address,
            "reviews": self.reviews,
            "source": self.source,
        }
