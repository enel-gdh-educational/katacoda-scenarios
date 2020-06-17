A globally scoped ENV that is defined in a terminal can be accessed from anywhere in that particular environment which exists in the terminal. That means it can be used in all kind of scripts, programs or processes running in the environment bound by that terminal.

To set a global ENV you can use

export NAME=Value

or

set NAME=Value

To print a global ENV you can use

echo $NAME

##### Exercise
________

1. Set a global ENV called COLOUR equal to "red"
2. Print COLOUR
3. Switch to user U2 
4. Print COLOUR
5. Refresh page and print COLOUR
