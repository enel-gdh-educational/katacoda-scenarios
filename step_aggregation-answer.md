```
film action di bruce willis ordinati per data decrescente
db.movies.aggregate([{$match:{"genres":"Action",cast:"Bruce Willis"}},{$sort:{year:-1}}])

conteggio dei film con Mack Sennett
sol 1
db.movies.aggregate([
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,conteggio:{$sum:1}}}
])
sol 2
db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,conteggio:{$sum:1}}}
])
conteggio dei film per attore, ordinati da quello che ne ha fatti di più
db.movies.aggregate([
	{$unwind:"$cast"},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}}
])
nei risultati c'è un 'and' dovuto ai dati di partenza sporchi, filtriamolo via
db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}}
])
salvare i risultati in una nuova collezione
db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",conteggio:{$sum:1}}},
	{$sort:{"conteggio":-1}},
	{$out:"top_actors"}
])
conteggio dei film per attore e genere, ordinati per attore e genere, filtrando via l'attore 'and', salvando in una nuova collezione.
il tracciato finale deve essere
-actor
-genre
-count_movies
-list_movies
db.movies.aggregate([
	{$unwind:"$cast"},
	{$unwind:"$genres"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:{actor:"$cast",genre:"$genres"},count_movies:{$sum:1},list_movies:{$addToSet:"$title"}}},
	{$project:{actor:"$_id.actor",genre:"$_id.genre",count_movies:1,list_movies:1}},
	{$project:{_id:0}},
	{$sort:{"actor":1,"genre":1}},
	{$out:"actors_and_genres"}
])
TODO il dataset è un po' sporchino.....
TODO trovare un dataset in cui fare somme, medie ecc... magari un csv così si fa l'import del csv
```