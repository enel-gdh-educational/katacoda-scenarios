In this scenario, we will familiarize with the Linux filesystem and with the command-line tools that allow you to navigate through the file tree.

Most of us are navigate through folders and to operations on files like moving, renaming and the like through a graphical interface, which is in fact very practical.

Needless to say, all these operations can be accomplished through the terminal and this is the only options in the absence of a graphical interface,
 for example, if you access a remote machine via SSH, say an AWS EC2 instance. 
 However, even when you can use a graphical interface, the terminal might be convenient to accelerate and automate certain tasks.

In this tutorial we assume that you are broadly familiar with the concepts of file, directories, extension,    

Before diving in the hands-on tutorial, we would like to tell you a couple of fundamental concepts that will let you understand faster the behaviour of the filesystem.

First, a filesystem is all about organizing files on the hard disk and it is basically formed by two things: the content of the files stored on the disk and the information about the files,
 which comprises their size, permissions, and most importantly position within the file tree. One thing that you should bear in mind is that the actual position of a file on the disk
  does not reflect its position within the tree of directories. For instance, the content of two files that are located in the same directory, most probably will not be contiguous on the disk. 
However, the filesystem knows that it has to present the two files to the user so that they appear close to each other. 
If this looks strange to you, think of this situation: you have created a file `pippo.txt` in a certain folder and two months later you create another file `ciccio.txt` in the same folder.
 What are the chances that the space on the disk next to `pippo.txt` will be free so that you can write `ciccio.txt` next to it. Most probably zero chances.
  This is the reason why the filesystem does not even try to place close to each other files that are in the same directory.

The position of a file in the filesystem tree is called its path. The path is a string that looks like: `/usr/bin/bash` where each unit between two `/` represents one level of the tree
 that you have to go through until you find the file. The last portion of the path is always the name of the file. 
 
Sometimes file names can have two portions separated by a dot, such as `pippo.txt`.
Traditionally, the last portion is referred to as the extension and informs you about the type of the file as well as which program you should use to view and modify it.
One substantial difference between Linux and Windows is that, while in Windows the extension is mandatory and has an actual meaning,
 in Linux the extensions is pointless and is just conventional to name a file with one extension rather than another.
In other words, you are totally free to name a jpeg picture `photo.yeah` or even `photo.pdf`, provided that you use the right tool to open it, for instance an image viewer. 
Of course, we recommend to name the file `photo.jpg` and not messing up with extension. 
Sometimes filenames in Linux do not even have an extension, for instance, the program `bash` found in `usr/bin/bash`. This happens most commonly with executable files, e.g. the programs.

If all this does not seem to be clear, don't worry, it will become so.  

In this tutorial, you will learn how to browse the filesystem, how to move files from one place of it to another, create new diretories and inspect the properties of the files.

Well, to much talking already. Let's get into it.

