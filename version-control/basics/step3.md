#### Let us play more with commits

So far, we did something very simple: started tracking a new file, added it to the staging area, 
and made our first commit.

Let's simulate the natural evolution of a project, for instance by adding a new line to the ``README.md`` file:

```bash
echo "Some additional info" >> README.md
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
git add README.md
```

N.B. this time the effect of ``git add`` is only that of adding the changes to the staging area, since `README.md` was already tracked by git.



__Exercise 1__

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
type `Ctrl^O, Enter`, to save the file and `Ctrl^X` to exit.

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
$ find .git/objects/ -type f
.git/objects/pack/pack-32ca4626a2c93a8f2c9a49de9020bfb5096989e9.pack
.git/objects/pack/pack-32ca4626a2c93a8f2c9a49de9020bfb5096989e9.idx
.git/objects/info/packs
$
```

Once more, it is certain that the ids of the pack files will differ.  
Surely enough, you are curious to see what is contained in a packfile. There is a plumbing command to list the content 
of a pack file:. Use it, for instance,

```bash
git verify-pack -v .git/objects/pack/pack-32ca4626a2c93a8f2c9a49de9020bfb5096989e9.idx
```

The output does not differ whether you point to the `.idx` or to the `.pack` file and should like similar to:

```bash
$ git verify-pack -v .git/objects/pack/pack-32ca4626a2c93a8f2c9a49de9020bfb5096989e9.pack
a8ec68d096fe1abbff9357277291142e7036287c commit 266 177 12
9fdddf978cb46b3dcdc0f82ed616411a99b3ab87 commit 195 126 189
298b04f8007204598d9f335a0507069539089aae blob   91 87 315
f7d178505b318eef258da550b9341aaf1970769a blob   21 31 402
2836704d2b561a3fb838128bd16f5a86be175aa0 tree   79 86 433
f50cd6e249075cd984b5bccaf68f097c474784d2 tree   37 48 519
7c21b9fe6a85e4569236c376dc0003968b6d42a0 blob   4 15 567 1 298b04f8007204598d9f335a0507069539089aae
non delta: 6 objects
chain length = 1: 1 object
.git/objects/pack/pack-32ca4626a2c93a8f2c9a49de9020bfb5096989e9.pack: ok
```

Let us sort out the format of this file. The first two columns are the id of the objects and its types. 
You can see that `git` has packed two commits, two tree objects (one for each commit), and three blobs
 (the single file of the first commit, and the two files of the second one). 
 
 The third column is the size in byte of the object once extracted, the fourth the size in the packfile,
  the fifth the positioning within the packfile (ok, nevermind if you haven't grasped it, it is pointless for this purpose). 

But the interesting thing is the last line:

1. Look at its size: is is very small (should be less than 10 bytes), definitely smaller than the other blobs.
2. It has an extra field which is the id of another blob object.

---
__Question 3__

Why the last blob is peculiar?

___

---
__Exercise 3__

1. Verify that the last object is a delta with respect to the blob referenced in the last field.
2. Determine whether the second commit is stored as a delta with respect to the first commit or vicevers.

--- 

 