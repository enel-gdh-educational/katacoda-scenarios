# Advanced `checkout` usage

You already added several files to the project, which now spans several branches. As the project grows, mistakes can happen – but no worries: Git has ways to revert them.

---

As anticipated, `checkout` has different uses beyond switching from one branch to another. Technically, as explained in its manual entry, `checkout` "updates files in the working tree to match the version in the index or the specified tree". This means that `checkout` can be used to reset the state of the working directory, or the state of specific files, to a previous state after changes were made.

esempio

This works even if the changes were staged:

esempio

You can also use `git checkout` to bring back files that were accidentally deleted:

