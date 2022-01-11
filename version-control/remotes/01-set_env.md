### Step 1 - Set environment

In this step we will initialize the environment required for following steps.
This will simulate a network where different actors collaborate.

In this network there will be *two types* of repositories: *bare* and *non-bare*.
**Bare** repos contain no copy of working source files but only the information for versioning. They are customarily given a *.git* extension

Being extremely simple, the network we will create will consist of:

- a remote repository containing only revision history
- a remote working directory containing revision history and copies of project files
- a local working directory containing revision history and copies of project files

We will see three ways of initializing a *git* repository:

- with `git init` command, which creates an empty Git repository. Running `git init` in an existing repository will create a `.git` folder and will not overwrite contents of the folder
- with `git init --bare`, which creates a bare repository.
- with `git clone <url to clone from> <directory name>` command, which creates a local copy of the repository at `<url to clone from>` which includes also version control history. `<directory name>` is optional

---

#### Task

- Move to your home directory with `cd ~`, and use `mkdir` to create the `repo/` folder.

*Create bare remote repository*

- Use `mkdir -p` to create directory `repo/remote_repository`, this will simulate the remote centralized repository
- Use `git init` with `--bare` option to initialize remote repository at location `repo/remote_repository/project.git`

*Create remote working directory*

- Use `mkdir` to create directory `repo/remote_working_dir`, this will simulate another user working on the same project
- Go to `repo/remote_working_dir`
- Initialize folder using `git clone ~/repo/remote_repository/project.git`
- Go to `repo/remote_working_dir/project`
- Create file `base_feature.py`
- Add `base_feature.py` to staging area using `git add`
- Commit modification using `git commit`
- Run `git push origin master`, we will see later what it means

*Create local working directory*

- Create folder `repo/local_working_dir` using `mkdir`
- Go to `repo/local_working_dir`
- Initialize *git* folder using `git init`
