A locally scoped ENV that is defined in a terminal cannot be accessed by any program or process running in the terminal. It can only be accessed by the terminal (in which it was defined) itself.

To set a local ENV you can use:

NAME=Value

To print a local ENV you can use:

echo $NAME

##### Exercise
________

1. Set a local ENV called SHAPE equal to "square"
2. Print SHAPE
3. Switch to user U2
4. Print SHAPE
5. Switch to root
6. Refresh page and print SHAPE


### How to unset enviornment variables?

SYNTAX:

unset NAME

or

NAME=''

##### Exercise
________

1. Unset SHAPE 
2. Verify that it is empty