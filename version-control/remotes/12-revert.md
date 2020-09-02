### Step 12 - Git Revert
If you have already committed files but realised you made a mistake then the command git revert allows you to undo the commits. The command will create a new commit which has the inverse affect of the commit being reverted.
If you haven't pushed your changes then git reset HEAD~1 has the same affect and will remove the last commit.

#### Task

Use git revert to revert the changes in the last commit.
Note, this will open an Vim editor session to create a commit message for each commit. To save the commit message and quit vim type the command :wq for each Vim session.

#### Protip

The motivation behind creating new commits is that re-writing history in Git is an anti-pattern. If you have pushed your commits then you should create new commits to undo the changes as other people might have made commits in the meantime.

### Step 12 - Git Revert

To revert multiple commits at once we use the character ~ to mean minus. For example, HEAD~2 is two commits from the head. This can be combined with the characters ... to say between two commits.

#### Task

Use the command git revert HEAD...HEAD~2 to revert the commits between HEAD and HEAD~2.

#### Protip

You can use the command git log --oneline for a quick overview of the commit history.