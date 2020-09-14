### Jumping between versions

We have done a big walk through the basic git capabilities, and now it is time to use it for what it is, a version control system
from which we expect to be able to check out any past version of the project.

In fact, what we aim for is the ability to put to populate the work tree with the content of any stored commit.
Such an action is called _checking out a version_ and is accomplished by the command ``git checkout``. In its basic form, 
this command requires you to specify the id of the commit you want to checkout.

For instance, pick up the id second to last commit:

```bash
$ git log
commit f3a3d057de72531edd54b9d107f23dd09d06cc2c (HEAD -> master)
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Mon Sep 14 05:23:21 2020 +0000

    Added .gitignore

commit 434d4fe9720862c637a83de7df99135b7c28f6c7
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Mon Sep 14 05:23:21 2020 +0000

    Some renaming and file repositioning

...
```

. The commit message tells you how the last commit differs from its parent, but to be more precise you can:

```bash
git diff 434d4fe9720862c637a83de7df99135b7c28f6c7
```

and we realize that in the previous commit the file `.gitignore` is missing.


Finally check the previous commit out
```

and check it out:

```bash
git checkout 434d4fe9720862c637a83de7df99135b7c28f6c7
```

___

__Question 1__

How can you make sure that the commit that has been checked out is the right one? (Even though, the output should be talkative enough).
___

As you've noticed, ``git status`` tells you that you are in a detached state. There will be a dedicated session to explain this concept,
 so we are not going in detail. Let us tell that a detached state should be treated with a lot of care though! Moreover, 
 
 to get back to the previous commit, you should run:
 
 ```bash
git checkout master
```

which is definitely not clear, but assume it is you safe escape word!

### Checking out single files

You can also checkout a single file, meaning that you don't point to a different commit, but you just pick up a file from a different commit
 and copy it into the staging area and the worktree.

In a next scenario you will go into details.

### Tags
However checking out a commit by its id is very tedious. In truth, `git` is smart enough to let you specify only the first
 digits of the commit id. How many digits? Enough to identify uniquely the commit, namely those which form an initial pattern owned by only one
 commit.
 
But, you know, you would like to give simple tags to the commits, to find them out easily. This is the typical case of a project release,
in which you want to tag the commit of the release with the release number.

Let us say that the second to last commit coincides with the release ``v1.0`` of `basic_project`. You can run:

```bash
git tag "v1.0"
```

and check that a tag has been added via simply:

```bash
git tag 
```

The interesting thing is that you can checkout a commit by its tag, which is way more practical.

___

__Exercise 2__

Prove the previous statement
___

__Reminder for later__ 

Don't forget to ask your next tutor how to push (pull) tags to (from) the remotes.

### Grepping files

In every day work, it is very common that you might need to look for what file contains a certain pattern, say an instruction.

For instance, in our project we might want to look what files contains the `print` instruction. For that, you just run

```bash
git grep -e "print"
```

which will output `hello_world.py`. However, it only looks in the files which are tracked by `git`. 

___

__Exercise 1__

Prove the previous statement
___

The syntax of `git-grep` is substantially identical to the standard Unix `grep`.



#### Additional content

Finally we ancourage you experimenting with other commands that sort of allow you to, such as:

- ``git commit --amend``: [guide](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History#_git_amend)

- ``git revert``: [guide](https://www.atlassian.com/git/tutorials/undoing-changes/git-revert)

- ``git reset``: [guide](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified)

