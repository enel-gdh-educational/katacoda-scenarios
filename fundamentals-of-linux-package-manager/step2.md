----------

#### Have the system up to date and ready to install the newest packages

Prior to running any command to search for or install a package, 
it is a good practice to update the list of the avialable packages by invoking

```bash
apt update
```

This command will fetch the information from the package registries, add to the local list
 the new packages that have been published since the last time you have done an update, 
 and checks the presence of more recent versions of the packages that are already installed.
 
The output is informative about the steps that the update goes through. 
In particular, the last line tells you whether new version of the installed packages are avaiable.

To list the packages that can be updated, just run:

```bash
apt list --upgradable
```

Does it appear any package that could be upgraded? I bet so, since packages updates are released quite often in Ubuntu!

I am sure you do want to upgrade them, since it is good practice to keep your system up to date!.
So, run

```bash
apt upgrade
```
and type ``Y`` to the prompt:

```
Do you want to continue? [Y/n]
````

Sometimes, after an upgrade, some old packages become obsolete and are unused. 
They can be deleted to free up some space on the disk. To do that, just run

```bash
apt autoremove
```

Moreover, not only the unused packages can be deleted, 
but also old package files that are functional to the installation. 
You can get rid of those and gain some more free space by invoking 

```bash
apt autoclean
```

Congratulations! You've done your due house cleaning!



