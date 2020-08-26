git init
git config color.ui false
git config user.name "Andrea Massaia"
git config user.email andreamassaia@katacoda.com
touch installation.txt
git add installation.txt
git commit -m "installation guide created"
git commit --amend --
echo "INSTALLATION GUIDE" >> installation.txt
git add installation.txt
git commit -m "installation guide edited"