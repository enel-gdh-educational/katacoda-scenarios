#### Solution

Create the new branch, and switch to it, with `git checkout -b model` {{execute}}

Run `git log --oneline installation`{{execute}} to view the commit history of the `installation` branch, and identify the commits you want to relocate.

Now, use `git cherry-pick` with the `-m` option on each one of them, and edit the commit message in the process.