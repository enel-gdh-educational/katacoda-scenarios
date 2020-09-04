As a commit history grows, you might realize that not all those changes are worth keeping, and select only some of them to be kept in the main development line.

---

With `git cherry-pick` we saw how individual commits can be relocated from one branch to another.

Another way to manage individual commits to reshape the history of the repository is deleting them: the command for this is `git revert <commit>`.
As with `git cherry-pick`, `<commit>` is the commit identifier, and can be a range of commits.

The default behaviour when running `git revert` from terminal is opening a text editor to edit the commit message, and create a new commit (which reverts the changes introduced by the ones targeted by the command). This behaviour can be modified with the options `--no-edit`, to keep the default commit message, and `-n` to prevent the changes from being committed.

## Exercise

**Remeber the model.py file? We cherry-picked those commits from the `installation` branch.**
**Now, let's switch to `installation` and undo those commits using `git revert`.**