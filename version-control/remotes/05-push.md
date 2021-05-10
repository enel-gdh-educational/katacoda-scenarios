### Step 5 - Git Push - share your commits with remote repository

When you make a modification on the local repository, you can **share** you work with `git push` command following these steps:

- **add** files modified to staging area with command `git add <file name>`
- **commit** changes with `git commit -m "<comment on commit>"`
- **push** changes to remote branch with command `git push <remote name> <destination branch>` where
	- *remote name* is the friendly name of the remote repository
	- *destination branch* is the name of the branch to push to

If *destination branch* does not exist in the remote repository, it will be created. 

To be able to push, **write access** are needed on the remote.

If another user pushed in the meantime, your push will be rejected and you will need to **merge** with new changes **before pushing** again

A typical Git workflow would be to perform **multiple small commits** as you work on a task and **push** to a remote **at relevant points**, such as when the task is completed.
 
 
 *Note: If you use an HTTPS URL to push, the Git server will ask you for your username and password for authentication.
If you don’t want to type it for every push, you can set up  `git config --global credential.helper cache`*
 
 ---

#### Task

- Go to `/home/scrapbook/tutorial/repo`
- Create and checkout a new branch *new_branch*
- Create a new file *new_feature.py*
- Add the file to staging area with `git add`
- Commit the change with `git commit -m`
- Push the commit to the new remote branch *new_branch*
- Switch to master branch
- Run `ls` to list available files, you will see that *new_feature.py* is not there
- Merge *master* with *new_branch*
- Run `ls` to list available files, you will now see *new_feature.py*
- Push *master* to remote repository
