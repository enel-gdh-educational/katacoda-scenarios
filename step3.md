# Fun with data

Here we use a sample of data from AirBnB, see this [link](http://insideairbnb.com/get-the-data.html)
for further details.

The data can be stored in MongoDB running the
following script. 


We need to use the new database, called *airbnb*.
As a first step let's count the number of items
```javascript
> use airbnb
> db.sample_data.count()
```
You should get 100. This means that one hundred records are
stored in this collection.



We want to select data 
1. Select apartments where the number of bedrooms = 2
2. Select apartments where the number of bedrooms = 2 and price is lower than 100
3. Select apartments in New York
4. Select apartments in New York and Los Angeles 



1. `db.sample_data.find({"bedrooms": 2})`
2. `db.sample_data.find({"bedrooms": 2, "price": {"$lt": 100}})`
3. `db.sample_data.find({"address.market": "New York"})`
4. `db.sample_data.find({"address.market": {"$in": ["New York", "Los Angeles"]}})`
