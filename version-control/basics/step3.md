#### Let us play more with commits

So far, we did something very simple: started tracking a new file, added it to the staging area, 
and made our first commit.

Let's simulate the natural evolution of a project, for instance by adding a new line to the ``readme.txt`` file:

```bash
echo "Some additional info" >> readme.txt
```

and see how git reacts to this change.

---

__Question 1__

Explain the output of ``git status`` after the change.

---


Our goal is now to save a version of the latest changes. 

To this aim, we first have to _stage_ the modified file via:

```bash
git add readme.txt
```

Explain the output of ``git status`` after the change and commit it!

N.B. this time the effect of ``git add`` is only that of adding the changes to the staging area, since `readme.txt` was already tracked by git.


---

Ok, let us continue and create a new file in our folder:

```bash
echo "print('Hello world')" > hello_world.py
```

and explain the output of ``git status`` after the change.



__Exercise 1__

Let git start tracking the newly created file ``hello_world.py``, 
verify the addition, check the inclusion in the staging area and commit it.
___


What if we commit without the `-m` which specify a commit message? You will be redirected to a text editor, 
and asked to write a commit message and save it.

The editor is `nano`, therefore after having written your message, 
type `Ctrl^O, Enter`, to save the file and `Ctrl^X` to exit.

On Windows, the default editor is `Notepad++`, therefore after having 
written your message simply save the file and exit.

Once more, you can instruct git to use an editor other than the default one. 
Say, you are more familiar with ``vim``, you can set it as the git editor via:

```bash
git config core.editor vim
```

#### A commit is not like a kiss! You remember the second one better than the first.

Now that we have a first and a **subsequent** commit, we should have a look at some interesting features of git.

You have seen previously that a commit is basically a set of objects stored under `.git/objects/`

that contain the metadata of the commit, the tree of file, and the content of each committed file (blob objects).

In git, all commits but the first include in their metadata the id of the parent commit. 

___

__Exercise 2__

Check what is the parent commit of the last commit and the history so far.

--- 
