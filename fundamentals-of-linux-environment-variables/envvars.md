### What is an environment variable?

Environment variables or ENVs basically define behavior of the environment. They can affect the processes ongoing or the programs that are executed in the environment.

### Scope of an environment variable

Scope of any variable is the region from which it can be accessed or over which it is defined. An environment variable in Linux can have global or local scope.

### Global ENVs

A globally scoped ENV that is defined in a terminal can be accessed from anywhere in that particular environment which exists in the terminal. That means it can be used in all kind of scripts, programs or processes running in the environment bound by that terminal.

To display all the global ENVs

`env`{{execute}}

To set a global ENV you can use

export NAME=Value

or

set NAME=Value

To print a global ENV you can use

echo $NAME

##### Exercise
________

Set a global ENV called COLOUR equal to "red" and print it

### Local ENVs

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


### To set user wide ENVs

These variable are set and configured in ~/.bashrc or ~/.bash_profile
files according to the requirement. These variables can be accessed by a particular user and persist through power offs.

You can visualize the content of bashrc using vim

`vi ~/.bashrc`{{execute}}

you can quit without saving typing CRTL+c, :q, ENTER

##### Exercise
________

Visualize the content of bash_profile and exit without save

