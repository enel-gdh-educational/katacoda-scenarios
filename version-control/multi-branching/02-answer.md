#### Solution:

1. We can to switch back to `master`, by running `checkout master`{{execute}}.

2. As we did before, we create a branch named "installation" with `git branch installation`.  
3. We switch to the installation with `git checkout installation`.

**OR**

> 2-3. We can run `git checkout -b installation`  to create the branch and switch to it in one command.

4. Create a new empty file called "installation.txt" by using `touch installation.txt`{{execute}}.
5. Run `git add installation.txt`{{execute}} to stage the change, and commit with `git commit -m "installation guide created"`.

6. `git checkout master` brings us back to the `master` branch.
