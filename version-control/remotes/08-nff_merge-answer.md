#### Solution

`cd ~/repo/remote_working_dir/project`{{execute}}
`git fetch`{{execute}}
`git checkout new_branch`{{execute}}
`echo "print('Hello World')" >> new_feature.py`{{execute}}
`git add new_feature.py`{{execute}}
`git commit -m "added hello world"`{{execute}}
`git push origin new_branch`{{execute}}
`git checkout master`{{execute}}
`cd ~/repo/local_working_dir`{{execute}}
`git checkout new_branch`{{execute}}
`touch new_new_feature.py`{{execute}}
`git add new_new_feature.py`{{execute}}
`git commit -m "starting newnew feature"`{{execute}}
`git pull --no-edit origin new_branch`{{execute}}
`git push origin new_branch`{{execute}}
