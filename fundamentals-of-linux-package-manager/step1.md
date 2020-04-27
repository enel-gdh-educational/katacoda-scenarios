----------

#### Packages: What and why

As you probably know, software is developed writing lines of code, collected in text files. 
The binary code executable by a machine is generated through a process called compilation, which is out of this scope.

The compilation step usually generates binary objects (executables and libraries) that are collected in packages
 together with all the relevant files and instructions that are needed to configure and document the software.

Moreover, a package contains the instructions to extract the aforementioned files and place them in the correct location of the filesystem. 

Software is usually not distributed via sharing code that the final user has to compile, since this would be impractical.
 even though some scientific software is still distributed this way. 
Instead, the most appropriate way to share software is by letting user download and install a software package, in an automated way. 
 
Clearly, binary objects can only be used by a specific architecture, thus a package generated for windows will not work for Ubuntu and viceversa.
 Packages are hardly sharable even across different Linux distributions and, indeed, the extensions of package files vary depending whether you
 are using Fedora, Mint, OpenSuse, Alpine etc. 

The typical extension of packages in Debian-derived distributions, such as Ubuntu, is `.deb` and the command line utility
 that handles those files is `dpkg`.

Let us play with those.


#### Basic usage of `dpkg`

The first thing you would like to do is have a list of the packages that are already installed in your system.
This is easy; just type

```bash
dpkg -l 
``` 

and `Return`.

This will print an exhaustive list of the packages already present in your system. To inspect more closely one such package,
 say `adduser`, run


```bash
dpkg -L adduser 
``` 

This will print a list of files 'owned' by the package, that is, that have been created when installing that package,
 or that are accessed/used by it. 

If you are interested in more general information about the package, for instance a more readable description, 
the list of its dependencies, its origin etc., use  

```bash
dpkg-query -p adduser 
``` 

I encourage you to spend few seconds inspecting the info that have been prompted.



```bash
wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.0.1453-1ubuntu1.3_amd64.deb
``` 
```bash
wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.0.1453-1ubuntu1.3_amd64.deb
``` 

Now, let us try to install `vim`, an advanced text editor that runs in the terminal. First download its package via:

```bash
wget http://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.0.1453-1ubuntu1.3_amd64.deb
``` 

Do you wonder how I've found this URL? Easy, I have just searched this index [https://pkgs.org/](https://pkgs.org/)

Now, you are ready to install the VIM package by running:

```bash
dpkg -i vim_8.0.1453-1ubuntu1.3_amd64.deb
``` 

But, ... you will most probably experience an error because some dependency are be missing.
 
If you are wondering what is a dependency, well it is another piece of software that the main package depends on.
 In fact, most libraries are shared by multiple softwares and incorporating them would lead to a much bigger size of the main package.
Moreover, an update of a library would not immediately reflect into all the packages that use it and system vulnerabilities
  would require massive systems'updates to be fixed.


Strange though, the vim package has been installed, as you will verify in the next exercise!


---
**Exercise 1**

Check that ``vim`` appears among of the installed package with a one-line command.

*Hint*: Pipe `dpkg` with one of the tools that you have learnt so far to filter the output.

---

However, if you try to launch vim

```bash
vim
``` 

you will get an error pointing out that vim is looking for some libraries that are missing because the package in which
 they are included is not installed.

So, now you have two options: 

1. **Option 1** Look for the missing packages,
 find them, and install them one by one. Oh, I was forgetting, each missing package might have further unsatisfed dependencies!
 
2. **Option 2** You jump to the next step and discover a powerful tool that does the job for you.
 
 But before that , do not forget to clean up your system, by removing the unusable vim package:
 
 ```bash
dpkg -r vim
``` 

For the brave among you, I challange you taking this tough exercise:

---
**Exercise 2**

Determine the five installed packages with the largest size.

*Steps*: 
1. You already know how to list the installed packages with `dpkg -l` 
2. Pipe the output with `tail +<N>` where N is the number of heading lines you want to skip.
3. Select a single columns of an output stream through `awk '{print $<column_number>}'`
4. Make them become the input of a new command adding the pipe `| xargs`
5. Run the command you've built so far and understand the output
6. Now add the flag `-exec` to `-xargs` to execute a command to the list of inputs you have created.
7. This command will be `dpkg-query` to show information about the packages. 
Use the flags `-f ''${Package} ${Installed-Size}\n' -W` to show only the relevant information
8. Now sort the results on the values of the size field using `sort`. For this I am not going to give any hint
---