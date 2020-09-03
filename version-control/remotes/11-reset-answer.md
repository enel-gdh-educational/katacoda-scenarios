`cd /home/scrapbook/tutorial/<name_surname>`
`git checkout new_branch`
`echo "print('Guten Morgen')" >> new_feature.py`
`echo "print('Buongiornissimo')" >> new_new_feature.py`
`git status`
`git add new_feature.py`
`git add new_new_feature.py`
`git status`
`git reset new_new_feature.py`
`git status`
`git commit -m "Adapted to German market"`
`git push origin new_branch`