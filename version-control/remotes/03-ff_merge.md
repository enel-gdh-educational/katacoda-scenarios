### Step 3 - Git merge

`git fetch` downloads changes into a separate branch which can be checked out and merged.
During a *merge* Git will attempt to automatically combine the commits.

When no conflicts exist then the merge will be 'fast-forwarded' and can be done automatically.
If a conflict does exist an error is retrieved and the repository will be in a merging state.

#### Task

Merge content fetched from *origin/master* on your local repositoy.
- Run `ls` to see content of local repository
- Run `git branch -a` to list all the available branches
- Use `git merge <name of remote master branch>`
- Run `ls`, now you should see new content in the folder
- Run `git branch -a` to see new local branch *master*
