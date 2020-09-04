## Step 3 - Git Workflow
In this step:
* you'll learn what's a git workflow is
* you'll focus on **feature branch** workflow
* you'll create your first feature branch

##### Prerequisites
* You must have an Enel account and be able to access the Springlab environment.

##### Git Workflow

You are part of a big team and all developers are working on the same project on a remote repository. To be productive and efficient you must use Git in the proper way. 

Git Workflow is a recipe for how to use Git to accomplish work in a consistent and productive manner. 
Suppose you are working on a Calculator project and you must modify the `calculator.py` file for adding a new feature or fixing a bug.

Without a clear workflow you'll made your modification on your local repository and then you'll sync your local change on the remote master branch.

This approach have many disadvantages:

* `calculator.py` contains core functionalities and your modifications could contains errors and bugs. Therefore, master branch could not contain a working code version and you are not working in a **consistent** and **productive** way
* You are not working in a **collaborative** way because the other developes doesn't know what changes you done before changing the master branch.
* The probability of unhandled conflicts increase.

To avoid this situation you must follow a specific workflow that helps you using Git in order to avoid situations like the one described above.

One of the most git workflow used in project developlment is the **Feature Branch** git workflow.

