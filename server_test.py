from fastapi.testclient import TestClient
from server import app

client = TestClient(app)


def test_metrics_endpoint():
    response = client.get("/metrics")
    assert response.status_code == 200


def test_post_outlet_tripadvisor():
    response = client.post(
        "/api/v1/outlet/tripadvisor",
        json={
            "outletid": "12345",
            "country": "ES",
            "name": "This is a wonderful test",
            "address": "FakeStreet 123",
            "phone": "+34 12345",
            "reviews": 10,
        },
    )
    assert response.status_code == 200


def test_post_outlet_ubereats():
    response = client.post(
        "/api/v1/outlet/ubereats",
        json={
            "outletid": "54321",
            "country": "ES",
            "name": "This is another fantastic test",
            "address": "RealStreet 321",
            "phone": "+34 54321",
            "reviews": 50,
        },
    )
    assert response.status_code == 200


def test_post_new_menu():
    response = client.post(
        "/api/v1/menu/",
        json={
            "outletid": "54321",
            "name": "Estrella Galicia",
            "brand": "Estrella Galicia",
            "price": 10,
            "volume": "150",
        },
    )
    assert response.status_code == 200


def test_post_new_user():
    response = client.post(
        "/api/v1/user/",
        json={"userid": "adrian", "address": "Spain", "reviews": 10, "likes": 10},
    )
    assert response.status_code == 200


def test_post_new_review():
    response = client.post(
        "/api/v1/review/",
        json={
            "user": "adrian",
            "outletid": "12345",
            "review": "Best beer in the world!",
            "rate": 10,
        },
    )
    assert response.status_code == 200


def test_get_outlet_tripadvisor():
    response = client.get("/api/v1/outlet/tripadvisor")
    assert response.status_code == 200
    assert response.json() == {
        "outlets": [
            {
                "outletid": "12345",
                "country": "ES",
                "name": "This is a wonderful test",
                "address": "FakeStreet 123",
                "phone": "+34 12345",
                "reviews": 10,
                "source": "tripadvisor",
            }
        ]
    }


def test_get_outlet_ubereats():
    response = client.get("/api/v1/outlet/ubereats")
    assert response.status_code == 200
    assert response.json() == {
        "outlets": [
            {
                "outletid": "54321",
                "country": "ES",
                "name": "This is another fantastic test",
                "address": "RealStreet 321",
                "phone": "",
                "reviews": 50,
                "source": "ubereats",
            }
        ]
    }


def test_get_menu_by_price():
    response = client.get("/api/v1/menu/price/10")
    assert response.status_code == 200
    assert response.json() == {
        "data": [
            {
                "outletid": "54321",
                "name": "Estrella Galicia",
                "brand": "Estrella Galicia",
                "price": 10.0,
                "volume": "150",
            }
        ]
    }


def test_get_outlet_by_brand():
    response = client.get("/api/v1/menu/brand/Estrella")
    assert response.status_code == 200
    assert response.json() == {
        "data": [
            {
                "outlet": {
                    "outletid": "54321",
                    "country": "ES",
                    "name": "This is another fantastic test",
                    "address": "RealStreet 321",
                    "phone": "",
                    "reviews": 50,
                    "source": "ubereats",
                },
                "menu": {
                    "outletid": "54321",
                    "name": "This is another fantastic test",
                    "brand": "Estrella Galicia",
                    "price": 10.0,
                    "volume": "150",
                },
            }
        ]
    }
