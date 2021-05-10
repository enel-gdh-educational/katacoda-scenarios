#### Solution

`name_surname="pippo_baudo"`{{execute}}

`mkdir /s/$name_surname/`{{execute}}

*Create bare remote repository* 
`mkdir /s/$name_surname/remote_repository`{{execute}}
`git init --bare /s/$name_surname/remote_repository/project.git`{{execute}}

*Create remote working directory*
`mkdir /s/$name_surname/working_dir`{{execute}}
`cd /s/$name_surname/working_dir`{{execute}}
`git clone /s/$name_surname/remote_repository/project.git`{{execute}}
`cd project`{{execute}}
`touch base_feature.py`{{execute}}
`git add base_feature.py`{{execute}}
`git commit -m "first commit"`{{execute}}
`git push origin master`{{execute}}

*Create local working directory*
`mkdir /home/scrapbook/tutorial/$name_surname`{{execute}}
`cd /home/scrapbook/tutorial/$name_surname`{{execute}}
`git init`{{execute}}



`mkdir /s/remote-location/`{{execute}}
`mkdir /s/remote-location/$name_surname`{{execute}}
`mkdir /s/remote-location/$name_surname`{{execute}}
`mkdir /s/remote-location/$name_surname/0`{{execute}}
`mkdir /s/remote-location/$name_surname/1`{{execute}}

`git init --bare /s/remote-location/$name_surname/0/myproject.git`{{execute}}

`cd /s/remote-location/$name_surname/1`{{execute}}
`git init`{{execute}}
`git remote add origin /s/remote-location/$name_surname/0/myproject.git`{{execute}}
`touch base_feature.py`{{execute}}
`git add base_feature.py`{{execute}}
`git commit -m "first commit"`{{execute}}
`git push origin master`{{execute}}

`cd /home/scrapbook/tutorial/`{{execute}}
`mkdir $name_surname`{{execute}}
`cd /$name_surname`{{execute}}
`git init`{{execute}}