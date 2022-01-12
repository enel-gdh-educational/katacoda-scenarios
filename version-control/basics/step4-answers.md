---

__Question 1__

The output of `git status` should look like:

```bash
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

This is signalling that the file `readme.txt` that is tracked by `git` has been modified. 
You can now decide to stage the changes to eventually commit them
 or restore the version stored in the present commit
---


---

__Question 2__

Given the output of ``git diff``

```bash
diff --git a/readme.txt b/readme.txt
index 7c21b9f..298b04f 100644
--- a/readme.txt
+++ b/readme.txt
@@ -1 +1,2 @@
 This repository contains the project for the course Version Control System
+Some additional info
```

This tells you that ``diff`` is comparing the present working tree against the index object
 `7c21b9f..298b04f` containing the file `readme.txt`.
 
Lines owing to the first (second) file of the comparison are labelled by ``-`` (``+``).

The first (and unique in this case) difference is between line 1 of the first file
 and lines 1 to 2 of the second one. The second file, that of the working tree, 
 contains the extra line "Some additional info".

---


___


__Exercise 1__

- Start tracking:
```bash
git add hello_world.py
```

- Check the tracking
```bash
git ls-files
```

 or

```bash
git ls-files | grep hello_world.py
```

- Check the addition to the staging are

```bash
git status
```
Alternatively, you can request a cleaner output by using:

```bash
git diff --name-only --cached
``` 

which prints only the names of the files that have changes and are already in the staging area
(cache, index, and stage are synonyms for git)
___


___

__Exercise 2__

Hint:

Use 
```bash
git log
```

and read the id of the latest commit

Alternatively, you can use any method among those in this related [Stack Overflow page](https://stackoverflow.com/questions/1967967/git-command-to-display-head-commit-id).
For instance:

```bash
git rev-parse HEAD
```
 
- Second, check the content of the object identified by this id.

```bash
git cat-file -p 
```

The output should look similar to:

```bash
tree 2836704d2b561a3fb838128bd16f5a86be175aa0
parent bb517dceabf63c23abbef923e4a171b281f33e37
author Andrea Massaia <andrea.massaia@enel.com> 1599581725 +0000
committer Andrea Massaia <andrea.massaia@enel.com> 1599581836 +0000
```

whence you can check that the parent commit is ``bb517dceabf63c23abbef923e4a171b281f33e37``.

No surprise, this is the id of the first commit; we are sure you know how to check that.

Moreover, you can traverse downward the tree and check the full content of the commit.

---
