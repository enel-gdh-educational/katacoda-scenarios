1. `db.sample_data.find({"bedrooms": 2})`
2. `db.sample_data.find({"bedrooms": 2, "price": {"$lt": "100"}})`
3. `db.sample_data.find({"address.market": "New York"})`
4. `db.sample_data.find({"address.market": {"$in": ["New York", "Los Angeles"]}})`
