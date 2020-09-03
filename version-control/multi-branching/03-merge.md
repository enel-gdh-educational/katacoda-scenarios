You've created a new branch and switched to it; you also committed some work to the new branch.  
Now, it's time to bring this work into the main stream of our project.

---

If you switch back to the `master` branch, you'll notice that the work you committed on the `installation` branch (that is, the installation.txt file) is not there yet.

*What do you expect to see if you run `git log` now?*

To make that file available to the master branch, we need to merge `installation` into `master`.

We can do this with:  
`git merge installation`

> Generally speaking, to merge `<branch_B>` into `<branch_A>` we need to run:  
`git checkout <branch_A>`  
`git merge <branch_B>`  

*Try merging `installation` into `master` and running `git log` again: what changed since last time?*

## Exercise

**Now that the installation guide is merged in, let's merge in the user manual too.**

**Switch to the `user_manual` branch we created earlier and create a new empty file called "user_manual.txt" (you can use `touch user_manual.txt`{{execute}}.**
**Commit the new file to the branch, then merge the `user_manual` branch into `master`.**
