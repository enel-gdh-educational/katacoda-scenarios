#### Solution


`cd ~/repo/local_working_dir`{{execute}}
`git checkout new_branch`{{execute}}
`echo "print('Guten Morgen')" >> new_feature.py`{{execute}}
`echo "print('Buongiornissimo')" >> new_new_feature.py`{{execute}}
`git status`{{execute}}
`git add new_feature.py`{{execute}}
`git add new_new_feature.py`{{execute}}
`git status`{{execute}}
`git reset new_new_feature.py`{{execute}}
`git status`{{execute}}
`git commit -m "Adapted to German market"`{{execute}}
`git push origin new_branch`{{execute}}
