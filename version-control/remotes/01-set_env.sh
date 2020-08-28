mkdir /s/remote-location/
mkdir /s/remote-location/0
mkdir /s/remote-location/1

git init --bare /s/remote-location/0/myproject.git

cd /s/remote-location/1
git init
git remote add origin /s/remote-location/0/myproject.git
git push origin master

cd /home/scrapbook/tutorial/
git init