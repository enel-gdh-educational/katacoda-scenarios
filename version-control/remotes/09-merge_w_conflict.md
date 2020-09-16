### Step 9 - Merge updates from remote folder to local, with conflicts to be solved manually

A **conflict** does exist when modifications merge cannot be done automatically.

In these cases Git throws an **error** and repository will be in merging state.

To **see** which files are **unmerged** at any point after a merge conflict, you can run `git status`

Files with unsolved merge conflicts are listed as unmerged. 
Git adds standard **conflict-resolution markers** to those files so they can be opened to solve those conflicts.
Changes from both the local and remote will appear in the same file in the **unix diff** format.

- **Local** changes will appear at the top between `<<<<<<< HEAD and =======` 
- **Remote** changes will appear underneath between `======= and >>>>>>>`

If we want to use a **graphical tool** to resolve these issues, we can run `git mergetool`, which fires up a visual merge tool and walks the user through the conflicts

---

##### *Deleting Remote Branches*

Once we are finished with a feature and have merged its branch into remote master branch, maybe we would like to delete the remote branch we have been using.
Remote branch can be deleted using `git push origin --delete <branch name>`

---

#### Task

We will push a modification on remote folder which will cause a conflict when working on local repository

- Go to git repository `/s/<name_surname>/working_dir/project`
- Switch to branch *new_branch*
- Use `git pull origin new_branch` to align with remote branch
- Modify file *new_feature.py* to print "Good morning World"
- Add file *new_feature.py* to staging area 
- Commit changes
- Push to remote branch *new_branch*
- Switch to *master* branch

Now remote branch *new_branch* is different from the one in our local repository. We modify local *new_branch* to create a conflict with remote.

- Go to local repository `/home/scrapbook/tutorial/<name_surname>`
- Switch to branch *new_branch*
- Modify file *new_feature.py* to print "Hola Mundo"
- Add file *new_feature.py* to staging area 
- Commit changes
- Fetch and merge local *new_branch* with *origin/new_branch*

You will see Git throwing an error due to modification made on *new_feature.py*. 

Repository is now in *merging state*

You can:
- Run `git status` to see the conflict
- Run `git checkout --ours <file name>` to keep local version of the file 
- Run `git checkout --theirs <file name>` to keep remote version of the file 
- Launch *mergetool* using command `git mergetool` to edit resulting file

If you use *mergetool* in the upper part of the screen you will see:

- on the left side: the file in your local folder
- on the right side: the file in remote folder

In this case we choose to keep local version

- Run `git checkout --ours <file name>` to keep local version of the file
- Add file to staging area
- Commit 
- Push to remote *new_branch*

Verify content in remote folder:

- Go to git repository `/s/<name_surname>/working_dir/project`
- Switch to branch *new_branch*
- Run `cat new_feature.py` to see content of *new_feature.py* file
- Use `git pull origin new_branch` to align with remote branch
- Print content of file *new_feature.py* 