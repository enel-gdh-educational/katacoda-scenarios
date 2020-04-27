In this section we will learn about ``apt``, the high-level tool to manage packages from the command line.
This tool has the ability to interact with remote package repositories to search and download the packages to install. 

Nowadays, there are graphical clients such as Synaptic and, more recently, the Ubuntu Software Center, that is similar to an App Store.

However, many believe that ``apt`` and its precursor, ``apt-get``, remain the most powerful ones.

Let us install the vim package:

```bash
apt install vim
```

`apt` has prompted you some info about what consequence the installation will have, that is, the packages that will be installed, 
the amount of data that need to be downloaded, and the space on disk that will be occupied. Say Y to continue.

The download may take few seconds depending on the speed of the internet connection. 
The duration of installation rather depends on the complexity of the setup tasks (archive extraction, file copy,
 environment setting, etc.)
 
 ----
 **Exercise 3**
 
 Check that vim has been installed and what version has been installed.
  
 ----
 
If you will ever decide to remove a package, the most complete way to do it is:

```bash
apt purge vim
```
 
 Now, suppose that you do not know the exact name of a package that you want to install. You can just search the ``apt`` repositories:
 
```bash
apt search python
```

The problem with this command is that it will search in all the package descriptions, thus returning you a huge number of packages that 
are just related to python. Plus, searching might be very slow. ()

You can restrict the search only to package names, but in this case you have to provude a regular expression.
 If you do not know what a regular expression is, worry not. It is a syntax to define patterns that you
 want a string to match. For instance, suppose you want to install python, then you can search
    
```bash
apt search --names-only '^python.*'
```

which means that you are requesting all the packages that contain "python" after at the beginning (`ˆ`),
 followed by any number of characters (`.*`)
 

ALternatively, if you are looking for python 3, just search for

```bash
apt search --names-only '^python3.[0-9]$'
```

meaning that the package name must be "python3." followed by any digit (`[0-9]$`), which is the usual versioning.

----
**Question**

What version of python 3 is installed in your system?   

----


----
**Exercise 4**

Install the latest version of python

----
 
Before deciding whether to install a package you may wonder what is its content. Remember? ``dpkg`` had a similar function, 
but this one applies also to packages which have not been downloaded yet since ``apt`` has the ability to query remote indices.

```bash
apt show python3.6
```

Finally, if you wonder what is the version of a package that would be installed if you did not specify a specific one, you can use:


```bash
apt policy vim
```

which will tell you what is the installed version of `vim` and what would be the version installed by default.

---
**Question**

What is the version of `postgresql` that `apt` would install? Is it the most recent one? 

Do you wonder why? If you are intersted in how to install the latest, jump to the next (optional) section

---