# Fun with data

Here we use a sample of data from AirBnB, see this [link](http://insideairbnb.com/get-the-data.html)
for further details.

The data can be stored in MongoDB running the
following bash script 
```bash
$ bash loader.sh
```
The script also installed the `python` package `pymongo` that
we will use later in the class.

We need to use the new database, called *airbnb*. To check that the databases
are correctly loaded you can use the `show dbs` statement. 


To get the collections you can use the command [show collections](https://docs.mongodb.com/manual/release-notes/4.0-compatibility/#compat-show-collections).
As a first step let's count the number of items
```javascript
> use airbnb
> db.sample_data.count()
```
You should get 27. 

### Exercise

In the following you should use the `find` command 
to select documents. We want to select data based on
the following criteria:
1. select apartments where the number of bedrooms = 2;
2. select apartments where the number of bedrooms = 2 and price is lower than 800;
3. select apartments in New York;
4. select apartments in New York and Los Angeles. 
