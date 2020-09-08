Git is used in countless software projects and branching is a key point to its success.  
Now you're expert in using branches in Git – but how are they used in real life?

---

Most Git project follow a **workflow**. This is a blueprint for the branching structure of the project, guiding how branches should be used.  
Let's see some of the most common workflows:

### Centralized Workflow

A centralized workflow doesn't use any branch other than `master`. All changes are committed to `master`; should commits diverge from it, the diverging branch is rebased on `master` and conflicts are manually resolved.

*Note that conflicts will be explained in detail in the next Scenario.*

### Long-running branches

Git allows to easily maintain and merge branches. For this reason, a project can sustain a number of branches open indefinitely. A common use is to keep a 'stable' branch, say `master`, untouched, and another branch (usually called `develop`) on which changes are committed. Periodically, `develop` is then merged back into `master`.  

The most common variation of this is topic branching or **feature branaching**, where each individual feature of the project is on a separate branch. These branches are created from, and then merge into, `develop`.  
An even more detailed workflow is **Gitflow**, which will be explained in detail in the last scenario of the course.


### Forking

A completely different workflow involves creating a complete copy of a remote repository, called a **fork**.

