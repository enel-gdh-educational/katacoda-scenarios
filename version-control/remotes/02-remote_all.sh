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
git remote -v
git remote show origin