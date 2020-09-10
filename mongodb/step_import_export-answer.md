### Exercise 1 
In the bash shell
```
# import data
$ mongoimport --db=datasets --collection=movies --file=/root/datasets/movies_limited.json 

# enter inside the mongo shell
$ mongo
```
In the cli
```
# switch database
> use datasets;
# count the rows
> db.movies.count();
```


### Exercise 2 
In the bash shell:
```
# import data
$ mongoimport --db=datasets --collection=cities --type=csv --headerline --file=/root/datasets/cities.csv 
```
Then enter inside the mongo shell
```
$ mongo
```
In the cli use the following commands
```
# switch database
> use datasets;
# count the rows
> db.cities.count();
```

### Exercise 3 
In the bash shell
```
# import data
$ mongoimport --db=datasets --collection=movies --drop --file=/root/datasets/movies.json 

# enter inside the mongo shell
$mongo
```
Then in the cli
```
# switch database
> use datasets;
# count the rows
> db.movies.count();
```

### Exercise 4 
In the bash shell
```
# create folder (if needed)
$ mkdir -p /root/exported_data

# export dataset
$ mongoexport --db=datasets --collection=cities --type=json --out=/root/exported_data/cities.json

# show head of file
$ head /root/exported_data/cities.json
```

### Exercise 5
In the bash shell
```
# create folder (if needed)
$ mkdir -p /root/exported_data

# export dataset
$ mongoexport --db=datasets --collection=movies --type=csv --fields=year,title,cast,genre --out=/root/exported_data/movies.csv

# count lines
$ wc -l /root/exported_data/movies.csv
```