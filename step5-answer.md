```
from pymongo import MongoClient

client = MongoClient('localhost', 27017)

airbnb = client["airbnb"]

sample = airbnb["sample_data"]

cursor = sample.find({
    "bedrooms": {"$in": ["2", "3"]}, 
    "price": {"$lt": "99"}
})

first_question = list(cursor)

cursor = sample.find({
    "bedrooms": 2, 
    "address.market": {"$in": ["New York", "Los Angeles"]}
})

second_question = list(cursor)

print(first_question)

print(second_question)
```