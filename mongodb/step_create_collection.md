# Create a collection
We want to create our first database and collections.
A single database can contains one or
more collections. Collections are list of documents,
where a document is the item stored in mongo.

The aim of this step is to create a collection
in a new db called *users* with your id `<ID>` and 
your name  `<NAME>`. 
In the mongo cli use the following command
```
> use users
```
With the `use` statement a new database is created.
Now if you type `db` (which give us the current
database) you should get `users`. 

### Exercise
We are ready to insert a new collection, let's call
it *people*. 
Notice that we have a text editor to write our queries, it
might be useful.
Once you insert the first document the collection is created.
To insert a document use the following command 
```
> db.people.insert({"id": <ID>, "name": <NAME>})
```
The next step is to insert more than one record
in the `people` collection in a single shot, see [insert](https://docs.mongodb.com/manual/reference/method/db.collection.insert/)
for further details. 
You have to insert the following
users:

| id | name     |  email | age |
|------|-----------------|---|---|
| a0000001   | FS |  FS@email.com |   |   |
| a9999999   | PG  | PG@email.com  |  15 |   |
| 1   | PQ         |   |  22 |   |
| 1   | MT         |  MT@email.com |  45 ||

Notice that the `id` field is not the database
index, which is a special object [ObjectId](https://docs.mongodb.com/manual/reference/method/ObjectId/). Further details
can be found here [Indexes](https://docs.mongodb.com/manual/indexes/).

Now you should be able to retrieve data using
the following command
```
> db.people.find()
```

 
