### Step 2 - Git Fetch - get updates from remote folder, preserving local status",

`git fetch` command downloads changes from the remote repository into a separate branch named `remotes/<remote-name>/<remote-branch-name>`. This branch can be accessed using git checkout.
`git fetch` allows reviewing the changes without affecting your current branch.

#### Task

Changes have been made in the origin repository. 
- Use `git branch -a` to list all the branches available
- Use `git fetch` to download the changes in the remote repository
- Use `git branch -a` to list all the branches available

Now you should be able to see the remote branch *origin/master*