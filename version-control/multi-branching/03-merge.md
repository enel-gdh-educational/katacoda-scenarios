# Merging branches

You've created a new branch and switched to it; you also committed some work to the new branch.  
Now, it's time to bring this work into the main stream of our project.

---

If you switch back to the `master` branch, you'll notice that the work you committed on the `installation` branch (that is, the installation.txt file) is not yet present.

*What do you expect to see if you run `git log` now?*

To make that file available to the master branch, we need to merge `installation` into `master`.

We can do this with:  
`git merge installation`

> Generally speaking, to merge `branch A` into `branch B` we need to:  
> 1. `git checkout branch B`  
> 2. `git merge branch A`  


*Try merging `installation` into `master` and running `git log` again: what changed since last time?*

## Exercise

**Now that the installation guide is merged in, let's merge in the user manual too.**

**1. Switch to the `user_manual` branch we created earlier.**  
**2. Create a new empty file called "user_manual.txt" by using `touch user_manual.txt`{{execute}}.**  
**3. Commit the new file to the branch.**
**4. Merge the `user_manual` branch into `master`.**
**5. Let's say we don't want to continue working on the `user_manual`, so we should delete that branch to avoid clutter. Do you remember how to do it?**