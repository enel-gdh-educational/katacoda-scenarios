
#### A) Count the number of words in Divina Commedia

<u>Hint:</u> Use the word count command: 

**wc** filename

Try out few arguments of the **wc** command:
- Use **-w** to count the number of words in the file
- Use **-l** to count the number of lines in the file
- Use **-c** to count the number of characters in the file

Notice that you can get all the 3 counts without specifying any argument besides the filename:

```
wc filename
```

Use the UTF-8 converted version of the Divina Commedia.

-----------

#### B) Are there lines containing letter 'x'? And what about letter 'w'?

<u>Hint:</u> use grep command to retrieve all lines containing the desired pattern:

```
grep mystring filename
grep -n mystring filename
grep -v mystring filename
```

- the first command will print all lines containing the pattern 'mystring';
- the second will also print the line number;
- the third one will print all lines **not** containing the pattern.


----------------

#### C) In how many lines is Beatrice mentioned through Divina Commedia? 

<u>Step 1:</u> use grep command and redirect the output on the file Beatrice.txt

<u>Step 2:</u> use the wc command on the Beatrice.txt file

Note that the '>' symbol is used for output (STDOUT) redirection:

```
command > output_file 
```

this will execute command, and its output will be re-directed to file "output_file" instead of your screen.

If you do not want a file to be overwritten but want to add more content to an existing file, 
then you should use '>>' operator:

```
command >> output_file 
```

----------------

#### D) In how many lines is Beatrice mentioned through Divina Commedia (again)? 

As an alternative approach to count the number of lines without creating a temporary Beatrice.txt file,
 you can simply use the grep command 'piped' with wc command.


A Unix pipe connects the STDOUT (standard output) file descriptor of the first process to the STDIN (standard input) 
of the second:

```
command1 | command2 
```

will execute command, and then redirect its output as input of command2.

Try again to count the number of lines in which Beatrice using the pipe and verify you get the same number as before.


