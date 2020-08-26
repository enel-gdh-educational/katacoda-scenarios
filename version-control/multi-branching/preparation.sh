git init
git config color.ui false
git config --global user.name "Andrea Massaia"
git config --global user.email andreamassaia@katacoda.com
touch installation.txt
git add installation.txt
git commit -m "installation guide created"
git commit --amend --
echo "INSTALLATION GUIDE" >> installation.txt
git add installation.txt
git commit -m "installation guide edited"