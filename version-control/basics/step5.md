### Jumping between versions

We have done a big walk through the basic git capabilities, and now it is time to use it for what it is, a version control system
from which we expect to be able to check out any past version of the project.

In fact, what we aim for is the ability to put to populate the work tree with the content of any stored commit.
Such an action is called _checking out a version_ and is accomplished by the command ``git checkout``. In its basic form, 
this command requires you to specify the id of the commit you want to checkout.

For instance, pick up the id second to last commit:

```bash
commit 7ce1a99c6a97ec648cd5986dbebb288aed1fd28a (HEAD -> master)
Author: Andrea Massaia <andrea.massaia@enel.com>
Date:   Sun May 9 21:59:03 2021 +0000

    Added .gitignore

commit 554a6d2cf62225ed96d901d6cd09ad72dc38907e
Author: Andrea Massaia <andrea.massaia@enel.com>
Date:   Sun May 9 21:59:03 2021 +0000

    readme deleted. It was too bad...

commit a4c58aa9e4cf70182c92b0c0ddc2bbabf6210065
Author: Andrea Massaia <andrea.massaia@enel.com>
Date:   Sun May 9 21:59:03 2021 +0000

    Some renaming and file repositioning
...
```

The commit message tells you how the last commit differs from its parent, but to be more precise you can:

```bash
git diff 434d4fe9720862c637a83de7df99135b7c28f6c7
```

and we realize that in the previous commit the file `.gitignore` is missing.


Finally checkout the previous commit:

```bash
git checkout 434d4fe9720862c637a83de7df99135b7c28f6c7
```

___

__Question 1__

How can you make sure that the commit that has been checked out is the right one? (Even though, the output should be talkative enough).
___

As you've noticed, the output of `git checkout` tells you that you are in a detached HEAD state. There will be a dedicated session to explain this concept,
 so we are not going in detail. For now, let's just say that a detached HEAD state should be treated with a lot of care! 

To get back to the previous commit, you should run:
 
 ```bash
git checkout master
```

__You can also checkout a single file__, meaning that you don't point to a different commit, but you just pick up a file from a different commit
 and copy it into the staging area and the worktree.

This may be not clear for now, but until tomorrow let's assume it's a safe escape word!
The next scenario will go into details about evereything `git checkout` can do.

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

__Exercise 1__

Prove the previous statement
___

### Grepping files

In every day work, it is very common that you might need to look for what file contains a certain pattern, say an instruction.

For instance, in our project we might want to look what files contains the `print` instruction. For that, you just run

```bash
git grep -e "print"
```

which will output `hello_world.py`. However, it only looks in the files which are tracked by `git`. 

___

__Exercise 2__

Prove the previous statement
___

The syntax of `git-grep` is substantially identical to the standard Unix `grep`.



#### Additional content

Over the next days, we will explore additional commands that give you a lot of power and flexibility over the versions of your repo.
If you can't wait, you could start experimenting with some of those, such as:

- ``git commit --amend``: [guide](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History#_git_amend)

- ``git revert``: [guide](https://www.atlassian.com/git/tutorials/undoing-changes/git-revert)

- ``git reset``: [guide](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified)

