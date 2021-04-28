# Netstat command in Linux

Some processes make use of the network, and it can happen that they are *listening* on an address and a port.
Let’s first explain this two concepts. <br>
An **address**, technically the IP address, is like your home address: an identifier that the others use to reach you (that means your computer).
<br>
A **port** is a number associated to a process and it' used by others to communicate with *that specific process* running on the machine. <br>
So it works like this: to establish a connection, those who want to contact you have to specify the address, in order to reach your computer, and the port,
in order to communicate with the specific process they intend to.

There's a useful Linux command to display the running processes that are also listening on a port: ``netstat`` command.


Netstat command displays various network related information such as network connections, routing tables, interface statistics, masquerade connections, multicast memberships etc. This course does not cover these topics, since they are quite advanced. For us, ``netstat`` is a monitoring tool such as ``ps``.

#### Examples of some practical ``netstat`` command

We said that we use ``netstat`` as a monitoring tool. For what? It's useful when we search for information about processes listening on addresses and ports. <br>
Here are some flags we can use:

| **Flag** | **Description** |
| -------- | --------------- |
| -a | Displays all connections and listening ports. |
| -n | Displays addresses and port numbers in numerical form. |
| -p | Displays the owning process ID associated with each connection. |

We recommend to use the -a flag: in this way you are sure that you list all the listening processes. «But there are a lot!»
 you might say. Yes, but you can select only the ones you need using ``grep`` command.
 
Here's the [netstat man page](https://linux.die.net/man/8/netstat), if you want to go deeper in details.

---
**Exercise 1**

Prerequisite: execute this command
```bash
pip2 install flask
```
Then execute the script *script3*.
<br>
This script launches a simple server which is listening on port **8087**.

Use netstat command to find the **numerical** IP address on which the process is listening.<br>
  [Hint: ``netstat`` displays **IP address**:**port**]

Which one of the listed is the correct IP address?
1. 127.0.0.1
2. 0.0.0.0
3. localhost

---

---
**Exercise 2**

Find the process launched by *script3* and kill it by pid.
<br>
  [Hint: *script3* launches the application **api_server.py**].

If you search for port 8087 with ``netstat`` again, you should not find it among the listed.


---
