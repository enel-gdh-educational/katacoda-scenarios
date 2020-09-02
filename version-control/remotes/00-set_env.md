### Step 0 - Set environment - set url of remote folder

In this step we will initialize the environment required for following steps.
It will consist of:

- a remote repository containing revision history
- a remote working directory containing revision history and copies of project files
- a local working directory containing revision history and copies of project files

`git init` command creates an empty Git repository. Running `git init` in an existing repository will not overwrite contents of the folder.

`git init --bare` creates a bare repository. Bare repos contain no working or checked out copy of your source files and are customarily given a *.git* extension


#### Task

- Use `mkdir` to create directory `/s/<name_surname>/` 

*Create bare remote repository* 

- Use `mkdir` to create directory `/s/<name_surname>/remote_repository`, this will simulate the remote centralized repository
- Use `git init` with `--bare` option to initialize remote repository at location `/s/<name_surname>/remote_repository/project.git` 

*Create remote working directory*

- Use `mkdir` to create directory `/s/<name_surname>/working_dir`, this will simulate another user working on the same project
- Go to `/s/<name_surname>/working_dir`
- Initialize folder using `git clone /s/<name_surname>/remote_repository/project.git`
- Go to `/s/<name_surname>/working_dir/project`
- Create file `base_feature.py`
- Add `base_feature.py` to staging area using `git add`
- Commit modification using `git commit`
- Run `git push origin master`, we will see later what it means

*Create local working directory*

- Create folder `/home/scrapbook/tutorial/<name_surname>` using `mkdir`
- Go to `/home/scrapbook/tutorial/<name_surname>`
- Initialize *git* folder using `git init`