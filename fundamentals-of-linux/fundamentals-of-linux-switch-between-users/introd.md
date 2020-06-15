### su

The su short for substitute super user command using to change currently logged user. This makes things practical because the user change made without login. Su command can be used to get root privileges too. 

### sudo

sudo or superuser is a utility used on Unix systems that provides the running command with root or Administrator privileges. Not every user needs to have root privileges but in some cases needs to run commands with root privileges. We can use sudo to run some specific or all provided commands and edit files with the root privileges.

Su and sudo commands have different ways to act for similar aims.

### sudoers

The sudoers file is a file Linux and Unix administrators use to allocate system rights to system users. This allows the administrator to control who does what. Remember, Linux is built with security in mind. When you want to run a command that requires root rights, Linux checks your username against the sudoers file. This happens when you type the command “sudo”. If it determines, that your username is not on the list, you cannot run the command/program logged in as that user.

You can read sudoers using vim: 

`vim /etc/sudoers`

you can quit without saving typing :q and ENTER

