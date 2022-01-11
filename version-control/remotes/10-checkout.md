### Step 10 - Git Checkout - undo changes up to last commit

When working with Git, a common scenario is to **undo changes** in your working directory.

The command `git checkout` will **replace** everything in the working directory **to the last committed** version.

To replace all files then use a dot (`git checkout .`) to indicate the current directory, otherwise use a list the directories/files separated by spaces (`git checkout <file name> <file name>`).

---

#### Task

- Go to `~/repo/local_working_dir`
- Switch to branch *new_branch*
- Modify *new_feature.py* and write "aaa" inside of it
- Modify *new_new_feature.py* and write "aaa" inside of it
- Add *new_new_feature.py* to staging area (if not already in it)
- Modify *new_new_feature.py* again and write "bbb" inside of it
- Use `git status` to examine status of repository
- Use `git checkout <file name>` to undo the modification in file *new_feature.py*
- Print content of *new_feature.py* and *new_new_feature.py*
- Use `git checkout .` to undo the modification also in file *new_new_feature.py*
- Use `git status` to examine status of repository
- Print content of *new_feature.py* and *new_new_feature.py*
