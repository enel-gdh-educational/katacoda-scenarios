### Step 8 - Merge updates from remote folder to local, with automatic-solvable conflicts (non fast-forward)

Non-fast forward merge happens in scenarios like the following one:

- Developer A pulls the latest changes from Developer B.
- Developer B commits changes to remote repository.
- Developer A commits non-conflicting changes to local repository.
- Developer A pulls the latest changes from Developer B.

In this scenario Git is unable to fast-forward the changes from Developer B because Developer A also has made changes.

When this happens, Git will attempt to auto-merge the changes. If no conflicts exist then the merge will be completed and a new commit will be created.

The default commit message for merges is "Merge branch '' of ". These commits can be useful to indicate synchronisation points.

#### Task

- You are still in in repository `/s/<name_surname>/working_dir/project`
- use `git fetch` to fetch remote branches
- Switch to branch *new_branch*
- Modify file *new_feature.py* to print "Hello World"
- Add file *new_feature.py* to staging area 
- Commit changes
- Push to remote branch *new_branch*
- Switch to *master* branch
- Go to local repository `/home/scrapbook/tutorial/<name_surname>`
- Switch to branch *new_branch*
- Create file *new_new_feature.py*
- Add *new_new_feature.py* to staging area 
- Commit modification

If you try to push to *new_branch* Git will throw an error.
This is because there are modifications in remote *new_branch* you have not in local branch.
Therefore you need first to align local with remote:

- Run `git pull --no-edit <remote name> <branch name>`, use *--no-edit* to avoid writing in commit message
- Push your modifications to remote branch

Now your branch is aligned with remote and you have pushed your modifications

