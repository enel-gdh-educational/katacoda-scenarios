## Step 1 - Create new repository and initialize a project
In this step we will create a new repository in the **version_control_course** bitbucket project available [here](https://bitbucket.springlab.enel.com/projects/ITDSVER) 

##### Prerequisites
* You must have an Enel account and be able to access the Springlab environment.
* You must have the right permission level to create a new repository in the 
**version_control_course_project**
* You must have a partner. (*Collaboration* is the key! :-))

##### Create new Repository
First of all we need a new remote repository. Such repository will host our awesome code.


Go to [version_control_course](https://bitbucket.springlab.enel.com/projects/ITDSVER) project on Springlab and create a new repository using the "Create Repository" button at top right corner.

![](./assets/create_new_repository_button.png)

The repository name must be the concatenation of yours surname with "_" as delimiter

> Surname1: Bianchi, Surname2: Rossi -> Repository name: Bianchi_Rossi

##### Create your local project 
Now it's time to write some code and begin your new project. This project will be host on the repository created at step before.

Create a new local folder called project:

```mkdir project```{{execute}}

create a file called *sum.py* in the project folder.
```cd project && touch sum.py```{{execute}}

modify the file and paste this content (don't worry about the wrong sum function):

```python
class Calculator:
    def sum(a: int, b: int):
        return a - b
```

`./project/sum.py`{{open}}

Now, initialize the local repository and add all files:

```git init```{{execute}}

```git add --all```{{execute}}

```git commit -m "First commit"```{{execute}}






