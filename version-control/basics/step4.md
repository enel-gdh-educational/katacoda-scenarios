git ls-files -s

#### Special changes, move, rename, and delete.

So far we have dealt with how you let git know about the addition of new files, and changes to the content of existing files.
What about renaming or moving files? Say, you want to rename ``hello_world.py`` in ``hello_world_v1.py``.
 Git has a command that does rename your file and add this change to the staging area in one shot.
 
 ```bash
git mv hello_world.py my_first_hello_world.py
```

---

__Exercise 1__

Make sure that the renaming has been performed and staged. Then commit the change.

---

Now, you might wonder why there a special command exist to achieve this. In fact, it is not necessary to use ``git mv``,
and we encourage you to try it (and realize it is a bad idea):

---

__Exercise 2__

Rename the file README.txt in readme.txt by using regular `mv`, then stage the changes and commit them. 

Oh, before I forget....good luck!

---
 
As you should know, if you have some experience with Linux, renaming a file is a special case of moving a file.

___

__Exercise 3__


Create the folder `src` and move the file ``my_first_hello_world.py`` into it.
Then stage, and commit the changes.

_N.B._ There is no special ``git`` command to make a new folder.
___


Finally, you might want to delete a file, and save the change forever. 

Let us sacrifice ``readme.md``.

```bash
git rm readme.md
git commit -m "readme deleted. It was too bad..."
```

There could be times when yo just want ``git`` stop tracking a file, but you might want to keep it in the worktree.

For this you should add the flag `--cached`:


___

__Exercise 4__

Stop tracking the python script. Before commiting, add it back to the index.
___


___

__Tip of the expert__

In git you can only track files, not folders. `git` is aware of the tree structure
 through the placement of files in folders, therefore _no files -> no tracking_!
 
You can check this by creating an empty folder, then trying to ``git add`` it.

If you want an empty folder to be tracked, we suggest to make it _quasi-empty_, by including a file named `.gitignore```
in the folder.

Why ``.gitignore``? Well, any file would do the job, but this is empty (see the leading dot), and is a file that
may be relevant for ``git``.

___



#### `git commit -a` is so so! `git commit -A` is the devil. 

Let us admit it, adding file one by one is tedious, so if there were a method to spare time everyone would be tempted to use it.
Actually, that method exists and is

```bash
git commit -a
```
, which basically `git adds` all the files that have changes (in their content, name, placing etc.) and had been already tracked by `git`.

This means that you won't revise what files you are actually going to commit, to avoid committing accidental changes.
 
 Also, if you wanted to start tracking new files, this command wouldn't help.

Even worse, the form

```bash
git commit -A
```

will commit _all files_ in the work tree, even those that have been accidentally created, which is very common in software development.

Instead, we suggest to revise the changes one by one before adding them. There are GUIs like GitKraken that help you with this.

A valid alternative is the interactive add:

```bash
git commit -i
``` 

 To conclude, if anyone recommends you to use ``git commit -a`` or ``git commit -A``, you can tell them this story:
 
 "Once upon a day an instructor said to me that some day,
  I would certainly meet an dummy suggesting me to use ``git commit -a``. I guess that moment has come."


#### `.gitignore`

You should have noticed that when you add a file in the work tree, ``git status`` lists it under _untracked files_.
You will eventually add that file and commit it, but sometimes there are files that you do not want to track at all.

For instance, it is customary to never track object and data files in software projects, such as `.o` files in C/C++,
`.jar` in JAVA, `.pyc` in Python and the like. Also some IDE write their own scratch or checkpoint folders (e.g. PyCharm creates `.idea`).

In a `git` repository you should track only the source code. Therefore, __do not__ store objects, executable files, data, compiled documentation,
binary files unless strictly necessary (that is, never), but __do__ store default configurations, documentation source, 
static immutable files).

There are several good reason for that, bu the main perhaps is that _should_ be avoided because they _can_ be avoided.
 In fact, such kind of files can be recreated at any time fron the source code, e.g. objects
  and executable result from a build, documentation can be rendered into html or pdf through compilation,
 and configurations should be user-defined, therefore a default or example configuration is enough.
 
 You should always keep your repository as lightweight as possible, so that it faster to clone. Moreover, ``git`` cannot calculate the diff 
 of binary objects in an efficient way, so the compression would be inefficient, the updates become slow.
 
 So, how can you tell `git` to avoid signalling untracked files? You just list the files that you do not want to track in a file
 named `.gitignore` and placed in the root of the worktree. Its is detailed [here](https://git-scm.com/docs/gitignore). 
 
Instead of creating a ``.gitignore`` file for your own project, check for [``.gitignore`` templates](https://github.com/github/gitignore)
 on Github. There are templates for all programming languages, and if your project is multi-language, just merge multiple `.gitignore` files.

___

__Exercise 5__

1. Create two files named `foo` and `bar`. 
2. Let `git status` not mention them among the untracked files.
3. Add the two files, even though `git` has been told to not track them.
4. Up to you whether to commit the changes or note or not.

___