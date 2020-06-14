sudo or superuser is a utility used on Unix systems that provides the running command with root or Administrator privileges. Not every user needs to have root privileges but in some cases needs to run commands with root privileges. We can use sudo to run some specific or all provided commands and edit files with the root privileges.

### List Available Commands

We can list available commands with the -l option which will list currently used root privileged commands the current user can execute.

`sudo -l`

This will list all of the rules in the /etc/sudoers file that apply to your user. This gives you a good idea of what you will or will not be allowed to do with sudo as any user.

root  ALL=(ALL) ALL indicates that the user root on all hosts using any user can run all commands. 

Now switch to user U2

`su U2`

You could list the content of /root folder using sudo and then entering password of U2 (p2)

`sudo ls /root`

But you cannot list the content of /root folder because U2 is not into /etc/sudoers 

If you try using U1 (password: p1)

`su U1`

`sudo ls /root`

you list the content of /root folder because U1 is into /etc/sudoers 

