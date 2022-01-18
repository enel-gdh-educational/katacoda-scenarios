echo "part 1"

git config --global color.ui false

cd ~


old_dir=/s/repo
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi
old_dir=/home/scrapbook/tutorial/repo
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi


mkdir -p repo/remote_repository
git init --bare repo/remote_repository/project.git

mkdir repo/remote_working_dir
cd repo/remote_working_dir
git clone ~/repo/remote_repository/project.git
cd project
touch base_feature.py
git add base_feature.py
git commit -m "first commit"
git push origin master

mkdir ~/repo/local_working_dir/project
cd ~/repo/local_working_dir/project
git init


echo "part 2"

git remote add origin ~/repo/remote_repository/project.git
git remote -v
git remote rename origin root
git remote show root
git remote rename root origin


echo "part 3"

git fetch
