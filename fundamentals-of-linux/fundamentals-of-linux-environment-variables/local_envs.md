A locally scoped ENV that is defined in a terminal cannot be accessed by any program or process running in the terminal. It can only be accessed by the terminal( in which it was defined) itself.

To set a global ENV you can use

NAME=Value

##### Exercise
________

Set a global ENV called SHAPE equal to "square" and print it


### How to access ENVs?

SYNTAX:

$NAME

##### Exercise
________

List all the files into /root folder replacing "/root" with a local ENV called myPATH

### Some commonly used ENVs in Linux

$USER: Gives current user's name.

$PATH: Gives search path for commands.

$PWD: Gives the path of present working directory.

$HOME: Gives path of home directory.

$HOSTNAME: Gives name of the host.

$LANG: Gives the default system language.

$UID: Gives user ID of current user.

$SHELL: Gives location of current user's shell program.


##### Exercise
________

List all the files into HOME directory

### How to unset enviornment variables?

SYNTAX:

unset NAME

or

$ NAME=''

##### Exercise
________

Unset COLOUR ENV and verify that it is empty
