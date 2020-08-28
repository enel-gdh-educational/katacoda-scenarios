### Step 2 - Git Push

After making a modification on the local repository, adding involved files to staging area and performing commit, you can share your commits pushing them to a remote repository. 
The syntax of the command you need is `git push <remote name> <destination branch>`, where
	- *remote name* is the friendly name of the remote repository
	- *destination branch* is the name of the branch we want to push to
If *destination branch* does not exist in the remote repository, it will be created. 

A typical Git workflow would be to perform multiple small commits as you work on a task and push to a remote at relevant points, such as when the task is completed.

The git push command is followed by two parameters. The first parameter 


#### Task
- Push the commit you created in the previous step to the new remote branch *new_branch*
