You already added several files to the project, which now spans several branches. As the project grows, mistakes can happen – but no worries: Git has ways to revert them.

---

As anticipated, `checkout` has different uses beyond switching from one branch to another. Technically, as explained in its manual entry, `checkout` "updates files in the working tree to match the version in the index or the specified tree". This means that `checkout` can be used to reset the working directory, or specific files, to a previous state after changes were made.

If a file has *unstaged* changes, these can be reverted with `git checkout -- <file>`:

This can also bring back files that were accidentally deleted.

> *Note that the "--" is used to avoid ambiguities between files and branches with the same name. It can be omitted: in this case, Git will treat the argument as a branch name first, then as a filename a
if it doesn't find a suitable branch.*

Generally speaking, `git checkout` accepts a "path-like" argument and will restore the state of all files at that path.
For instance, to revert changes to all files in the preset working directory, you could run `git checkout -- .`.

If the change(s) were staged already, `git checkout` won't work – and Git will ask you to unstage things first using `git revert`.

---

Another way `checkout` could be used is moving files between branches. In this case, the syntax is `git checkout <branch> <file>`.  
This command would bring the file named "file", FROM the branch named "branch", INTO the branch currently checked out, and **stage** that change.

## Exercise

**Something's gone wrong...**