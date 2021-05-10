#### Solution

`git branch new_branch`{{execute}}
`git checkout new_branch`{{execute}}
`touch new_feature.py`{{execute}}
`git add new_feature.py`{{execute}}
`git commit -m "adding new feature"`{{execute}}
`git push origin new_branch`{{execute}}
`git checkout master`{{execute}}
`ls`{{execute}}
`git merge new_branch`{{execute}}
`ls`{{execute}}
`git push origin master`{{execute}}
