

-----------

#### A) Create a new file containing one word of the Inferno section per line
	
Substitute spaces, carriage returns ('\r') and punctuations marks with the new line symbol ('\n'), 
so that there is no punctuation and there is at most one word per line.

<u>Hint:</u> use **tr** command:

The tr utility copies the standard input to the standard output with 
substitution or deletion of selected characters:

```
tr char1 char2 < file_input
tr -d string1 < file_input
tr "[:lower:]" "[:upper:]" < file_input
tr "[:punct:]" "[:space:]" < file_input


```

- the first command replaces char1 in file_input with char2
- the second command deletes all occurrencies of string1
- the third command replaces all lower letters with capital letters
- the forth command replaces all punctuations with empty spaces



-----------

#### B) Replace al capital letters to lower letters from the single word files

<u>Hint:</u> use again **tr** 

-----------

#### C) Remove the word shorter than 5 letters

<u>Hint:</u> use **grep** 

--------

#### D) Sort words

<u>Hint:</u> use **sort**

The sort utility sorts text and binary files by lines

```
sort file_input
sort -n file_input
sort -k num file_input
sort -r
sort -R  
```

- the first command sorts lines of file_input alphabetically
- the second command sorts lines arithmetically
- the third command sorts lines considering the num-th word of each line
- the forth command sorts in reverse order 
- the fifth command sorts in random order

Using the sort command, sort alphabetically all words of inferno section. 

Which is the first word from the Inferno section? Which is the last one?

------------

#### E) Remove duplicated words and count the number of occurrences of each word

Create 3 files (one per section) such that the first column of each file contains 
all distinct words longer than 5 letters appearing in the section and the second column contains the number of occurrencies of 
the word in the section

<u>Hint:</u> use **uniq** (combined with **sort**)


```
uniq file_input 
uniq -c file_input
```

- the first command reads the specified input_file comparing adjacent lines, 
and writes a copy of each unique input line to the output_file
- the second command also counts of the number of times the 
line occurred in the input


Using pipes and output redirection, write a composite command which performs all the task listed in this page
and produce the desired output, and replicate if for Inferno, Purgatorio and Paradiso.

