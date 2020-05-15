----------

#### Where are we: positions in the filesystem

The first thing you want to know when you open a Linux terminal is in which folder you are, or in other words what is 
your current directory. The command to print it is:

```bash
pwd
```

Notice that sometimes the prompt already tells you about the current folder, it depends on how it is configured.


#### What is in here: list the files

The next thing you want to know is what files the current directory contains. Just type 

```bash
ls
```

and you'll get a list of the file. However, this list may not be comprehensive since hidden files are not shown by default.

In order to show them, just add the flag  `-a` 

```bash
ls -a
```

If you see any additional files, their name will certainly begin with a dot `.`. 

This is the way for the filesystem to recognize that a file is meatnt o be hidden. 
Everytime you will create a file, if you prepend `.` to its name, the file will be hidden.


##### Short digression: command options and usage tips 

In general, in Linux terminal, you can provide additional options and keywords that look like `-a` , `--all` etc.

To know the list of options of a command and how to access it you can access its manual page:

```bash
man ls
```

For modern commands, a help text is displayed through the flag `--help`. For instance, 

```bash
git --help
```

---------------
**Question 1**

What is the git subcommand to create an empty repository?

---------------
 
The next step is to collect information about the files, such as their size, creation date, etc.
 Also, since directories are just a special type of file, we want to know whether this folder contains subdirectories.
 Just add the option `-l`:

```bash
ls -l
```
If you want to show also hidden files:

```bash
ls -la
```

Notice that you can collapse single-character options, instead of typing  `ls -l -a`.


Look at the output; it is structured one file per line.
If first character of the first column is `d` the file is actually a directory. The remaining characters of the first column define the permissions.
We will have a dedicated tutorial step for that, so let us skip the explanation now.

The second and third column are, respectively, the user and the group owning the file.
 In katacoda there is only the `root` user and `root` group by default. 

The 4th column is the size in bytes of the file.
This is not very readable, isn't it?. Add the flag `-h` (`ls -lah`) to print a human readable file size.

The further colums represent the last modification time of the file.
 If the file has not been modified since its creation it coincides with the creation file.

The last column is the name of the file. Notice that in the Katacoda terminal, dircetories and hidden files appear coloured. 

This again depends on the configuration of the terminal.

The ordering of the files is alphabetical but you can force another sorting criterion, for instance, by modification time, 
just adding the flag `-t` (time).

If you need descending ordering, further add the flag `-r` (reverse).

Finally, you want to be able to list the files of an arbitrary path. For that, just add the path you want to browse after the command.
For example:

```bash
ls /
```

will list the files of the root folder (`/`), that is the first level of the filesystem.

---------------
**Question 2**

What is the first file or directory that has been created in the folder `/usr` ?

Can you make so that it will appear in the first line?

---------------


#### Move across folders


cd 

Cd -

cd ..

cd ../../

etc.

----------------------------
##### Master tips:

$PS1