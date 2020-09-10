#### Solution

Switch to the "user_manual" branch  
`git checkout user_manual`{{execute}}  

Create an empty *user_manual.txt* file, for instance with
`touch user_manual.txt`{{execute}}  

Stage the changes and commit  
`git add user_manual.txt`{{execute}}  
`git commit -m "user manual created"`{{execute}}  

Switch back and perform the merge  
`git checkout master`{{execute}}
`git merge user_manual`{{execute}}  

> Now that our history has evolved over several commits on different branches, let's have an overview by running  
> `git log --oneline --graph`{{execute}}  
> Can you tell what happened? What if we checkout to a different branch and run the same command again?
