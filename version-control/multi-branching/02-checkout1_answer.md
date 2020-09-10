#### Solution

We can switch back to the "master" branch by running  
`git checkout master`{{execute}}  

*(Note that If you happen to be already on the branch you're checking out, Git will print a warning and nothing will happen).*  

As we did before, we create a branch named "installation" with  
`git branch installation`{{execute}}  

Switch to the "installation" branch  
`git checkout installation`{{execute}}  

> *Alternatively*, you can create the branch and switch to it in one command using  
> `git checkout -b installation`

Create a new empty file called "installation.txt", for instance you can use  
`touch installation.txt`{{execute}}  

Stage and commit the change  
`git add installation.txt`{{execute}}  
`git commit -m "installation guide created"`{{execute}}  
