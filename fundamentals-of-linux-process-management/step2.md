# Display processes

In the introduction we mentioned briefly the ``ps`` command. <br>
We said that it stands for **process state** and it displays some information of the processes running on the machine.
``ps`` command is used to list the currently running processes and their PIDs (process identification numbers) along with 
some other information depends on different options. It reads the process information from the virtual files in ``/proc`` file-system.<br>
``ps`` command provides numerous options for manipulating the output according to our need. The syntax:

```bash
ps [options]
```

**Options:**

Try to see the output of these different configurations of ``ps`` command.

1. Simple process selection: shows the processes for the current shell
      ```bash
       ps
      ```
      Result contains four columns of information.
      Where,
      * PID – the unique process ID
      * TTY – terminal type that the user is logged into
      * TIME – amount of CPU in minutes and seconds that the process has been running
      * CMD – name of the command that launched the process.
      
2. List all processes: to list all processes on a system use the -e option.
    ```bash
    ps -e
    ```
    This option can be combined with the -f and -F options to provide more information on processes.
    ```bash
    ps -ef
    ```
    If you execute it, you see that the first information displayed is the process owner (for example *root*). The second is the **process ID (PID)**.
    Keep in mind that the PID is in second position, it will be crucial to solve some exercises.
    
    Another commonly used syntax to achieve seeing every process on the system using BSD syntax is 
    ```bash
    ps aux
   ```
    
3. View all the running processes:
    ```bash
    ps -r
    ```

4. View all processes owned by you: processes with the same EUID as the runner of `ps` command, *root* in this case
    ```bash
    ps -x
    ```

5. Select the process by the command name. This selects the processes whose executable name is given in cmdlist.
There may be a chance you won’t know the process ID and with this command it is easier to search.
    ```bash
    ps -C command_name
    ```

    Example:
    ```bash
    ps -C script1
    ```

6. View process by process ID.
    Syntax:
    ```bash
    ps p process_id
    ps -p process_id
    ps --pid process_id
    ```
    You can also view multiple processes by specifying multiple process IDs separated by blank space or comma.

7. Select by effective user ID or name.
    Some possible cases:
    ```bash
    ps U user_name/ID
    ps -U user_name/ID
    ps -u user_name/ID
    ps –User user_name/ID
    ps –user user_name/ID
    ```

Beside these simple usage of flags, you can also combine them to list processes according to some criteria you may want.
For instance, you can list processes using highest memory.
```bash
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem
```

There are many other flags, both to display different kind of information and to format this information on the shell in many ways.
Here’s a [link to the man page](http://man7.org/linux/man-pages/man1/ps.1.html), in which you can find the complete flag list.

 

# Grep command

When we list processes via `ps` command, usually we see many more lines than we want. So here's where ``grep`` command can come in handy.
The grep command is used to search text. It searches in the given text (that could be in a file or on the shell screen) all the lines containing a match to the given strings or words. It is one of the most useful commands on Linux and Unix-like system.

**Syntax**

The syntax is as follows:
```bash
grep [option] 'word-to-search' [filename]
```
Options can be:

| **Option** | **Description** |
| ------ | ----------- |
| -i | Ignore case distinctions on Linux and Unix |
| -w | Force PATTERN to match only whole words |
| -v | Select non-matching lines |
| -n | Print line number with output lines |
| -h | Suppress the Unix file name prefix on output |
| -r | Search directories recursivly on Linux |
| -R | Just like -r but follow all symlinks |
| -l | Print only names of FILEs with selected lines |
| -c | Print only a count of selected lines per FILE |
| --color | Display matched pattern in colors |


Grep can be useful in many situations:
* find a specific file after an `ls` command;
* search for a word (or more than one) in a document;
* in the case of process management, we can use it to display only the information about the processes that we are interested in.


**Some examples**

A common usage of ``grep`` is finding words inside files. Flag **-w** indicates to the command that it has to seek for a word.
```bash
grep -w word-to-search /path/to/file
```

Try to search a specific word ("stop", for instance) in *script1* file.

You can also search for more than one word, thanks to the variant `egrep` command:
```bash
egrep -w 'word1|word2' /path/to/file
```

You can also count lines in which the words you search for have been matched
The ``grep`` command can report the number of times that the pattern has been matched for each file using **-c** (count) option:
```bash
grep -c 'word-to-search' /path/to/file
```

Passing the **-n** option, you obtain each output line preceded with the *line number* in the text file from which it was obtained:
```bash
grep -n 'word-to-search' /path/to/file
```

We can force ``grep`` to display output in colors, enter:
```bash
grep --color word-to-search /path/to/file
```
We suggest to read the [grep man page](http://linuxcommand.org/lc3_man_pages/grep1.html) too.

### Concatenate commands

Finally, ``grep`` is often used in sequence with other operation. Let's see how. Linux uses the 'pipe' character (it -> ``|``) to concatenate commands in the terminal.
For instance,
```bash
ls -l | wc -l
```
counts the the file listed in the current directory. ``ls -l`` produces the list of files, then ``wc -l`` runs immediately after to count the elements of the list and print the counter on the screen.

Similarly, we can use grep to pick specific process informations provided py ``ps`` command. For instance:
```bash
ps -ef | grep script2
```

---
**Exercise 1**

Execute twice *script2* concatenating the two executions in a single command. Use the output redirecting on the same file (called *output_twice.txt*) in the append mode. <br>
What do you see inside output_twice.txt?

1. Only the output of the second execution.
2. The outputs of the two executions mixed up.
3. The output of the first execution followed by the output of the second execution.

Can you also figure out why?

---

---
**Exercise 2**

1. Find number of lines in *text.txt* file. How many are them?
2. Find the total occurrences of the word **Jude** in *text.txt* file. Can you find the number?
 
---



