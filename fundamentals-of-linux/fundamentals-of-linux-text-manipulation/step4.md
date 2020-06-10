

-----------

#### A) For each section, create a new file containing one word per line
	
Substitute spaces and punctuations marks with the new line symbol, 
so that there is no punctuation and there is at most one word per line.

<u>Hint:</u> use **tr** command and wildcards:

The tr utility copies the standard input to the standard output with 
substitution or deletion of selected characters:

```
tr string1 string2 < file_input
tr -d string1 < file_input
tr "[:lower:]" "[:upper:]" < file_input
tr "[:punct:]" "[:space:]" < file_input
```

- the first command replaces all string1 in file_input with string2
- the second command deletes all occurrencies of string1
- the third command replaces all lower letters with capital letters
- the forth command replaces all punctuations with empty spaces

-----------

#### B) Remove the word shorter than 5 letters

<u>Hint:</u> use **grep -v**

--------

#### C) Sort words

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

------------

#### D) Remove duplicated words and count the number of occurrences of each word

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

