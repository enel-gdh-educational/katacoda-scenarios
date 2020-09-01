mkdir /s/remote-location/<name_surname>
mkdir /s/remote-location/<name_surname>0
mkdir /s/remote-location/<name_surname>1

git init --bare /s/remote-location/<name_surname>0/myproject.git

cd /s/remote-location/<name_surname>1
git init
git remote add origin /s/remote-location/<name_surname>0/myproject.git
echo "print('Hello World')" >> base_feature.py
git add base_feature.py
git commit -m "first commit"
git push origin master

cd /home/scrapbook/tutorial/
git init