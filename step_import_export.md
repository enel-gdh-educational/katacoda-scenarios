# Import and export data

**mongoexport** is a command-line tool that produces a JSON or CSV export of data stored in a MongoDB instance.

The **mongoimport** tool imports content from an Extended JSON, CSV, or TSV export created by **mongoexport**, or potentially, another third-party export tool.

## mongoimport

Guide: https://docs.mongodb.com/v4.2/reference/program/mongoimport/

*Tip: mongoimport is a command that you need to run outside the mongo shell.*

### Exercise 1) import json
1. Create a new collection *movies* in the db *databases* by importing the json file */root/datasets/movies_limited.json*. Use the **mongoimport** command.
2. Test the result of your import by counting the rows of your new collection. There should be 16 documents.


### Exercise 2) import csv
1. Create a new collection *cities* in the db *databases* by importing the json file datasets/cities.csv. Use the **mongoimport** command.
*Hint: the first line of the csv is the header*
2. Test the result of your import by counting the rows of your new collection. They should be 128

### Exercise 3) import truncating existing data
1. Import the json file *datasets/movies.json* into the existing collection *datasets.movies*, truncating the old data, that we don't need anymore. Use the *mongoimport* command and its settings to overwrite the old data.
2. Test the result of your import by counting the rows of your new collection. They should be 28795

## mongoexport

Guide: https://docs.mongodb.com/v4.2/reference/program/mongoexport/

*Tip: mongoexport is a command that you need to run outside the mongo shell.*

### Exercise 4) export as json
1. Export the collection *datasets.cities* and store it as a json file in the folder *exported_data*. Use the **mongoexport** command.
2. Check if the file has been created and read its content.

### Exercise 5) export as csv
1. Export the collection *datasets.movies* and store it as a csv file in the folder *exported_data*. Use the **mongoexport** command.
*Optional: exclude the id field from the export and change the order of the fields (example: year as first column)*
2. Check if the file has been created and read its content.
