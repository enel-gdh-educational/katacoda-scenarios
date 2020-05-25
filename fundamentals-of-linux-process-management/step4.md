## Netstat command in Linux

Some processes make use of the network, and it can happen that they are *listening* on an address and a port.
Let’s first explain this two concepts. <br>
An **address**, technically the IP address, is like your home address: an identifier that the others use to reach you (that means your computer).
<br>
A **port** is a number associated to a process and it' used by others to communicate with *that specific process* running on the machine. <br>
So it works like this: to establish a connection, those who want to contact you have to specify the address, in order to reach your computer, and the port,
in order to communicate with the specific process they intend to.

There's a useful Linux command to display the running processes that are also listening on a port: ``netstat`` command.


Netstat command displays various network related information such as network connections, routing tables, interface statistics, 
masquerade connections, multicast memberships etc.

Examples of some practical ``netstat`` command :

-a -all : Show both listening and non-listening sockets. With the –interfaces option, show interfaces that are not up
netstat -a | more : To show both listening and 
non-listening sockets.