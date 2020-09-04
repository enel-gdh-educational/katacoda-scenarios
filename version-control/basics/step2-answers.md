---
__Exercise 1__


The command

```bash
ls .git/object
```

should print, among other folder, one that starts with the first two characters of the commit id.
This folder should contain a file named by what the remaining characters of the id.
---


__Exercise 2__

The inspection of the file named after your commit id

```bash
git cat-file -p dbc39f63e494d05b7409199bc62c14d5b5f3584d
```

should give: an output similar to:


```bash
tree f50cd6e249075cd984b5bccaf68f097c474784d2
author Fernando Gargiulo <fernando.gargiulo@enel.com> 1599240521 +0000
committer Fernando Gargiulo <fernando.gargiulo@enel.com> 1599240521 +0000

First commit

```

Then you can inspect the tree file:

```bash
git cat-file -p f50cd6e249075cd984b5bccaf68f097c474784d2
```
and get something close to:

```bash
100644 blob 7c21b9fe6a85e4569236c376dc0003968b6d42a0    README.md
$
```
, which is basically the content of the checkout directory registered in the commit.


Finally, if you inspect the blob file 

```bash
$ git cat-file -p 7c21b9fe6a85e4569236c376dc0003968b6d42a0
This repo contains the project for the course Version Control Systems
$
```

you'll get the content of README.txt.


---
