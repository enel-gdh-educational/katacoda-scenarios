#### Solution

`cd /`

*Create personal directory*

`mkdir /s/repo/`{{execute}}


*Create bare remote repository* 

`mkdir /s/repo/remote_repository`{{execute}}
`git init --bare /s/repo/remote_repository/project.git`{{execute}}


*Create remote working directory*

`mkdir /s/repo/working_dir`{{execute}}
`cd /s/repo/working_dir`{{execute}}
`git clone /s/repo/remote_repository/project.git`{{execute}}
`cd project`{{execute}}
`touch base_feature.py`{{execute}}
`git add base_feature.py`{{execute}}
`git commit -m "first commit"`{{execute}}
`git push origin master`{{execute}}


*Create local working directory*

`mkdir /home/scrapbook/tutorial/repo`{{execute}}
`cd /home/scrapbook/tutorial/repo`{{execute}}
`git init`{{execute}}