#### Key concepts: checkout directory, or the working tree

Before going further, let us introduce a key notion in git: the checkout directory, or working directory
 which is identified as the parent directory of ``.git``. In this example, it is `basic_project`.

The content of the checkout folder can be aligned by simple commands to any version
 of the project saved as a commit, by specifying the minimal information to identify it uniquely.

This operation is called ``checkout`` and can be applied
 to all the files included in a repository, or to specific files.
  
From the checkout folder, you can make changes to the files, and, eventually,
 save a new version by committing the changes.

To know what is the commit currently checked out, just look at the top entry output
 of the ``git log`` output.

From the _git book_: 
"Think of the working directory as a sandbox,
 where you can try changes out before committing them to your staging area (index) and then to history."

Finally, _working tree_ is a synonym for checkout folder.

#### Key concepts: staging area

We are now ready to give a better definition of the staging area. This area is also called _index_ or _cache_. 
It is simplest to think of it as the _proposed next commit_, and, until you call ``git add``, it is a compressed tree which content 
coincides with the last commit that you have checked out.
When you start _git adding_ files, ``git`` applies the changes from the working tree to the index,
e.g. adding new files, moving, deleting, or modifying the existing ones. If any change has been applied you can make a new commit,
 that will look exactly like the index.

#### To revise 
Probably, the most definitive explaination of the concepts of working tree, index and are in the first part 
of [this page of the Git book](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified).

See also [this page of the Git book](https://git-scm.com/book/it/v2/Git-Basics-Recording-Changes-to-the-Repository).


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

---


Let's now add a new line to the file ``hello_world.py``:

```bash
echo "print('Hello again')" >> hello_world.py
```

Normally, you would like to view all the changes that you have
introduced in your checkout folder.

Git can list for you at any time the difference between the present content of the checkout folder and the content of
 the commit that you have checked out. Just type:

```bash
git diff
```

---

__Question 1__

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

Let's now add the modified file to the staging area,
and check again the output of `git diff`. 

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

#### Summary
Let's briefly recap the concepts and the commands we learned so far:
- working directory
- staging area
- git diff

