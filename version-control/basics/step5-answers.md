___

__Question 1__

In two ways:

```bash
git status
```

would tell you what commit the worktree points too

Or, just check the absence of the file ``.gitignore``
___

___

__Exercise 1__


Checkout a commit other than the latest:

```bash
git checkout HEAD~
```

Now check the latest commit by referencing its tag

```bash
git checkout v0.1
```

Finally, 

```bash
git status
```
will tell you where you are.
___

__Exercise 2__

First write a pattern in a non-tracked file:

```bash
echo "ciao" > foo
```

then, grep it: 

```bash
git grep -e "ciao"
```
and this shouldn't return anything.
___

