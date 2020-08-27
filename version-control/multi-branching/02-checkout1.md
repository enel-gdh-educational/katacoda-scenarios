# Switching branches

You created a new branch, however `git branch` shows you're still on `master`.  
If you commit now, new commits will still go on `master`.

When a new branch is created using `git branch`, git will not automatically move you to it.

---

To switch to the new branch, you can use `git checkout <new branch>`.

Alternatively, you can create a new branch AND switch to it using `git checkout -b <new branch>`.  

This would be a shortcut for:  
`git branch <new branch>`  
`git checkout <new branch>`  

Git v2.23 introduced a new command, `git switch`, which works in exactly the same way (e.g. `git switch <new branch`> would) switch you to `<new branch>`).
The rationale for introducing the `git switch` command is that `checkout` does other things too (we'll see them in a couple of steps), so its functions might be reduced at some point, with `git switch` becoming the standard way to switch branches. In Katacoda, however, we can't yet test it, so we're going to use `git checkout`.

## Exercise:

**Before we can write the user manual, we should actually write an installation guide!

1. Make sure you're on master.
2. Create a new branch named `installation`.
3. Switch to the newly created branch.
4. Create a new empty file called "installation.txt" by using `touch installation.txt`{{execute}}.
5. Commit the new file to the installation branch.**