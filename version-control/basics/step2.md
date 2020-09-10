#### Get a deeper understanding of your commit

You have done your first commit. Do you feel the subtle pleasure of saved a version of your work for the rest of the time?

OK, let's get back to Earth. What has actually ``git`` done for you? This part is going to be a bit boring, but full of key concepts.

First, run ``git status`` and inspect the output that should look like: 

```bash
On branch master
nothing to commit, working tree clean
```
That is very easy to understand. You have commited the last changes so the stage area is empty,
  therefore there is nothing you can commit, and the last commit you haven't introduced any changes
 in the working tree, which is said to be clean.
 
 To get more info about the commit let us introduce a new command:
 
 ```bash
git log
```

The output should look like:


```bash
commit bb517dceabf63c23abbef923e4a171b281f33e37 (HEAD -> master)
Author: Fernando Gargiulo <fernando.gargiulo@enel.com>
Date:   Tue Sep 8 15:21:40 2020 +0000

    First commit. Added README
```

N.B. The first line will certainly look different.

The content is mostly self-explanatory, you can read the author, the date and the message of the commit.
 But what about the first line? The long string of characters is the __id__ of the commit (a sort of code),
 and it is uniquely generated from the content of your commit.

---
__Question 1__

Why we can be almost certain that the id of the commits of two different participants
are different?

--- 

In other words, if you had a different content in `README.txt`, or had named it differently, `git` would have generated
 a different code. 

--- 
__Tips to show off__

The commit id is also called the hash of the commit,
 and is calculated with an algorithm called SHA-1.

--- 
 
 Then there is an indication about the positioning of this commit in a branch, but let us not complicate
  our life for the moment.


Sounds good, but where has git saved the snapshot? Well, remember that the whole repository is in ``.git``,
 so do the snapshot of your working directory. 
 
---
__Exercise 1__


Explore the ``.git`` folder until you find some file that has to do with the commit.

_Hint_: try to relate the id of the commit with the name of the folders under the ``.git`` subfolders. 

---
 
Well, the file you have just found contains the changes of your commit, in a compressed format. 

---

__Exercise 2__


To uncompress and read the files under objects, use the command `git cat-file -p <id>`,
where the id is the concatenation of the folder name and the file name, e.g.

```bash
git cat-file -p bb517dceabf63c23abbef923e4a171b281f33e37
```
Starting from the inspection of the file named after the id of your commit, continue the investigation
 and try to understand how ``git`` has stored all the information of your commit.

---

#### Checkout directory

Before going further, let us introduce a key notion in git: the checkout directory,
 which is identified as the parent directory of ``.git``. In this example, it is ``

The content of the checkout folder can be aligned by simple commands to any version
 of the project saved as a commit, by specifying the minimal information to identify it uniquely.

This operation is called ``checkout`` and can be applied
 to all the files included in a repository, or to specific files.
  
From the checkout folder, you can make changes to the files, and, eventually,
 save a new version by committing the changes.

To know what is the commit currently checked out, just look at the top entry output
 of the ``git log`` output.

Finally, _work tree_ is a synonym for checkout folder.






