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

`su -c "ls /root" root `

##### Exercise
________

1. Switch to user U3 (password p3)
2. List available commands for U3
3. List the content of /root folder

##### Exercise
________

1. Switch to user U4 (password p4)
2. List available commands for U4
3. List the content of /root folder



