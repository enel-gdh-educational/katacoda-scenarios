echo "part 1"

git config --global color.ui false

cd /


old_dir=/s/repo
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi
old_dir=/home/scrapbook/tutorial/repo
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi

mkdir /s/repo/

mkdir /s/repo/remote_repository
git init --bare /s/repo/remote_repository/project.git

mkdir /s/repo/working_dir
cd /s/repo/working_dir
git clone /s/repo/remote_repository/project.git
cd project
touch base_feature.py
git add base_feature.py
git commit -m "first commit"
git push origin master

mkdir /home/scrapbook/tutorial/repo
cd /home/scrapbook/tutorial/repo
git init


echo "part 2"

git remote add origin /s/repo/remote_repository/project.git


echo "part 3"

git fetch


echo "part 4"

git merge origin/master


echo "part 5"

git branch new_branch
git checkout new_branch
touch new_feature.py
git add new_feature.py
git commit -m "adding new feature"
git push origin new_branch
git checkout master
git merge new_branch
git push origin master


echo "part 6"

git log -p -1


echo "part 7"

cd /s/repo/working_dir/project
git pull origin master


echo "part 8"

cd /s/repo/working_dir/project
git fetch
git checkout new_branch
echo "print('Hello World')" >> new_feature.py
git add new_feature.py 
git commit -m "added hello world"
git push origin new_branch
git checkout master
cd /home/scrapbook/tutorial/repo
git checkout new_branch
touch new_new_feature.py
git add new_new_feature.py
git commit -m "starting newnew feature" 
git pull --no-edit origin new_branch
git push origin new_branch


echo "part 9"

cd /s/repo/working_dir/project
git fetch
git checkout new_branch
git pull origin new_branch
echo "print('Good morning World')" >> new_feature.py
git add new_feature.py
git commit -m "improved greeting"
git push origin new_branch
git checkout master

cd /home/scrapbook/tutorial/repo
git checkout new_branch
echo "print('Hola Mundo')" >> new_feature.py
git add new_feature.py
git commit -m "adapted to Spain market"
git fetch
git merge origin/new_branch

git checkout --ours new_feature.py
git add new_feature.py
git commit -m "conflict on new_feature solved"
git push origin new_branch

cd /s/repo/working_dir/project
git checkout new_branch
cat new_feature.py
git pull origin new_branch
cat new_feature.py
