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

commit dbc39f63e494d05b7409199bc62c14d5b5f3584d (HEAD -> master)
Author: Fernando Gargiulo <fernando.gargiulo@enel.com>
Date:   Fri Sep 4 16:18:31 2020 +0000

    First commit. Added README

```

The content is mostly self-explanatory, you can read the author, the date and the message of the commit. What about the first line?
The long string of characters is the __id__ of the commit (a sort of code),
 and it is uniquely generated from the content of your commit.

In other words, if you had a different content in `README.txt`, or had named it differently, `git` would have generated
 a different code. 

--- 
__Tips to show off__

This id is also called a hash of the commit, and is calculated with an algorithm called SHA-1.
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


To uncompress and read the files under objects, use the command ``git cat-file -p \<id\>`,
where the id is the concatenation of the folder name and the file name, e.g.

```bash
git cat-file -p dbc39f63e494d05b7409199bc62c14d5b5f3584d
```
Starting from the inspection of the file named after the id of your commit, continue the investigation
 and try to understand how ``git`` has stored all the information of your commit.

---

#### Let us play more with commits

So far, we have done something very simple: started tracking a new file, added it to the staging area, and made your forst commit.

Let us simulate the natural evolution of a project.

Let us add a new line to the ``README.md`` file:

```bash
echo "Some additional info" >> README.md
```

and see how git reacts to this change.

---

__Question 1__

Explain what the output of ``git status``

---



Make some changes or add a new file

git status
git diff


Rename a file

Delete a file


