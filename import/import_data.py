import requests
import json

print("== Importing tripadvisor outlets! == ")
headers = {
    "accept": "application/json",
    "Content-Type": "application/json",
}

with open("../data/tripadvisor_outlet.json", "r", encoding="utf-8") as file:
    raw_content = file.read()
    json_content = json.loads(raw_content)
    for outlet in json_content:
        data = {
            "outletid": outlet["id_outlet"],
            "country": outlet["country"],
            "name": outlet["name"],
            "address": outlet["address"],
            "phone": outlet["phone"],
            "reviews": outlet["reviews_nr"],
        }

        response = requests.post(
            "http://localhost:8000/api/v1/outlet/tripadvisor",
            headers=headers,
            data=json.dumps(data),
        )
        print(response.content)

print("== Importing Uberbeats outlets! == ")
with open("../data/ubereats_outlet.json", "r", encoding="utf-8") as file:
    raw_content = file.read()
    json_content = json.loads(raw_content)
    for outlet in json_content:
        data = {
            "outletid": outlet["id_outlet"],
            "country": outlet["country"],
            "name": outlet["name"],
            "address": outlet["address"],
            "reviews": outlet["reviews_nr"],
        }

        response = requests.post(
            "http://localhost:8000/api/v1/outlet/ubereats",
            headers=headers,
            data=json.dumps(data),
        )
        print(response.content)

print("== Importing Ubereats menus! ==")
with open("../data/ubereats_menu.json", "r", encoding="utf-8") as file:
    raw_content = file.read()
    json_content = json.loads(raw_content)
    for menu in json_content:
        data = {
            "outletid": menu["id_outlet"],
            "name": menu["name"],
            "brand": menu["brand"],
            "price": menu["price"],
            "volume": menu["volume"],
        }
        if data["price"] == None:
            data["price"] = 0

        response = requests.post(
            "http://localhost:8000/api/v1/menu/",
            headers=headers,
            data=json.dumps(data),
        )
        print(response.content)

print("== Importing tripadvisor users! ==")
with open("../data/tripadvisor_user.json", "r", encoding="utf-8") as file:
    raw_content = file.read()
    json_content = json.loads(raw_content)
    for user in json_content:
        data = {
            "userid": user["user"],
            "address": user["address"],
            "reviews": user["reviews"],
            "likes": user["likes"],
        }
        if data["likes"] is None:
            data["likes"] = 0
        if data["reviews"] is None:
            data["reviews"] = 0
        response = requests.post(
            "http://localhost:8000/api/v1/user/",
            headers=headers,
            data=json.dumps(data),
        )
        print(response.content)

print("== Importing tripadvisor reviews! ==")
with open("../data/tripadvisor_reviews.json", "r", encoding="utf-8") as file:
    raw_content = file.read()
    json_content = json.loads(raw_content)
    for review in json_content:
        data = {
            "user": review["user"],
            "outletid": review["id_outlet"],
            "review": review["body"],
            "rate": review["rating"],
        }
        response = requests.post(
            "http://localhost:8000/api/v1/review/",
            headers=headers,
            data=json.dumps(data),
        )
        print(response.content)
