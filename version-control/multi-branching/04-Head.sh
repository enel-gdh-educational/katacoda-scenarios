git checkout user_manual
touch user_manual.txt
git add user_manual.txt
git commit -m "user manual created"
git checkout master
git merge user_manual
clear