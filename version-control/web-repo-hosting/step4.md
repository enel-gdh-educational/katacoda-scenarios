## Step 4 - Pull Requests
In this step:
* you'll modify the branch permission of your repository
* you'll create your first feature branch
* you'll create your first pull request
* you'll leave your first comment on a pull request
* you'll update a pull request
* you'll merge the pull request in the main code branch

##### Prerequisites
* You must have an Enel account and be able to access the Springlab environment.
* You must have a partner. (*Collaboration* is the key! :-))
* All this task must be executed with only one account. (let's say pair programming style!)

> configure git user in order to have the right username in the commits

* setting branch permission explanation
* creare feature branch
* push e creazione pull request da browser
* commento pull request
* update pull request
* merge through browser 

> dire che una volta completato bisogna fare il merge ma come informo gli altri se sto mergiando? Introdurre il prossimo passo delle pull requests.

##### Configure branch permission
As you saw in the last exercise of the previous step, applying a specific workflow like the feature branch one means that you have to limit some branch permission in order to avoid modifications to master and/or develop branches.

To setup your new remote correctly go to the repository page you created at step #1 in the [version_control_course](https://bitbucket.springlab.enel.com/projects/ITDSVER) project and click on *Repository Settings* button on the left pane.

![](./assets/repository_setting_button.png)

Then, go to branch permission and add a new branch permission for the **master** branch.

In order to enable the feature-branch workflow we must avoid changes directly into the master branch selecting the permission *"Prevent changes without a pull request"* and leaving the exception textbox field empty.

![](./assets/add_branch_permission.png)

