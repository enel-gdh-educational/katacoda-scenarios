# Basic branching

You are working on a new project, so you created a repository and already made a couple of commits to it.

*Remember you can always inspect commits history with `git log`*

As the project expands, you would like to work on the separate portions of the project independently. You can do so, by add multiple branches to the repository.

---

### Creating and inspecting branches: `git branch`

The first and most important command to know is `git branch`.

Without passing any argument, it will list the current branches of the repo, and tell you which one you're on.

*What do you get if you try `git branch` now?*

A new branch can be simply created by passing the new branch name to `git branch`

### **Exercise**

**We need a new branch to work on the user manual for our software.  
*Try creating a new branch named "user_guide".*  
What do you get if you run `git branch` after creating the new branch?**

---

A branch can be renamed with `git branch -m <old branch name> <new branch name>`.

You can delete a branch by using `git branch -d <branch name>`.