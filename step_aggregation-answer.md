### Exercise 1
```javascript
> db.movies.aggregate([
    {$match:{"genres":"Action", cast:"Bruce Willis"}},
    {$sort: {year:-1}}
])
```

### Exercise 2

```javascript
> db.movies.aggregate([
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,conteggio:{$sum:1}}}
  ])
```
An alternative solution could be
```javascript
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,conteggio:{$sum:1}}}
  ])
```

### Exercise 3

```javascript
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}}
  ])
```
### Exercise 4

```javascript
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}}
  ])
```

### Exercise 5
```javascript
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}},
	{$out:"top_actors"}
  ])
```
### Exercise 6
```javascript
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$unwind:"$genres"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:{actor:"$cast",genre:"$genres"},count_movies:{$sum:1},list_movies:{$addToSet:"$title"}}},
	{$project:{actor:"$_id.actor",genre:"$_id.genre",count_movies:1,list_movies:1}},
	{$project:{_id:0}},
	{$sort:{"actor":1,"genre":1}},
	{$out:"actors_and_genres"}
  ])
```