----------

#### Linux authorization on files: Introduction and a bit of history

Linux is a multi-user operating system, meaning that multiple users can access the same system
even at the same time, each one experiencing their configuration of the environment. For instance, when a user logs in a Linux system,
 they automatically land into their home folder. The multi-user capability of Linux derives directly from its ancestor, Unix,
  which was used for servers and multi-terminal systems. In fact, nowadays most Linux distribution are installed without modifications on servers.

Therefore, tt is very important that a user can decide what files can be read, modified or executed by other users,
for privacy reasons. 

Moreover, the system files should be modifiable exclusivey by the system administrator, 
so that an unsolicited or malign user cannot corrupt, change or remove crucial data. 

The authorization on files is divided in two levels: ownership and permissions.

#### File ownership

We assume that you already know what users and user groups are in Linux. 
Each file is owned by a user. By default, the person who created a file becomes its owner. 

There is also a group associated to a file. 

**N.B.** There's no need for a file's owner to belong to that file's group, even though it would seem natural!

The ownership of a file can be changed through the command ``chwon`` (change owner), 
whereas the group associated to a file is changed by ``chgrp``. For both the usage is similar.

There are strict limitations about who can change the ownership of a file and we are not going in the details.
 In most cases, `root` privileges are required.  

Let us make an example.

First, let us create a new user, called `prova1`:

`adduser prova1`

and then go through the creation steps that are prompted. 

This process creates the home folder for the user `prova1`, which is by default `/home/prova1`.

Then, create e new file, `prova.txt`, in the home folder of the newly created user:

``touch /home/prova1/prova.txt``

and let us put some content in it:

`echo "some content" >> /home/prova1/prova.txt`

----------------------
**Question 1**

What are the owner and the group of `prova.txt` ?

Hint: use `ls -l`

----------------------

Let us check whether the user `prova1` can operate on this file. How can we do that?
Well, we should impersonate that user! This is done with the command `su` (superuser):

`su - prova1` 

which also moves you to the home folder of the new user *[1].

Now let us try to first read the file content and then modify it:

- `cat prova.txt`
- `echo "Some more content" >> prova.txt`

While you should be able to read the file content, you are prevented to modify it.
Why is that? Well, since user `prova1` is not the owner of the file by default it has only read permission on it.

Now let us change the owner of the file. Only the root user can do that, therefore type 

`exit` to get back to the root user.

Then type

``chown prova1 prova.txt``


---------------------------
**Exercise 1**

Verify that the owner of `prova.txt` has changed and that
the user `prova1` can actually modify it.

--------------------------

#### File groups

Besides the owner, a file is also associated to a one or more groups of users. 
Ever heard of a user group? Again worry not, it is just a collection of users of 
whom you can change the properties collectively. 
For instance, the permissions that they have with respect to a file or to system processes and functions.
Each user has unique primary group by default, and zero or more groups 

----------------------
**Question 2**

Verify that the group associated to the file we have played with so far is `root`

Reminder: the group is the argument next to the owner output by ``ls -l``

----------------------

The group `root` is a default group that only contains the root user. Not very useful for our purposes.

Let us assume that we want to add write permission to two new users, `prova1` and `prova2`.

-----------------
**Exercise 2**

Create two new users, `prova2` and `prova3`

-----------------

Now, we have to create a user group and include the newly created users into it:

The group is created via:

``groupadd newgroup``

and the users are added to the new group via:

``usermod -a -G newgroup prova2`` and ``usermod -G -a newgroup prova3``

In the last command the flag `-G` is to associate one or more supplementary groups listed after the flag `-a`
 to the user defined as the last argument.
 
Now let us change the group associated to the file. The group can be changed either by root or
 by the owner of the file if it belongs to the destination group.
 
To make our life easier, let us perform this operation as root, as you should be. 

``
chgrp newgroup /home/prova1/prova.txt
``

Now let us give write permission to `newgroup`

``
chmod g+w /home/prova/prova.txt
``

What? we haven't covered ``chmod`` yet? Well, that's the subject of the next section!

------------------
**Exercise 3**

Check that the users `prova2` and `prova3` can modify the usual file.

------------------


#### File permissions





*[1] N.B. you should have noticed that no password is required to change user. 
This is because in katacoda you are by default `root` user who can has permission
 to do pretty much everything it wants. In a standard Linux installation you typically won't login as root though.
 In Ubuntu Desktop the root user does not even exist, but you can invoke the power of begin root 
 by prepending `sudo` to each command for which you need the permissions of super user.