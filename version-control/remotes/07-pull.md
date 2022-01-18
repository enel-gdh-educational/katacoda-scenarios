### Step 7 - Git Pull - get and merge updates from remote folder (fetch+merge)

`git pull <remote> <branch to pull from>` command allows **synchronization** of local repository with remote repository.
*Pull* command works as a combination of *fetch* and *merge* on a specific branch.

If your current branch is set up to track a remote branch, you can use the `git pull` command to automatically pull that remote branch into your current branch.
**Changes** from the remote repository are automatically **merged** into the branch you're currently working on.

*Note: From git version 2.27 onward, `git pull` will give a warning if the `pull.rebase` variable is not set. Git will keep warning you until you set the variable.
- If you want the default behavior (fast-forward if possible, else create a merge commit): `git config --global pull.rebase "false"`
- If you want to rebase when pulling: `git config --global pull.rebase "true"`*

---

#### Task

Use `git pull <remote> <branch>` to update master branch in remote working repository
- Go to git repository in `~/repo/remote_working_dir/project`
- Verify that you are on branch *master*
- Pull the changes from the remote into your master branch
