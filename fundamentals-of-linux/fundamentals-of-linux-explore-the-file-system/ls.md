Now you know which directory you are currently in. But how do we know what is in this directory?

We can ask our server what files and directories are in the current directory with a command called ls. Type it in at the command prompt now:

`ls`

You see that /root directory contains some files and a folder called report which is blue coloured.

Not all commands have a built-in help option, but we many do. Most of the time, you can access this by adding a --help. We can try this with the ls command now:

`ls --help`

Thus if you want more informations about the content listed you can digit 

`ls -l`

Let’s try another option:

`ls -a`

This shows us some files that we didn’t see before. The -a flag is synonymous with the --all flag. This shows us all of the files in the current directory, including hidden files.

In Linux systems, all files that are named with a starting dot are hidden by default. They are not secret and anyone can find them, they are just kept out of the way for easy file administration. By passing the -a flag, we can tell ls to display these files as well.

We can pass multiple flags as well, by simply stringing them together:

`ls -l -a`

By default, ls will list the contents of the current directory. However, we can pass the name of any directory that we would like to see the contents of at the end of the command.

For instance, we can view the contents of a directory called /etc that is available on all Linux systems by typing:

`ls /etc`

##### Exercise
________

1. List /root/report content

2. List only directories names into /root folder

3. List /root content, ascending sorted by modification time
