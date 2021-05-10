#### Solution

`cd /s/<name_surname>/working_dir/project`{{execute}}
`git checkout new_branch`{{execute}}
`git pull origin new_branch`{{execute}}
`echo "print('Good morning World')" >> new_feature.py`{{execute}}
`git add new_feature.py`{{execute}}
`git commit -m "improved greeting"`{{execute}}
`git push origin new_branch`{{execute}}
`git checkout master`{{execute}}

`cd /home/scrapbook/tutorial/<name_surname>`{{execute}}
`git checkout new_branch`{{execute}}
`echo "print('Hola Mundo')" >> new_feature.py`{{execute}}
`git add new_feature.py`{{execute}}
`git commit -m "adapted to Spain market"`{{execute}}
`git fetch`{{execute}}
`git merge origin/new_branch`{{execute}}

`git status`{{execute}}
`git checkout --ours new_feature.py`{{execute}}
`git add new_feature.py`{{execute}}
`git commit -m "conflict on new_feature solved"`{{execute}}
`git push origin new_branch`{{execute}}

`cd /s/<name_surname>/working_dir/project`{{execute}}
`git checkout new_branch`{{execute}}
`cat new_feature.py`{{execute}}
`git pull origin new_branch`{{execute}}
`cat new_feature.py`{{execute}}

