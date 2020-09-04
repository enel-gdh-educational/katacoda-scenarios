As you work on different features of the projects, changes get committed to one branch or another. You might realize that not all those changes are worth keeping, and select only some of them to be kept in the main development line.

---

Using `merge` will bring all commits from a branch into another. Commits remain, however, individual. One or more commits from a different branch can be brought into the currently checked-out one using `git cherry-pick <commit>`, where `<commit>` indicates a commit identifier (which can be shortened).

**Running `git log --oneline` shows the shortened version of the commit identifiers. In this case, since you might want the log of another branch (the one you want to cherry-pick from), you could use `git log --oneline <branch>`.**

> *Note that `<commit>` can also be a **range** of commits, specified as `<commit1>..<commit2>`, or a branch name: this would cherry-pick all commits – but in this case, a merge is probably the best option.*

One instance in which this is particularly useful is when a commit is accidently made to the wrong branch. You can switch to the correct branch and cherry-pick the commit to where it should belong.

The cherry-picked commits are automatically committed to the new branch, with the same commit message. To modify this behaviour, `git cherry-pick` accepts the `-e` option to allow edits of the commit message, or the `-n` option to avoid committing the changes.

## Exercise

**Some collaborator created a *model.py* file, which is vital for our project. However, they created it in the wrong branch.**  
**Create a new `model` branch, then use `git cherry-pick` to apply the commits regarding *model.py* to that branch.**