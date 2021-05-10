#### Solution

`name_surname = "pippo_baudo"`{{execute}}
`cd /home/scrapbook/tutorial/$name_surname`{{execute}}
`git checkout new_branch`{{execute}}
`echo "aaa" >> new_feature.py`{{execute}}
`echo "aaa" >> new_new_feature.py`{{execute}}
`git status`{{execute}}
`git checkout new_feature.py`{{execute}}
`cat new_feature.py`{{execute}}
`cat new_new_feature.py`{{execute}}
`git checkout .`{{execute}}
`git status`{{execute}}
`cat new_feature.py`{{execute}}
`cat new_new_feature.py`{{execute}}