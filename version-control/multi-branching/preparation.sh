# git config --global user.name "Andrea Massaia"
# git config --global user.email andreamassaia@katacoda.com
git init
git config color.ui false
touch README.txt
git add README.txt
git commit -m "readme created"
echo "README" >> README.txt
git add README.txt
git commit -m "readme edited"