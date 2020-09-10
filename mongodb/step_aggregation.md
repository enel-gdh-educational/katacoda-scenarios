# Aggregation

In `MongoDB` the `aggregate` pipeline is a way to combine
multiple steps in a single query. Those steps are 
the so-called stages.
Each stage has its own syntax. 

Use the `MongoDB` guide to learn the 
syntax and some examples at the following
links:
 * [$match](https://docs.mongodb.com/manual/reference/operator/aggregation/match/)
 * [$group](https://docs.mongodb.com/manual/reference/operator/aggregation/group/)
 * [$project](https://docs.mongodb.com/manual/reference/operator/aggregation/project/)


In order to test the `aggregate` pipeline we use 
data collected in the databases already loaded within
the `mongoimport` command.

### Exercise 1
Get all the movies with the actor Bruce Willis and with action genre, ordered by year (descending)

*Optional: this data can be achieved by only using find instead of the aggregation. 
Write a query with aggregation and a query with find.*

Hint: the aggregation could may have this structure.
The `$match` aggregator operator and the `$sort` 
aggregator operator have the same syntax of the correspondant match and sort operators of the find query.
```
> db.movies.aggregate(
	[
		{$match:{ *insert here the filter conditions* }},
		{$sort:{ *insert here the sort condition* }}
	]
)
```


### Exercise 2
Create an aggregation to count the movies in which 
acted Mack Sennett.

The expected output and structure is:
```
{actor:"Mack Sennett", movies:__TODO__}
```
Hint: use the `$match` operator to filter data, 
the `$group` operator to aggregate, 
and the `$project` operator 
to rename variables.
 
Remember that the aggregate pipeline 
structure have the following structure:
```
> db.movies.aggregate(
	[
		{operator1},
		{operator2},
		{operator3},
		...
		{finalOperator}
	]
)
```

### Exercise 3
Create an aggregation query to get all the actors 
ordered by the ones that appeared in more movies.

The output must have these first lines with this structure
```
{ "actor" : "Harold Lloyd", "count_movies" : 190 }
[...]
```
Hint: you need first to get the count of the movies grouped by the actors. To *explode* the cast array and get one document 
of one actor you need to use the `$unwind` operator, see for
instance this [guide](https://docs.mongodb.com/manual/reference/operator/aggregation/unwind/).

### Exercise 4 
Clean data: in the previous solution there's the word *and* as an actor. 
That's because the dataset contains dirty documents. 

Filter the `actor` named *and* out from the output by modifying the previous aggregation query.


### Exercise 5
Save the result of the previous exercise 
to a new collection named `top_actors` 
in a new db `aggregations`.

Hint: modify the previous query and use the `$out` aggregation operator. 
Like the others operators, you can find its guide in the `MongoDB` official [documentation](https://docs.mongodb.com/manual/reference/operator/aggregation/out/).

### Exercise 6 
Create a new `aggregations.actors_genres` collection, 
in which is stored the list and the count of the movies grouped 
by actor and genre, sorted by actor and the by genre, descending.

The final TODO result and structure must be the following:
```
{ "_id" : ObjectId("5f4a118594ac7614919532bd"), "actor" : "Édgar Ramírez", "genre" : "Action", "count_movies" : 2, "list_movies" : [ "Zero Dark Thirty", "Wrath of the Titans" ]  }
```
*Optional: you can filter out some output dirty records you find*

Hint: to obtain the `list_movies` field consult the `$group` operator [guide](https://docs.mongodb.com/manual/reference/operator/aggregation/group/).
