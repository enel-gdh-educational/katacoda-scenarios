#### Solution

**1. Switch to `user_manual` with `git checkout user_manual`{{execute}}**  
**2. Create the file with `touch user_manual.txt`{{execute}} (or any other way).**  
**3. Stage the changes with `git add user_manual.txt`{{execute}}.**
**4. Commit the change with `git commit -m "user manual created"`{{execute}}.**
**4. Switch back to `master`: `git checkout master`{{execute}}.**
**5. Perform the merge: `git merge user_manual`{{execute}}.**

> **Now that our history has evolved over several commits on different branches, we can have an overview by running: `git log --oneline --graph`{{execute}} Can you tell what happened? What if we checkout to a different branch and run `git log --oneline --graph` again?**
