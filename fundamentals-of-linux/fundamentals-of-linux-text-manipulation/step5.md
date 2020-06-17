
------------

#### A) Sort the words according to their occurrencies,
 
For each of the table files, sort the words in decresing frequency order (having the most frequent words at the top of the file)

<u>Hint:</u> use **sort -k -nr**

------------

#### B) List the 10 most common words from Inferno and Paradiso

<u>Hint:</u> use **head**

-------------

#### C) Create a file with all words longer than 5 letters appearing both in Inferno and Paradiso 

Each row of the file should contain 3 fields: 
- the word 
- the number of occurrencies in Inferno 
- the number of occurrencies in Paradiso 

<u>Hint:</u> Use **join** command 

```
join  -1 field1 -2 field2  file1 file2
```

 This join command performs an equality join on file1 and file2 
 and writes the result to the standard output. The field1 and field2 are the fields 
 in each file by which the files are compared (default would be first field)

<u>Hint:</u>  sort files alphabetically before joining them.

-------------

#### D) Compute a 'paradisiac' score 



Compute a *'paradisiac' score* for each word comparing the frequency of occurrency in Paradiso and Inferno.

Define the *'paradisiac' score* score for word x as: 


 score(x) = (x<sub>p</sub>-x<sub>i</sub>)/(x<sub>p</sub>+x<sub>i</sub>)


where x<sub>p</sub> is the number of occurrencies in Paradiso, 
and x<sub>i</sub> is the number of occurrencies of word x in inferno

Create a file containing the list of *paradisiac* scores for all words appearing in the output of the previous exercise.

<u>Hint:</u> Use **awk**. 

```
awk -F " " '{print $2 + $3} ' file_input  > file_output
```
This is an example of awk command which
scans each input file line and print the sum of second field plus third field;
 special patterns BEGIN and END may be used to 
capture control before the first input line is read and after the last.
The -F option is used to define the field separator.

------------

#### E) Concatenate two files by lines 

Create a file with 4 fields:
- the word
- the occurrencies in Inferno
- the occurrencies in Paradiso
- the Paradisiac Score


<u>Hint:</u> Use **paste**

```
paste fileA fileB
``` 

The paste command concatenates the corresponding lines of the given input files
and writes the resulting lines to standard   output.

-------------

#### F) Sort words according to the 'paradisiac' score 

Which are the 10 most 'paradisiac'? 

and what about the 10 most 'infernal' words?
