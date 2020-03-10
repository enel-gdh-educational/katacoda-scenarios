# Installation

The first step is the installation of a local
version of MongoDB. Just type in your terminal
the following command
```bash
bash installer.sh
```
It may require few time to be completed. This
script is just a collection of instruction
reported [here](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/).

At the end of the installation you should be
able to open the command line interface.
In the command line just type
`mongo` to launch the console.

To show what is contained in the environment
use the following command
```javascript
> show dbs
``` 
You should see the output
```
admin   (empty)
local   0.078GB
```

To exit use the command
```javascript
> quit()
``` 
