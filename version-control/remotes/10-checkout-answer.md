#### Solution


`cd ~/repo/local_working_dir/project`{{execute}}
`git checkout new_branch`{{execute}}
`echo "aaa" >> new_feature.py`{{execute}}
`echo "aaa" >> new_new_feature.py`{{execute}}
`git add new_new_feature.py`{{execute}}
`echo "bbb" >> new_new_feature.py`{{execute}}
`git status`{{execute}}
`git checkout new_feature.py`{{execute}}
`cat new_feature.py`{{execute}}
`cat new_new_feature.py`{{execute}}
`git checkout .`{{execute}}
`git status`{{execute}}
`cat new_feature.py`{{execute}}
`cat new_new_feature.py`{{execute}}
