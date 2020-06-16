How do we change our working directory? Changing our working directory will allow us to use relative paths from a different location. Usually, it is easier to operate on files from the directory where they are contained.

We can move around the file hierarchy by using the cd command. This command stands for change directories.

A more general idea of how to use the command is like this:

cd /path/to/directory

Thus if you want to enter /root/report directory you have to digit

`cd /root/report`

Now you can verify which is the current folder using

`pwd`

For instance, to change to the 'root' directory, specified by a single slash (/), which is the top of the tree, we can type:

`cd /`

`pwd`

The root directory (specified by a single forward slash '/') is different from the home directory of the root user (located at '/root'). This can be confusing at first, but just remember that the top of the directory tree is called the file system root.

Come back to /root

`cd /root`

`ls`

Since /report directory is contained into /root directory we can enter /report typing

`cd report`

Now if you type

`cd /root`

`cd /report`

you will get an error because cd /report refers to an absolute path and there is not a folder called report in the directory tree, while cd report refers to a relative path and it is equivalent to cd /root/path. 

Let’s try to move up the tree using relative paths. How do we reference the folder containing our current folder using relative paths?

We can reference the directory that contains our current directory using a special syntax. The directory containing our current directory is called its “parent” directory. We can reference the parent directory using two dots (..).

Now enter /root/report:

`cd /root/report`

Let’s move back up a level:

`cd ..`

`pwd`

If you want to go back to home directory you can type

`cd`

##### Exercise
________

1. Go to root directory

2. List all the folders

3. Go to the folder media 

4. Go to the folder cdrom

5. List the content  

6. Go back two levels 

7. List only directories into /root folder

8. Go to root home
