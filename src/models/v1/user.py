from pydantic import BaseModel


class User(BaseModel):
    userid: str
    address: str
    reviews: int
    likes: float

    def to_dict(self) -> dict:
        return {
            "userid": self.userid,
            "address": self.address,
            "reviews": self.reviews,
            "likes": self.likes,
        }
