## Learn how to use wc and grep commands

#### A) Count the number of words in Divina Commedia

<u>Hint:</u> Use the command: **wc** filename

Try out few arguments of the **wc** command:
- Use **-w** to count the number of words in the file
- Use **-l** to count the number of lines in the file
- Use **-c** to count the number of characters in the file

Notice that you can get all the 3 counts without specifying any argument besides the filename:

```
wc filename{{execute}}
```

-----------

#### B) Are there words containing letter 'x'? And what about letter 'w'?

<u>Hint:</u> use grep to retrieve all lines containing the desired pattern:

```
grep mystring filename{{execute}}
grep -n mystring filename{{execute}}
grep -v mystring filename{{execute}}
```

- the first command will print all lines containing the pattern 'mystring';
- the second will also print the line number;
- the third one will print all lines **not** containing the pattern.

----------------

#### C) How many times is Beatrice mentioned through Divina Commedia? 

<u>Hint:</u> use grep command piped with wc command

A Unix pipe connects the STDOUT (standard output) file descriptor of the first process to the STDIN (standard input) of the second:

```
command1 | command2 {{execute}}
```

will execute command1, and then redirect its output as input of command2.

--------------

#### D) At which line does the Inferno section starts? And what about Purgatorio? and Paradiso?

<u>Hint 1:</u> Each section stats with the name of the section in upper case

<u>Hint 2:</u> use **grep -n** to identify the line number where 'INFERNO', 'PURGATORIO' and 'PARADISO' words occur



