### Step 4 - Git Push

When you make a modification on the local repository, you can share you work with following steps:
- add files modified to staging area with command `git add <file name>`
- commit changes with `git commit -m "<comment on commit>"`
- push changes to remote branch with command `git push <remote name> <destination branch>` where
	- *remote name* is the friendly name of the remote repository
	- *destination branch* is the name of the branch to push to
If *destination branch* does not exist in the remote repository, it will be created. 

A typical Git workflow would be to perform multiple small commits as you work on a task and push to a remote at relevant points, such as when the task is completed.

#### Task

- Create and checkout a new branch *new_branch*
- Create a new file *new_feature.py*
- Add the file to staging area with `git add`
- Commit the change with `git commit -m`
- Push the commit to the new remote branch *new_branch*
