#### Solution

`cd ~`{{execute}}

*Create personal directory*

`mkdir repo/`{{execute}}


*Create bare remote repository*

`mkdir -p repo/remote_repository`{{execute}}
`git init --bare repo/remote_repository/project.git`{{execute}}


*Create remote working directory*

`mkdir repo/remote_working_dir`{{execute}}
`cd repo/remote_working_dir`{{execute}}
`git clone ~/repo/remote_repository/project.git`{{execute}}
`cd project`{{execute}}
`touch base_feature.py`{{execute}}
`git add base_feature.py`{{execute}}
`git commit -m "first commit"`{{execute}}
`git push origin master`{{execute}}


*Create local working directory*

`mkdir -p ~/repo/local_working_dir/project`{{execute}}
`cd ~/repo/local_working_dir/project`{{execute}}
`git init`{{execute}}
