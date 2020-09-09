#### Solution

Create the new branch, and switch to it  
`git checkout -b model`{{execute}}

Now you need to inspect the commit history on the "installation" branch. You can do this with  
`git log --oneline installation`{{execute}}  

Identify the commits you want to relocate, pick them and edit the commit message using  
`git cherry-pick -e`
