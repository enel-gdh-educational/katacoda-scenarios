----------------------
**Question 1**

The owner is `root` and the group is `root`

----------------------

----------------------
**Exercise 1**

- `su - prova1` to impersonate the user `prova1` and move to its folder
- `ls -l prova.txt` to check the owner of the file has changed
- `echo "some more content" >> prova.txt` to add a new line at the end of the file

----------------------


-----------------
**Exercise 2**

- `adduser prova1` (then follow the prompted instructions)
- `adduser prova2` (then follow the prompted instructions)

-----------------


------------------
**Exercise 3**

The solution is identical to that of Exercise 1, but changing the user correspondingly

------------------


-----------
**Exercise for the brave ones**

The operating system searches for a file called `ls` in a list of folders, among which `/bin`

and does not find it.

The list of folders in which executable files are searched for is defined 
in the environemnt variables PATH. If you want to access its content just type

`echo $PATH`

The folder paths are delimited by `:`. Find `/bin` among those.


-----------


---------------
**Exercise 4**

1. Solution to part 1

- `chmod u+x permissions.txt`
- `chmod g+wx permissions.txt`
- `chmod o-r permissions.txt`

2. Solution to part 2
- `chgrp newgroup permissions.txt`
- `cp permissions.txt /home/prova2`
- `su - prova 2`
- `echo "any content >> /root/permissions.txt` 

The latest command should not return any error.

---------------

------------
**Exercise 5**

1. `ls -l`, then check that the permissions are `rw-r-xr--`

2. `chmod 465 permissions.txt`

-----------



