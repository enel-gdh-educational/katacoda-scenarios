git checkout installation
echo "This is the installation guide." >> installation.txt
git stash
git checkout user_manual
echo "USER MANUAL" >> user_manual.txt
git stash
git checkout installation
git stash pop 1
git add installation.txt
git commit -m "installation guide edited"
git stash drop