echo "part 1"

git config --global color.ui false

cd /

name_surname="pippo_baudo"
old_dir=/s/$name_surname
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi
old_dir=/home/scrapbook/tutorial/$name_surname
if [ -d "$old_dir" ]; then rm -Rf $old_dir; fi

mkdir /s/$name_surname/

mkdir /s/$name_surname/remote_repository
git init --bare /s/$name_surname/remote_repository/project.git

mkdir /s/$name_surname/working_dir
cd /s/$name_surname/working_dir
git clone /s/$name_surname/remote_repository/project.git
cd project
touch base_feature.py
git add base_feature.py
git commit -m "first commit"
git push origin master

mkdir /home/scrapbook/tutorial/$name_surname
cd /home/scrapbook/tutorial/$name_surname
git init

echo "part 2"

git remote add origin /s/$name_surname/remote_repository/project.git
git remote -v
git remote show origin