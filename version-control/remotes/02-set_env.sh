mkdir /s/remote-location
git init --bare /s/remote-location/myproject.git

git init
git remote add origin /s/remote-location/myproject.git
git push origin master

cd /s/remote-location
echo "la brace accesa" >> file_bello.txt