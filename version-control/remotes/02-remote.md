### Step 2 - Git Remote - set url of remote folder

**Remote repositories** are **centralized stores** for code (such as GitHub or Bitbucket).
They allow to share changes from or to your repository.

Most common *git* transfer protocols are `https://` protocol, `git://` or `user@server:path/to/repo.git` which use SSH protocol       

Remotes are **added** using command `git remote add <a friendly name> <the remote location>`.
Typically the friendly name is *origin* and the remote location is a HTTPS URL or a SSH connection.
The friendly name allows you to refer to the location in other commands without specifying the whole URL

If local repository is created using `git clone`, location from which repository is **cloned** will be automatically added as a remote with default name 'origin'.

Once set, some operations on **remotes** are:

- **update url**, using `git remote set-url <a friendly name> <new remote location>`
- **rename the remote**, changing remotes friendly names using `git remote rename <friendly name> <new friendly name>`.
`git remote rename` changes all remote-tracking branch names also
- **remove a remote**, either using `git remote remove <friendly name>` or `git remote rm <friendly name>`.
    Once the reference to a remote is deleted, all remote-tracking branches and configuration settings associated with that remote are also deleted
- **list remotes** configured, runnig the `git remote` command to see the **names** or using option `-v` which shows the URLs stored for the friendly name
- **see more information** about a remote, we can use `git remote show <remote name>` command, which lists the *URL* for the remote repository as well as the tracking branch information  

---

##### *Remote tracking branches*

Remote-tracking branches are **local references** to the state of remote branches.

They represent remote branch as they were last time you connected to them.

Remote-tracking branch names take the **form** `<remote>/<branch name>`

If remote branch is modified but local reference is not updated, remote and remote-tracking **diverge**

To create a ***tracking branch*** having a **direct relationship** to the remote branch we can:

- **Checkout** a local branch **from a remote-tracking** branch. This can be done using `git checkout -b <branch> <remote>/<branch>` or `git checkout --track <remote>/<branch>` shorthand.

- **Set upstream** of a local existing branch. This can be done using `git branch -u <remote>/<branch>` or `git branch --set-upstream-to <remote>/<branch>`

Git automatically knows which server to fetch from and which branch to merge in when pulling from a tracking branch.

---

#### Task

The remote repository location of this scenario is `repo/remote_repository/project.git`.
- Go to `repo/local_working_dir`.
- Set this remote location with the name *origin* using `git remote add`.
- Run `git remote -v` to see the remote you have set
- Change remote friendly name from *origin* to *root*
- Run `git remote show <remote name>` to see information on *origin* remote you have set
- Change again remote friendly name from *root* to *origin*
