git checkout installation
touch model.py
git add model.py
git commit -m 'model.py created in the wrong place'
echo "import pandas" >> model.py
git add model.py
git commit -m 'model.py edited, still in the wrong place'
git checkout master