#### Solution
Switch to the installation branch:  
`git checkout installation`{{execute}}  

Try editing the installation.txt file. For instance, from the terminal you could run:  
`echo "This is the installation guide." >> installation.txt`{{execute}}  

*Now try switching to the user_manual branch: what happens?*  
`git checkout user_manual`  

Save your work and finally switch to the user_manual branch:  
`git stash`{{execute}}
`git checkout user_manual`{{execute}}

Edit the user_manual.txt file. For instance, you can edit from the terminal:  
`echo "USER MANUAL" >> user_manual.txt`

Save the change and switch back to installation:  
`git stash`{{execute}}
`git checkout installation`{{execute}}

Now, apply and commit the changes you saved earlier:  
`git stash pop 1`{{execute}}
`git add installation.txt`{{execute}}
`git commit -m "installation guide edited"`{{execute}}

Finally, empty the stash:  
`git stash drop`{{execute}}