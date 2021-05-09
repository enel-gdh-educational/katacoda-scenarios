git config --global color.ui false

cd basic_project

git init

git config color.ui false

echo "This repo contains the project for the course Version Control Systems" > README.md

git add README.md

git commit -m "First commit"

rm .gitignore

echo "Some additional info" >> README.md

echo "print('Hello world')" > hello_world.py

git add README.md hello_world.py

git commit -m "README modified. hello_world added."

git gc

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