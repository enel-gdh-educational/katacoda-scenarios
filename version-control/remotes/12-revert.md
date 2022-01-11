### Step 12 - Git Amend/Revert - modify/undo commits

To modify or undo a commit you can use:

- `git commit --amend`: allows you to **replace** the commit just made when it is still not pushed. You can make modifications to the staging area and then commit again using `git commit --amend`. This commit will **delete** the previous

- `git revert` allows you to **undo the commits**, if you have already committed files but realized you made a mistake. It will create a **new commit** which has the **inverse** affect of the commit being reverted.


---

#### Task

- Go to `~/repo/local_working_dir`
- Switch to branch *new_branch*
- Modify *new_new_feature.py* to print "Buongiornissimo"
- Add *new_new_feature.py* to the staging area
- Commit modification to file *new_new_feature.py*
- Push to remote *new_branch*
- Use `git revert HEAD` to revert the changes in the last commit
- Use `git status` to see status of repository

This will open an Vim editor session to create a commit message for each commit.


### Advanced

If you haven't pushed your changes then `git reset HEAD~1` has the same affect and will remove the last commit.

To revert multiple commits at once we use the character `~` to mean minus. For example `HEAD~2` is two commits from the head.

This can be combined with the characters ... to say between two commits. For example `HEAD...HEAD~2` revert the commits between HEAD and HEAD~2.
