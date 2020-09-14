As the commit history of your project grows and branches proliferate, the picture can get messy. Git has, however, a way to make it cleaner.  

---

Beyond `git merge`, Git offers another way of integrating changes from one branch into another: `git rebase`.

If you run `git rebase <branch>`, Git will undo all changes applied to `<branch>` and not yet merged in the current branch, apply them on the tip of the present branch, and fast-forward (merge) `<branch>` to it. Effectively, this "relocates" `<branch>` from its position to the tip of the current branch.

Another way of using this command is specifying two branches. In this case, using `git rebase <branch_A> <branch_B>` is the shorthand for:  
`git checkout <branch_B>`  
`git rebase <branch_A>`  

Finally, we can specify a target branch to which the changes should be applied (rather than the current branch) with the `--onto` option: `git rebase --onto <target_branch> <branch_A> <branch_B>` will take all commits differentiating `<branch_A>` from `<branch_B>`, and transplant them on the tip of `<target_branch>`.

### Rebase or merge?

Either `merge` and `rebase` have their own pros and cons, and should be used accordingly.  
When using `merge`, the commit history is preserved and can be traced back, allowing developers to identify where and when ALL changes happened – even those that were subequently reverted or discarded: this can result in a rather convoluted history.  
On the other hand, `rebase` rewrites the branching structure of the repository, resulting in a cleaner, more readable history. However, as rebasing effectively relocates commits, is prone to ambiguities. This is particularly true when multiple developers working off a remote repository are involved: in this scenario, `rebase` should be used with caution.

## Exercise

**The `model` branch is actually redundant – we can continue developing our model on `master`.**
**Rebase the `model` branch on `master`, then delete it.**