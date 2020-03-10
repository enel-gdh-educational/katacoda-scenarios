# Join

In this step we analyze a different dataset. It should
be already loaded in the database. You can access
via command line using the following command
```javascript
> use orders
```
This database has a more complex structure.
It contains five collection. We can get information
regarding the collections using the following command
[listCollections](https://docs.mongodb.com/manual/reference/command/listCollections/).
For our purpose just type
```javascript
> db.listCollections()
```