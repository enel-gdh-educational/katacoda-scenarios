# Join

In this step we analyze a different dataset. It should
be already loaded in the database. You can access
via command line using the following command
```javascript
> use orders
```
This database has a more complex structure.
It contains five collection. We can get information
regarding the collections using the following commands
[listCollections](https://docs.mongodb.com/manual/reference/command/listCollections/).
For our purpose just type
```javascript
> db.getCollectionNames()
```

As a first step explore the database to understand the
whole structure.

Once you are confident on the structure it is time
to perform a *join* among two collections. This operation
is called [aggregation](https://docs.mongodb.com/manual/reference/operator/aggregation/lookup/).

In this example we perform a join on the `customerid`
```javascript
> db.item_ordered.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "custumerid",
            foreignField: "customerid",
            as: "R"
     },
    {"$unwind": "R"}   
])
```

Tricky enough? 

Suppose you want to select only fields where