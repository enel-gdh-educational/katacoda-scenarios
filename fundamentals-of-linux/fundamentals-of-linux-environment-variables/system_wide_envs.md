These variable are set and configured in /root/.bashrc or /root/.bash_profile
files according to the requirement. These variables can be accessed by a particular user and persist through power offs.

You can visualize the content of bashrc using vim

`vim /root/.bashrc`

you can quit without saving typing :q and ENTER

##### Exercise
________

1. Visualize the content of bashrc 
2. Find the value associated to userwide ENV HISTSIZE
3. Close bashrc and exit without save
4. Print HISTSIZE
5. Switch to user U2
6. Print HISTSIZE
7. Refresh page and print HISTSIZE

To display all the system-wide and global ENVs you can type:

`env`

##### Exercise
________

1. Set a local ENV called LENGTH equal to 50
2. Set a global ENV called WEIGHT equal to 30
3. Display all the ENVs