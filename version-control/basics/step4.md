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




#### `git commit -a` is the devil!

So, if anyone recommends you to use ``git commit -a``, you can tell them this story:
 
 "there was an instructor that once said
 to me that some day I would certainly meet an asshole suggesting me to use ``git commit -a``. I guess that moment has come."




Other topics

Git diff —staged

Git compresses the contents of these files with zlib,

.gitignore

git tag

https://git-scm.com/book/en/v2/Git-Tools-Searching
git grep -n gmtime_r





#####

Amend a commit

git commit --amend
######

git ls-tree -r HEAD

reset
https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified

(super simple)
revert
https://git-scm.com/docs/git-revert



#### 

git diff between two commits ?


Rearrange some material perhaps to make it litgher?


####

.git/config


####

some other things randomly