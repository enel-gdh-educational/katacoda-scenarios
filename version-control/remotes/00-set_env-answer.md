`mkdir /s/<name_surname>/` 

`mkdir /s/<name_surname>/remote_repository`
`git init --bare /s/<name_surname>/remote_repository/project.git` 

`mkdir /s/<name_surname>/working_dir`
`cd /s/<name_surname>/working_dir`
`git clone /s/<name_surname>/remote_repository/project.git`
`touch base_feature.py`
`git add base_feature.py`
`git commit m "first commit"`
`git push origin master`

`mkdir /home/scrapbook/tutorial/<name_surname>`
`cd /home/scrapbook/tutorial/<name_surname>`
`git init`



`mkdir /s/remote-location/`
`mkdir /s/remote-location/<name_surname>`
`mkdir /s/remote-location/<name_surname>`
`mkdir /s/remote-location/<name_surname>/0`
`mkdir /s/remote-location/<name_surname>/1`

`git init --bare /s/remote-location/<name_surname>/0/myproject.git`

`cd /s/remote-location/<name_surname>/1`
`git init`
`git remote add origin /s/remote-location/<name_surname>/0/myproject.git`
`touch base_feature.py`
`git add base_feature.py`
`git commit -m "first commit"`
`git push origin master`

`cd /home/scrapbook/tutorial/`
`mkdir <name_surname>`
`cd /<name_surname>`
`git init`