git checkout installation
touch model.py
git commit -a -m 'model.py created in the wrong place'
cat "import pandas" >> model.py
git commit -a -m 'model.py edited, still in the wrong place'