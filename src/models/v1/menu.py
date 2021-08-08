from pydantic import BaseModel

from ...models.v1.outlet import Outlet


class Menu(BaseModel):
    outletid: str
    name: str
    brand: str
    price: float
    volume: str

    def to_dict(self) -> dict:
        return {
            "outletid": self.outletid,
            "name": self.name,
            "brand": self.brand,
            "price": self.price,
            "volume": self.volume,
        }


class Menu_Outlet(BaseModel):
    outlet: Outlet
    menu: Menu

    def to_dict(self) -> dict:
        return {"outlet": self.outlet, "menu": self.menu}
