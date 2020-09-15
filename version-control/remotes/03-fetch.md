### Step 3 - Git Fetch - get updates from remote folder, preserving local status

`git fetch <remote>` command downloads **new data** from the remote repository. 
It allows user to have references to all branches from remote into **separate branches** with names `remotes/<remote-name>/<remote-branch-name>`.
Branches downloaded `git fetch <remote>` can be **accessed** using `git checkout <remote-name>/<remote-branch-name>`.
After you do this, you should have references to all the branches from that remote, which you can merge in or inspect at any time.
`git fetch <remote>` allows reviewing the changes without affecting your current branch. You have to merge it manually into your work when ready

---

#### Task

Changes have been made in the origin repository. 
- Use `git branch -a` to list all the branches available
- Use `git fetch` to download the changes in the remote repository
- Use `git branch -a` to list all the branches available

Now you should be able to see the remote branch *origin/master*