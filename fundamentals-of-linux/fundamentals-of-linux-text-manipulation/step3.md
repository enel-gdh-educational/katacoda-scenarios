

#### A) Split the Divina Commedia in 3 text files containing each of the 3 sections

Split the text in 3 files such that:
- the first file named 'sect_inferno.txt' starts from the first line of divina_commedia.txt and end ends with the last word of the INFERNO section
- the first file named 'sect_purgatorio.txt' starts from the beginning of the PURGATORIO section and end ends with the last word of the PURGATORIO section
- the first file named 'sect_paradiso.txt' starts from the beginning of the PARADISO section and end ends with the last line of the divina_commedia.txt file

Use the UTF-8 encoded version of the file.

Hint: use **head**, **tail** or **sed** to split the text, and then redirection to an output file using the using the > operator:

```
head -n num_line  file_input > file_output1
tail -n +num_line file_input > file_output2
sed -n start_line,end_line p  file_input > file_output3
```

- The first command reads the first num_line lines from filename and writes them to file_output1
- The second command reads all lines from file_input starting from num_line on and writes them to file_output2 
- The third command reads the lines between start_line and end_line from file_input and writes them to file_output3 

-----------

#### B) Count the number of words in each of the 3 sections

Hint: use the **wc** command

