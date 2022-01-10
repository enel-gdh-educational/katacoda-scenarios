#### The git command line interface

As just said, git is used through a command line interface that is invoked simply as ``git``.

Depending on your Operative System, open a terminal (Unix or Mac) or open the Git Bash terminal (Windows).

In the terminal type:

```bash
git --help
```

to check that everything is working.

Quickly look through all the commands shown by the help menu. By the end of this course we will go through most of them. 

#### First git configuration

Perhaps the two most important configuration parameters of git are the user name and email. Indeed, they are used to _sign_
each commit of the repository, so to know who has introduced what changes in the project.

Let us configure them in your git environment:

```bash
git config --global user.name 'your_name'
```

and

```bash
git config --global user.email 'your_email@enel.com'
```

Now, you can list the configuration paramters via ``git config -l``.

Notice that the ``--global`` flag serves to set a global configuration, namely not related to a specific repository.

---
__Exercise 1__


Make sure that the new configurations have been entered correctly. 

_Hint_: type ``git config`` with no options, and look for the option to list all the configurations. 

---

#### Your first git repo

Ok, now that we have done the _paperwork_, let's start playing with a repository. 
Create and move to the folder ``basic_project``:

```bash
mkdir basic_project
cd basic_project
```

Now, create your first git repo with:

```bash
git init
```

This command creates a hidden folder named ``.git``, which is nothing but the repository itself, containing all the snapshots,
the history of the project, information about how to synchronize to remote repositories, etc.

---
__Exercise 2__


Check that the folder ``.git`` has been created. Check it both using the terminal and the folder window of your system. Warning! It is a **hidden** folder!

---
 

#### First commit
 
Let's create a first file that will be included in our repo:
  
```bash
echo "This repo contains the project for the course Version Control System" > README.md
```

The main command to inspect the state of your project is:

```bash
git status
```

The output should look like:

```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        README.md

nothing added to commit but untracked files present (use "git add" to track)
```

Let's inspect the output:

- The first line tells you about the branch, which is __master__ by default.
 The next tutorial will go deeper on branches, but for now let's just describe a branch as one line of evolution of the project.
 You can have multiple branches in one repository, and create new ones or merge them together when needed.

- The second line tells you what is the commit, that is, the snapshot of the project that is checked out in your folder.
No commit has been saved so far.

- Then you are notified about new files in the current folder that might be tracked by git, but are not (yet).
 The only file is ``README.md``.
 
- Finally, a hint on what you could do next, namely start tracking some files before you can actually commit anything. 


#### File tracking and committing  

Well, let us track ``README.md`` then. This is achieved by

```bash
git add README.md
```

and to make sure the file has gone under Git's radar, just list the files that git is tracking via:

```bash
git ls-files
```
The command ``git add`` has also the effect to put the file in the so-called __staging area__, that is,
 a special hidden folder in the git repo where files are put, ready to be committed. 

Indeed, now in the output ``git status`` output, you should recognize the snippet:

```bash
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   README.md
```

that informs us that there are changes which are ready to be committed, specifically a whole new file.

In fact, all the files that appear in green are those who are being added to the staging area.

Well, the big moment has come to make your first commit:

```bash
git commit -m "First commit. README added"
```

Congratulations! 

Before, you go to the next step, we suggest to take a couple of minutes to watch [this video](https://www.youtube.com/watch?v=t6GMcIoCD9Q)


