As you work on different features of the projects, changes get committed to one branch or another. You might realize that not all those changes are worth keeping, and select only some of them to be kept in the main development line.

---

Using `merge` will bring all commits from a branch into another. Commits remain, however, individual. One or more commits from a different branch can be brought into the currently checked-out one using `git cherry-pick <commit>`, where <commits> indicates a commit identifier (which can be shortened), or a branch name (in which case, the latest commit to that branch is used).

One instance in which this is particularly useful is when a commit is accidently made to the wrong branch. You can switch to the correct branch and cherry-pick the commit to where it should belong.

The cherry-picked commits are automatically committed to the new branch, with the same commit message. To modify this behaviour, `git cherry-pick` accepts the `-e` option to allow edits of the commit message, or the `-n` option to avoid committing the changes.

## Exercise