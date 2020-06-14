### su

The su short for substitute super user command using to change currently logged user. This makes things practical because the user change made without login. Su command can be used to get root privileges too. 

### sudo

sudo or superuser is a utility used on Unix systems that provides the running command with root or Administrator privileges. Not every user needs to have root privileges but in some cases needs to run commands with root privileges. We can use sudo to run some specific or all provided commands and edit files with the root privileges.

Su and sudo commands have different ways to act for similar aims.

### sudoers

The sudoers file is a file Linux and Unix administrators use to allocate system rights to system users. This allows the administrator to control who does what. Remember, Linux is built with security in mind. When you want to run a command that requires root rights, Linux checks your username against the sudoers file. This happens when you type the command “sudo”. If it determines, that your username is not on the list, you cannot run the command/program logged in as that user.

`vim /etc/sudoers`

Now switch to user U1

`su U1`

We can list available commands with sudo and the -l option which will list currently used root privileged commands the current user can execute.

`sudo -l`

This will list all of the rules in the /etc/sudoers file that apply to your user. This gives you a good idea of what you will or will not be allowed to do with sudo as any user.

U1  ALL=(ALL) ALL indicates that the user U1 on all hosts using any user can run all commands. 


Now switch to user U2

`su U2`

You could list the content of /root folder using sudo and then entering password of U2 (p2)

`sudo ls /root`

But you cannot list the content of /root folder because U2 is not into /etc/sudoers 

##### Exercise
________

1. Switch to user U1 (password p1)
2. List available commands for U1
3. List the content of /root folder


Now switch to user U2

You could list the content of /root folder using su and then entering root password (p0)

`su -c ls root `

##### Exercise
________

1. Switch to user U3 (password p3)
2. List available commands for U3
3. List the content of /home/U1 folder




