## Step 1 - Create new repository and initialize a project
In this step we will create a new repository in the **version_control_course** bitbucket project available [here](https://bitbucket.springlab.enel.com/projects/ITDSVER) 

##### Prerequisites
* You must have an Enel account and be able to access the Springlab environment.
* You must have the right permission level to create a new repository in the 
**version_control_course_project**
* You must have a partner. (*Collaboration* is the key! :-))
* All this task must be executed with only one account. (let's say pair programming style!)

##### Create new Repository
First of all we need a new remote repository. Such repository will host our awesome code.


Go to [version_control_course](https://bitbucket.springlab.enel.com/projects/ITDSVER) project on Springlab and create a new repository using the "Create Repository" button at top right corner.

![](./assets/create_new_repository_button.png)

The repository name must be the concatenation of yours surnames with "_" as delimiter.

> Surname1: Bianchi, Surname2: Rossi -> Repository name: Bianchi_Rossi

![](./assets/create_repo_name.png)

##### Create your local project 
Now it's time to write some code and begin your new project. This project will be host on the repository created at step before.

Create a new local folder called project:

```mkdir project```{{execute}}

create a file called *calculator.py* in the project folder.
```cd project && touch calculator.py```{{execute}}

modify the file and paste this content (don't worry about the wrong sum function, we will fix this in the next steps):

```python
class Calculator:
    def sum(a: int, b: int):
        return a - b
```

`./project/calculator.py`{{open}}

Now, initialize the local repository and add all files:

```git init```{{execute}}

```git add --all```{{execute}}

```git commit -m "First commit"```{{execute}}

This commit reside in your local repository for sure and now we are ready to *sync* your local repository to the remote repository created.

We'll use the `git remote add` command to do this.

Issue the command below 

```git remote add origin https://bitbucket.springlab.enel.com/scm/itdsver/<your repository name>.git```{{copy}}

substituting `<your repository name>` with the actual name of repository you created before.

> E.g.: Bianchi_Rossi is the name of repository, the command is `git remote add origin https://bitbucket.springlab.enel.com/scm/itdsver/Bianchi_Rossi.git`

With this command we've added a new origin and we can push on remote repository to sync our changes.

Let's check what happend under the hood with the `git remote -v`{{execute}} command.

The command's output should be:

```shell
$ git remote -v
origin  https://bitbucket.springlab.enel.com/scm/itdsver/<your repository name>.git (fetch)
origin  https://bitbucket.springlab.enel.com/scm/itdsver/<your repository name>.git (push)
```

`origin` is the name of the remote added. You can use which name you want but make sure you specify the right remote name when you use `git push` command.

Finally, we can push our changes to this new remote!

```git push -u origin master```{{execute}}

You must insert your username that corresponds to your Enel id with the first letter in uppercase. (*E.g. A459578*) and your Enel account password.

---
**Exercise 1**
See what happend on bitbucket repository after your first push through your browser.

---

**Exercise 2**
Try to rename the `origin` remote name to `enel` (then check with `git remote -v`) and make a new push to this remote. 

---

**Exercise 3**
Add a new function in `calculator.py` that execute the division between two number and push this new code.
