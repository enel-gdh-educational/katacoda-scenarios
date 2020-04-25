In this section we will familiarize with the tool that allow you to install pre-packaged software in the Linux command line. 

In Windows, to install an application you usually download an installer from the web and execute it.[^1]

Alternatively, in the recent versions of Windows and Mac, you search for an application in the App Store and launch the installation.
    
In the Linux command line you use a different tool to install software, which grants you a deeper control on what you are going to install (or remove).
This tool is the package manager, which allows you to search for software packages, install, update, or remove them.

Different Linux distributions may adopt different package managers, all providing the same functionalities. For instance, Red Hat and its derived distribution, Fedore, adopt ``yum``,
 whereas Ubuntu adopts ``apt-get``, or its more recent and user-friendly wrapper, ``apt``.
 
Since this class is based on Ubuntu, we will focus on the latter tool. 

This tutorial aims at getting you acquainted with the basic usage of the Ubuntu package manager, but always trying to let you understand the basic idea behind the functioning of this tool,
We believe that, this way, you can progress in learning in a faster and more confident manner.

Anyway, for the impatients. In order to install a software from the Ubuntu command line, say curl---a client to send request to URLs and transfer data. The one-line command is

```bash
apt install curl
``` 

If you've paid attention to the output, you would have probably figured out that installing a package with apt is in fact an articulated task that goes through many intermediate steps.

Interested to know more? Then jump to the next step! 

Oh, before I forget, we encourage you to ignite a discussion with the instructors about any aspect of this topic that you might want to discover in more depth.


---
**Disclaimer**

Most of the commands illustrated in this tutorial require root privileges, obtainable prepending `sudo`.
 However, in your Katacoda environment you are root by default, so `sudo` will be unnecessary.
 
In general, `dpkg -i`, `apt install`, `apt update`, `apt upgrade`, and `apt purge` among others, require root privileges.

---
 
[^1]: The most nostalgic of us still remember the good old times when software came shipped in CDs, or even in diskettes (sigh!).

