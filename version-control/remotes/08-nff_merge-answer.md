#### Solution


`git fetch`{{execute}}
`git checkout new_branch`{{execute}}
`echo "print('Hello World')" >> new_feature.py`{{execute}}
`git add new_feature.py`{{execute}} 
`git commit - m "added hello world"`{{execute}}
`git push origin new_branch`{{execute}}
`git checkout master`{{execute}}
`cd /home/scrapbook/tutorial/repo`{{execute}}
`git checkout new_branch`{{execute}}
`touch new_new_feature.py`{{execute}}
`git add new_new_feature.py`{{execute}}
`git commit -m "starting newnew feature"`{{execute}} 
`git pull --no-edit origin new_branch`{{execute}}
`git push origin new_branch`{{execute}}
