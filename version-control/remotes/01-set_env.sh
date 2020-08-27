mkdir /s/remote-location/
mkdir /s/remote-location/0
mkdir /s/remote-location/1

git init --bare /s/remote-location/0/myproject.git

cd /s/remote-location/1
git init
git remote add origin /s/remote-location/0/myproject.git
git push origin master
git branch new_branch
git checkout new_branch
touch file_bello.txt
git add file_bello.txt
git commit -m "file_bello.txt"

cd /home/scrapbook/tutorial/
git init