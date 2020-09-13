---

__Exercise 1__

Check the output of

```bash
git status
```
, which should look like this

    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
            renamed:    hello_world.py -> hello_world_v1.py


    $ git commit -m "hello_world renamed"
---




---

__Exercise 2__


```bash
mv README.md readme.md
```

Take a second to understand what has happened by looking at the output of ``git status``. Then

```bash
$ git add README.md
$ git add readme.md
$ git commit -m "README renamed"

```

Alternatively, you might have used `git rm` as suggested by `git status`

```bash

mv README.md readme.md

$ git rm README.md
$ git add readme.md
$ git commit -m "README renamed"
```

---

___

__Exercise 3__


```bash
$ mkdir src
$ git mv my_first_hello_world.py src/
$ git status #have a look at the output
$ git commit
```

As usual, you might not use ``git mv`` and figure out how to commit the changes without.
___



___

__Exercise 4__

```bash
git rm --cached src/*.py
git add src/*.py
```

there is no need to commit, since ``git`` will look at the index and realize that, effectively, nothing has changed.
___


___

__Exercise 5__

-  
```bash
touch foo
touch bar

```

- 

```bash
echo "foo" >> .gitignore
echo "bar" >> .gitignore
```

-  
The output 
```bash
git add foo bar
```
suggests to us `--force` flag, therefore 

```bash
git add -f foo bar
``` 
___