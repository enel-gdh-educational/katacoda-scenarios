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


Ok, let us create a new file in the checkout folder:

```bash
echo "print('Hello world')" > hello_world.py
```

Most likely, you would like to view all the changes that you have
introduced in your checkout folder.

Git can list for you at any time the difference between the present content of the checkout folder and the content of
 the commit that you have checked out. Just type

```bash
git diff
```

---

__Question 2__

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


---


Our goal is now to save a version of the latest changes. 

To this aim, we first have to _stage_ the modified file via:

```bash
git add readme.txt
```

N.B. this time the effect of ``git add`` is only that of adding the changes to the staging area, since `readme.txt` was already tracked by git.



__Exercise 1__

Let git start tracking the newly created file ``hello_world.py``, verify the addition,
 and check the inclusion in the staging area. 
___


Check again the output of `git diff`. 

It is now empty! Why is that? Because by default it is comparing the *current commit* with the *working directory*:
there are no differences because all the modified/added files have been
moved to the *staging area*.

Why the files have been moved to the *staging area*? Because we used the
`git add` command which moves a file from the *working directory* to the
*staging area*.

Why do we need to move the modified files from the *working directory* to the
*staging area*? Because the *working directory* is intended as the area
where you experiment and work with your files, while the *staging area* 
is intended as the area where your changes are ready to be committed.

So, how to compare the *current commit* with the *staging area*? Use:

`git diff --staged`

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

Check what is the parent commit of the last commit, from the content of its commit object.

List all the content stored in the commit.

Hint:

- First, check the id of the last commit 
- Second, check the content of the object identified by this id
- Third, similar to exercise 2, browse the content of the commit

--- 

 