git checkout master
git checkout -- README.txt
git checkout -- user_manual.txt
git checkout installation installation.txt
git add installation.txt
git commit -m "Installation.txt recovered from installation branch"

git checkout installation
touch model.py
git add model.py
git commit -m 'model.py created in the wrong place'
echo "import pandas" >> model.py
git add model.py
git commit -m 'model.py edited, still in the wrong place'
git checkout master