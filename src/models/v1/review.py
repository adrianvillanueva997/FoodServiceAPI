from pydantic import BaseModel


class Review(BaseModel):
    user: str
    outletid: str
    review: str
    rate: int

    def to_dict(self) -> dict:
        return {
            "user": self.user,
            "outletid": self.outletid,
            "review": self.review,
            "rate": self.rate,
        }
