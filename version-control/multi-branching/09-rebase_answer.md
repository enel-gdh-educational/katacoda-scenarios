#### Solution

First, switch to the master branch  
`git checkout master`{{execute}}  

At this point, you can simply relocate the model branch  
`git rebase model`{{execute}}

*In one command, we could have used*
*`git rebase model master`*

Finally, delete the model branch  
`git branch -d model`{{execute}}
