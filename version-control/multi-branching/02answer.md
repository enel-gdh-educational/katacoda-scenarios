#### Solution

We can to switch back to `master` by running `git checkout master`{{execute}} (If you happen to be on `master` already, Git will print a warning and nothing will happen).  

As we did before, we create a branch named "installation" with `git branch installation`{{execute}}.  

We switch to the installation with `git checkout installation`{{execute}}.

> *Alternatively*, you can run `git checkout -b installation` to create the branch and switch to it in one command.

Create a new empty file called "installation.txt" by using `touch installation.txt`{{execute}}.

Run `git add installation.txt`{{execute}} to stage the change, and commit with `git commit -m "installation guide created"`{{execute}}.
