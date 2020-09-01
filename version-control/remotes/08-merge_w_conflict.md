### Step 8 - Merge updates from remote folder to local, with conflicts to solve manually

A conflict does exist when merging modifications if the merge cannot be done automatically.
In these cases Git throws an error and repository will be in merging state.
Such conflicts need to be solved manually. In this case we will use command `git mergetool`

In tools used solving conflict changes from both the local and remote will appear in the same file in the unix diff format.
- Local changes will appear at the top between <<<<<<< HEAD and ======= 
- Remote changes will appear underneath between ======= and >>>>>>>

To resolve the conflict the files need to be edited to match our desired end state.

#### Task

We will push a modification on remote folder which will cause conflict when working on local repository

- Go to git repository `/s/<name_surname>/remote_repository/`
- Switch to branch *new_branch*
- Use `git pull origin new_branch` to align with remote branch
- Modify file *new_feature.py* to print "Good morning World"
- Add file *new_feature.py* to staging area 
- Commit changes
- Push to remote branch *new_branch*
- Switch to *master* branch

- Go to local repository `/home/scrapbook/tutorial`
- Switch to branch *new_branch*

Now remote branch *new_branch* is different from our local repository

- Modify file *new_feature.py* to print "Hola Mundo"
- Add file *new_feature.py* to staging area 
- Commit changes
- Fetch and merge local *new_branch* with *origin/new_branch*

You will see Git throwing an error due to modification made on *new_feature.py*
You can use:

- `git checkout --ours <file name>` to keep local version of the file 
- `git checkout --theirs <file name>` to keep remote version of the file 
- Launch *mergetool* using command `git mergetool` to edit resulting file

If you use *mergetool* in the upper part of the screen you will see:

- on the left side: the file in your local folder
- on the right side: the file in remote folder

In this case you want to keep your version

- Run `git checkout --ours <file name>` to keep local version of the file
- Add file to staging area
- Commit 
- Push to remote *new_branch*

Verify content in remote folder:

- Go to git repository `/s/remote-location/<name_surname>1/`
- Switch to branch *new_branch*
- Use `git pull origin new_branch` to align with remote branch
- Print content of file *new_feature.py*