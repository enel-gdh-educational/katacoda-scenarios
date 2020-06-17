The su short for substitute super user command using to change currently logged user.  This makes things practical because the user change made without login. Su command can be used to get root privileges too. Su and sudo commands have different ways to act for similar aims.

### Change User

This commands the main usage area is changing current user and open the new shell for the specified new user. While changing user current environment variables will not change and stay as old users environment variable. In this example, we will change to the user root.

`su root`


### Man

Manpage of the su command is like below.

`man su`

You can scroll man using arrows or quit man typing "q"

### Help

To get fast and simple help the -h parameter can be used like below. As we can see there is very few options about the su command.

`su -h`

### Change User With Environment Variables

While changing user environment variables can get with the - parameter. If this parameter is not specified previous user’s environment variables will be used. We can see that after the user is changed the working directory is also changed as root’s home.

`su - root` 


### Run Command As Different User

Some commands may be needed to run as a different user. Every time changing user to run a command is not feasible. Commands can be run as a specified user with the -c parameter like below. In this example, simple ls command will be run as the root user.

Now switch to user U1

`su U2`

You could list the content of /root folder using su and then entering root password (p0)

`su -c ls root `










