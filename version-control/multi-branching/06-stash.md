As you keep working on the project, you might need to change back and forth between different branches. As you do this, some changes you make might be "incompatible" between two branches. 

---

Changes, either staged or unstaged, that are "compatible" between branches, i.e. don't conflict between branches as they don't affect the same lines in the same files, are usually carried over when checking out to a different branch.  

On the other hand, some changes will result in conflicts (for instance, one or more lines of the same file have been modified differently between two branches), Git will abort the `git checkout` command. At this point, you have two options:  

**1. Force the checkout and delete the changes**

If you run `git checkout -f <branch>`, Git will switch to `<branch>` anyway, and uncommitted changes will likely be lost.

**2. Save the changes using `git stash`**

Changes on the current branch, either staged or unstaged, can be "frozen" with `git stash`, with the branch reverted to the latest commit. Once changes are stashed, we can `git checkout` to another branch, and all changes will be available in the new branch as well.

---

Multiple "sets" of changes can be stashed, and each is assigned to a numbered "slot" (with the most recent slot being 0, and older changes pushed up). We can inspect the list of changes with `git stash list`. This will list the slots, with their progressive number, the branch on which the changes were originally made, and the latest commit of that branch. To clear a slot, we can use `git stash drop #`, where # is the slot number.

To reapply stashed changes we have two options:
1. `git stash apply #` will apply the changes in slot #, while keeping them stashed;  
2. `git stash pop #` will apply the changes in slot # too, and remove them from the stash. It would be a shortcut for:
`git stash apply #`  
`git stash drop #`  

In both cases, the slot number can be omitted – this will default the command to stash 0, i.e. the latest changes that were stashed.

## Exercise

**You're working on the installation guide. For instance, try adding a simple line to the file.**
**Now, the boss tells you that the user manual needs to be expanded (even if your changes to the installation guide are not yet ready to be committed).**
**Switch to the user_manual branch (using `git stash` to save your work on the installation guide) and work a bit on the file.**
**Soon, however, the boss calls again to tell you that the model needs to be fixed ASAP.**
**Switch to the model branch and add a line to the file, stage and commit.**
**Now switch back to the manual branch and apply the changed you were implementing, stage and commit.**
**What's left in the stash? Try emptying it – those changes were not that great anyway...**