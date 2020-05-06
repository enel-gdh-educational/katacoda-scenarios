# Installation

The first step is the installation of a local
version of MongoDB. Just type in your terminal
the following command
```bash
bash installer.sh
```
It may require few time to be completed. This
script is just a collection of instructions, see 
[here](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/)
for further details.
To show the content of the script use for instance `cat installer.sh`.

At the end of the installation you should be
able to open the command line interface (cli).
In the terminal just type
`mongo` to launch the console.

To show what is contained in the environment
use the following command
```javascript
> show dbs
``` 
You should see the following output
```
admin   0.000GB
config  0.000GB
local   0.000GB
```

To exit use the command
```javascript
> quit()
``` 
