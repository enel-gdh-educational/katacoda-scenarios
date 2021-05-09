git config --global color.ui false
git config --global user.name "Andrea Massaia"
git config --global user.email "andrea.massaia@enel.com"

cd basic_project

git init

git config color.ui false

echo "This repo contains the project for the course Version Control System" > README.md

git add README.md

git commit -m "First commit. README added"

echo "Some additional info" >> README.md

echo "print('Hello world')" > hello_world.py

git add README.md hello_world.py

git commit -m "README modified; hello_world added."

mkdir src
git mv hello_world.py src
git mv README.md readme.md

git commit -m "Some renaming and file repositioning"

touch foo
touch bar

echo "foo" > .gitignore
echo "bar" > .gitignore

git add .gitignore

git commit -m "Added .gitignore"    

clear