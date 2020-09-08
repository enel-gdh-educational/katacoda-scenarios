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

The content is mostly self-explanatory, you can read the author, the date and the message of the commit. What about the first line?
The long string of characters is the __id__ of the commit (a sort of code),
 and it is uniquely generated from the content of your commit.

---
__Question 1__

Why can we be certain that the id of the commits of two different participants
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

#### Let us play more with commits

So far, we have done something very simple: started tracking a new file, added it to the staging area, 
and made your first commit.

Let us simulate the natural evolution of a project.

Let us add a new line to the ``README.md`` file:

```bash
echo "Some additional info" >> README.md
```

and see how git reacts to this change.

---

__Question 2__

Explain the output of ``git status`` after the change.

---


Ok, let us create a new file in the checkout folder:

```bash
echo "print('Hello world!')" > hello_world.py
```

Most likely, you would like to view all the changes that you have
introduced in your checkout folder.

Git can list for you at any time the difference between the present content of the checkout folder and the content of
 the commit that you have checked out. Just type

```bash
git diff
```

---

__Question 3__

Explain the output of ``git diff`` after the change.

---


__Tips for the experts__
Let us point out that it is not git that calculates the differences, but git rather extracts the content of the reference commit
and provides it together with the content of the checkout folder to a data comparison tool, ``diff`` by default.

However, this is configurable; for instance you can instruct ``git`` to use ``vimdiff``.

```bash
git config diff.tool vimdiff
```
and try how different the output of `git diff` looks.

Also, if you want to 

---



Our goal is now to save a version of the latest changes. 

To this aim, we first have to _stage_ the modified file via:

```bash
git add README.md
```

N.B. this time the effect of ``git add`` is only that of adding the changes to the staging area, since `README.md` was already tracked by git.



__Exercise 3__

Let git start tracking the newly created file ``hello_world.py``, verify the addition,
 and check the inclusion in the staging area. 
___


---

__Tips for the experts__

This is probably the right time to tell you more about the staging area. Let me remind you that
in git jargon the words `stage`, `cache`, and `index` are used interchangeably.

You might be wondering what the staging area actually is, and the answer is nothing but a special
file ``.git/index``. This file has a complex encoding, so it is not human readable,
 as you will have discovered if you tried to open it.

By default, this content of this file matches that of the commit that is checked out.

However, when you stage some modifications of your work tree through ``git add``,
 these are reflected in ``.git/index``, whose content changes.

Commands like ``git status`` know that changes have been staged by comparing
 the index against the content of the commit that is checked out.

__


Well, enought talking. Let us make a new commit:

```bash
git commit
```

this time without the `-m` to specify a commit message. You will be redirected to a text editor, 
and asked to write a commit message and save it.

The editor is `nano`, therefore after having written your message, 
type `Ctrl^O, Enter`, to save ther file and `Ctrl^X` to exit.

Once more, you can instruct git to use an editor other than the default one. 
Say, you are more familiar with ``vim``, you can set it as the git editor via:

```bash
git config core.editor vim
```

#### A commit is not like a kiss! You remember the second better than the first.

Now that we have a first and a **subsequent** commit, we should have a look at some interesting features of git.

You have seen previously that a commit is basically a set of objects stored under `.git/objects/`

that contain the metadata of the commit, the tree of file, and the content of each committed file (blob objects).

In git, all commits but the first include in their metadata the id of the parent commit. 

___

__Exercise 4__

Check what is the parent commit of the last commit, from the content of its commit object.

List all the content stored in the commit.

Hint:

- First, check the id of the last commit 
- Second, check the content of the object identified by this id
- Third, similar to exercise 2, browse the content of the commit
___


Now, you might be wondering why git has stored all the tracked files in the second commit,
including those that are unchanged with respect to the first one. Couldn't git just store deltas,
namely incremental differences, with respect to the parent commit?

It turns out that it can. In fact, git has a utility, called `gc` to rationalize and compress 
the object storage. `gc` calculates and saves deltas between commits,
 and packs all object owing to a commit in a _packfile_. 

Git performs `gc` occasionally, for instance when there are too many non-packed objects (_loose_),

when you push to a remote server (you will learn this later in this course), or if you force the process, running:


```bash
git gc
```

Don't be shy, try it! 

Now, have a look at the files contained in ``.git/objects``

```bash
$ find .git/objects -type f
```

It seems like object have gone and two more files appeared under ``pack/`` subfolder, which should look like

```bash

```

I'm sure you are curious to see what is contained in a packfile

```bash

```



#### Special changes, move, rename, and delete.

We realized that the python code should not stay in the 

Rename a file

Delete a file 


(Here we can make use of git commit -a) and suggest to not use it!!




