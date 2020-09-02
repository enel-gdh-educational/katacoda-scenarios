### Step 11 - Git Reset

If you're in the middle of a commit and have added files to the staging area but then changed your mind then you'll need to use the git reset command. git reset will move files back from the staging area to the working directory. If you want to reset all files then use a . to indicate current directory, otherwise list the files separated by spaces.
This is very useful when trying to keep your commits small and focused as you can move files back out of the staging area if you've added too many.

#### Task

Move the changes from staging back to the working directory using git reset



### Step 11a - Git Reset Hard

A git reset --hard will combine both git reset and git checkout in a single command. The result will be the files removed from the staging area and the working directory is taken back to the state of the last commit.

#### Task

Remove the changes from both the staging area and working directory using git reset

Protip

Using HEAD will clear the state back to the last commit, using git reset --hard <commit-hash> allows you to go back to any commit state. Remember, HEAD is an alias for the last commit-hash of the branch.