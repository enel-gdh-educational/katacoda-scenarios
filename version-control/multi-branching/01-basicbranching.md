# Basic branching

You are working on a new project, so you created a repository and already made a couple of commits to it.

*Remember you can always inspect commits history with `git log`*

As the project expands, you would like to work on the separate portions of the project independently: this is where multiple branches come into play.

---

## Creating and inspecting branches: `git branch`

The first and most important command to know is `git branch`.

Without passing any argument, `git branch` lists the current branches of the repo.

*What do you get if you try running `git branch` now?*

A new branch can be created by simply passing the new branch name to `git branch`.

To rename an existing branch, use `git branch -m <old branch name> <new branch name>`.

You can also delete a branch by using `git branch -d <branch name>`.

---

## Exercise

**We need a new branch to work on the user manual for our software.  
Try creating a new branch named "user_manual".
What do you get if you run `git branch` after creating the new branch?**
