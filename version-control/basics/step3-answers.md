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

__Exercise 1__

- Start tracking:
```bash
git add hello_world.py
```

- Check the addition to the staging area:

```bash
git status
```

- Commit:

```bash
git commit -m "Added hello world"
```

___

__Exercise 2__

Use 
```bash
git log
```

and read the id of the latest commits

---
