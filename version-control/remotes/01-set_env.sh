mkdir /s/remote-location/
mkdir /s/remote-location/0
mkdir /s/remote-location/1

git init --bare /s/remote-location/0/myproject.git

cd /s/remote-location/1
git init
git remote add origin /s/remote-location/0/myproject.git
git push origin master
git branch additional_feature
git checkout additional_feature
echo "print('Hello world')" >> feature.py
git add feature.py
git commit -m "hello world feature"
git push origin additional_feature
git checkout master
git pull

cd /home/scrapbook/tutorial/
git init