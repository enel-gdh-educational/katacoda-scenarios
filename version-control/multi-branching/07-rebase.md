As the commit history of your project grows and branches proliferate, the picture can get messy. Git has, however, a way to make it cleaner.  

---

Beyond `git merge`, Git offers another way of integrating changes from one branch into another: `git rebase`.

If you run `git rebase <upstream_branch> <branch>`, Git will undo all changes applied to `<branch>` and not yet merged in `<upstream_branch>`, reapply them on the tip of `<upstream_branch>`, and fast-forward (merge) `<upstream_branch>` to `<branch>`. Effectively, this "relocates" a branch from its position to the tip of `<upstream_branch>`.

Specifying `<branch>` is optional: if you don't, the currently checked-out branch will be used for it. On the other hand, if the changes should be applied to a branch different than `<upstream_branch>`, this can be specified with the `--onto` option: `git rebase --onto <target_branch> <upstream_branch> <branch>` will take all commits differentiating `<branch>` from `<upstream_branch>`, and transplant them on the tip of `<target_branch>`.

Esempio

### Rebase or merge?

Either `merge` and `rebase` have their own pros and cons, and should be used accordingly.  
When using `merge`, the commit history is preserved and can be traced back, allowing developers to identify where and when ALL changes happened – even those that were subequently reverted or discarded: this can result in a rather convoluted history.  
On the other hand, `rebase` rewrites the branching structure of the repository, resulting in a cleaner, more readable history. However, as rebasing effectively relocates commits, is prone to ambiguities. This is particularly true when multiple developers working off a remote repository are involved: in this scenario, `rebase` should be used with caution.

## Exercise

**The `model` branch is actually redundant – we can continue developing our model on `master`.**
**Rebase the `model` branch on `master`, then delete it.**