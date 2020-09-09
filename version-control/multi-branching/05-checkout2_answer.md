#### Solution

You can try to bring all files back in one go using
`git checkout -- .`{{execute}}

*OR*, one file at a time:
`git checkout -- README.txt`{{execute}}
`git checkout -- user_manual.txt`{{execute}}
`git checkout -- installation.txt`{{execute}}

However, the last will fail! Why?
*Hint: check the commit history.*
`git log --oneline`{{execute}}

No worries! You can recover the *installation.txt* file from another branch with
`git checkout installation installation.txt`{{execute}}

Now, stage and commit the change
`git add installation.txt`{{execute}}
`git commit -m "Installation.txt recovered from installation branch"`{{execute}}
