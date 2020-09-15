### Step 11 - Git Reset - remove files from staging area

When you are about to commit but you have added files in the **staging** area you want to **remove** you can use `git reset`. 

`git reset` moves files back from the staging area to the working directory.
 
If you want to reset all files then use a dot (`git reset .`) to indicate current directory, otherwise list the files separated by spaces (`git reset <file name> <file name> <file name>`).

`git reset` is useful when trying to keep your commits small and focused as you can move files back out of the staging area if you've added too many.

---

#### Task

- Go to `/home/scrapbook/tutorial/<name_surname>`
- Switch to branch *new_branch*
- Modify *new_feature.py* to print "Guten Morgen" inside of it
- Modify *new_new_feature.py* to print "Buongiornissimo"
- Use `git status` to see status of repository
- Add *new_feature.py* to the staging area
- Add *new_new_feature.py* to the staging area
- Use `git status` to see status of repository

You want to commit just updates on *new_feature.py*

- Remove *new_new_feature.py* from stagin area using `git reset`
- Use `git status` to see status of repository
- Commit modification to file *new_feature.py*
- Push to remote *new_branch*

### Advanced - Git Reset Hard

A `git reset --hard` will combine both git reset and git checkout in a single command. 

The result will be that the files are removed from the staging area and the working directory is taken back to the state of the last commit.

Using `HEAD` will clear the state back to the last commit. Using `git reset --hard <commit-hash>` allows you to go back to any commit state. 

Remember, `HEAD` is an alias for the last commit-hash of the branch.