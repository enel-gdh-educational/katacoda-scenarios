# Using pymongo

Even if the command line interface is cool, it might
be useful to use some driver to connect with the database.
MongoDB provides a list of connector with the most 
used languages.

In the following we use the [pymongo](https://api.mongodb.com/python/current/) driver.

Open a `python3`, or even better an `ipython`, terminal terminal using the following command
```bash
$ ipython
```

You should have already installed the driver. Check that
the program is correctly installed using the following
command
```python
>>> from pymongo import MongoClient
```
To establish a connection with the database you should
use the following instruction
```python
>>> client = MongoClient('localhost', 27017)
>>> mflix = client["mflix"]
```
Notice that for an enterprise solution you should provide
additional information in the connection.