git init
git config color.ui false
touch README.txt
git add README.txt
git commit -m "readme created"
echo "This is a README file" >> README.txt
git add README.txt
git commit -m "readme edited"