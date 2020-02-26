## Learn how to use join, awk and paste

------------

#### A) Sort the words longer than 5 letters according to their occurrencies, having the most frequent words at the top of the file

<u>Hint:</u> use **sort -k -nr**

------------

#### B) List the 10 most common words from Inferno and Paradiso

-------------

#### C) Create a table with words appearing both in Inferno and Paradiso, listing the occurrencies in the two sections 

<u>Hint:</u> Use **join** command 

```
join  -1 field1 -2 field2  file1 file2{{execute}} 
```

 This join command performs an equality join on file1 and file2 
 and writes the result to the standard output. The field1 and field2 are the fields 
 in each file by which the files are compared (default would be first field)

<u>Hint:</u>  sort files alphabetically before joining them.

-------------

#### D) Compute a 'paradisiac' score based on their occurrencies and add it as a new column

Compute a *'paradisiac' score* for word x as: 


 score(x) = (x<sub>p</sub>-x<sub>i</sub>)/(x<sub>p</sub>+x<sub>i</sub>)


where x<sub>p</sub> is the number of occurrencies in Paradiso, 
and x<sub>i</sub> is the number of occurrencies of word x in inferno

Compute the *paradisiac* score for all words longer than 5 letters appearing both in Paradiso and Inferno

<u>Hint:</u> Use **awk**. 

```
awk -F " " 'BEGIN {} {print $2 + $3} END {}' file_input.txt{{execute}} 
```
This is an example of awk command which
scans each input file line and print the sum of second field plus third field;
 special patterns BEGIN and END may be used to 
capture control before the first input line is read and after the last.
The -F option is used to separate fields.

------------

#### E) Concatenate two files by lines

<u>Hint:</u> Use **paste**

```
paste fileA fileB{{execute}} 
``` 

The paste command concatenates the corresponding lines of the given input files
and writes the resulting lines to standard   output.

-------------

#### F) Sort words based on the 'paradisiac' score 

Which are the 10 most 'paradisiac'? 

and what about the 10 most 'infernal' words?
