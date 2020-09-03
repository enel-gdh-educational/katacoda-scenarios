#### Version control, why?

You have faced the following situation dozens or hundred of times: you are working on a file, a document, a code,
 a simple text, or a presentation. Let us assume the file is:
 
---

`sample_file.txt`

---
  
and you send a version to a collaborator who will contribute revising and editing the file. Let us say you are Alice and your colleague is Bob.
You keep on working on the file, so does Bob: the two stories of the file saved on Alice's and Bob's computers diverge and we will call them:

---

`sample_file_Alice.txt` and `sample_file_Bob.txt`

---


Two days later, your boss asks to present the final version of the file, so Bob sends you `sample_file_Bob.txt` and you start assembling
 the final "good" version by merging the two. you do good (and tedious) job and you come out with
 
---

`sample_file_final.txt`

---
 
, which you send by email to those who will attend the presentation. Your boss is happy about the presentation, nevertheless asked to clarify some slides.
 Your colleague offers to do that. Easy enough, you might think!
  Well, it turns out that by mistake, he applies the changes to `sample_file_Bob.txt` and sends you a version called:
  
---

`sample_file_final_Bob_updates.txt`

---

After a while, you realize Bob's mistake, and you try to amend it. So you work on merging `sample_file_final_Bob_updates.txt`
 and `sample_file_final.txt` and, after 1 hour, you come out with
 
---

`sample_file_final_final.txt`

---

and circulate it to the others. Someone who has not followed the thread of email asks to include some additional super important changes,
doe the job for you and sends you a version that is

---

`sample_file_final_final_v2.txt`

---

You are not happy with this, because they have accidentally screwed up the structure of few slides.
 So you work on it, and you get to version

---

`sample_file_this_time_really_final.txt`

---

you send it out, and get ready for the new presentation. The people in the audience have had trouble following the file email exchanges
 and open many different versions of the file on their screen, so they start pointing out the inconsistencies,
  thus getting you frustrated. 

Well, you manage somehow to conclude your presentation and promise to send the "right final" version out to everyone.
 Of course, you take the chance to fix a couple of slides so you come out with a new version out under the name
 
---

`sample_file_for_f***_sake_final_even_though_no_one_cares.txt`

---
 
And of course, for reasons probably related to the phases of the moon, when you send it out, you include the wrong attachement :(

Try to imagine the same story with many more collaborators, projects with more than one file, or, even worse,
 critical files whose changes could break an application. Well, software development has all these characteristics.

------------------------
**Discuss with your tutor**

What are possible ways to mitigate version divergence and keep track of the intermediate versions of a file or a project?

Discuss the advantages of:

- Avoiding email exchanges, rather using OneDrive or Sharepoint
- Use the cloud version of Office 365
- Use Microsoft's Teams online file editing
- use the revision control embedded in Word

-------------------------


#### What is git:

The previous story calls for the need of a "version control system", since controlling the versions of the file in a
 strict, reliable, and complete way is exactly what we need.
 
As discussed earlier, many softwares are endowed with some sort of revision control and keep track of the history of a file. 

However, a modern version control systems allows you to:

- take snapshot of the files of a projects when you ask it to (revisions or commits) and store them into a so-called repository;
- track any changes of the project with respect to the last commit;
- enable the collaboration between different contributors by providing tools to merge changes and reconcile diverging versions; 
- let you syncronize you local project with another repository over the network, say taking the last changes done by someone else
 or publishing your changes;
- revert to a previous version. Think, for instance, when you introduce a change that breaks the code...oups!
- tell you who has modified what part of the project.
- ...and much more 

Git is a version control system, out of many others.


#### Why git
##### and not other version control systems

Git has overwhelmed all other version control systems int terms of usage prevalence (>90% as of 2020). 

One of the reasons is because git is a decentralized repository, that is, there is no main authoritative data store on a server,
 which collects the "official" versions. Git gives each developer a local copy of the full development history, which increase safety and redundance.
Changes are copied from one such repository to another. Even tough this may seem counterintuitive at first,
 understanding decentralization is key to use git effectively.

Many other systems are centralized (e.g. CVS, Apache SVN), meaning that they oblige you to connect to a server to push and store your changes.
 Also they give you less freedom to let your local version of the project diverge from the central one.
  
Instead, git allows you to diverge from any other copy of the repository, track your development locally,
 and decide when you want to reconcile your development with any other copy of the repository. 
It also provides very strong automatic merging capabilities, minimizing the need of manual interventions (version conflicts). 

Moreover, the operations of saving new project snapshots as well as applying the changes coming from another copy of the repository
 are very fast, often requiring unnoticeable time even for large projects.

To have fun, as a note on how Git compares to other VCS, one of its development principle reads:

- Take Concurrent Versions System (CVS) as an example of what not to do; if in doubt, make the exact opposite decision.

####Git is not Github! 
##### nor Bitbucket or any other web code hosting service or graphical interface.

Remember, git is a decentralized version control system, that is, there is no principal copy of the repository! 
The repo on your computer has the same importance as the repos on your peers' laptops as well as that saved on a company server.

Despite there are good reasons why it is so, in real-world collaborative software development, it is useful to have a copy of the repository that is conceptually the main one.
For instance, that repository that will be the one officially published, say to install the code, or that one clones to start working on the project. 

Services like Github and Bitbucket provide a code hosting service with a browser interface that allows developers
 to visually inspect and browse the repository together with its history.
They also provide reliable backup, issue trackers, enable interactions among developers,
 and can be coupled with other project management tools (Trello, Jira, etc..). 
The repository hosted by one such web service acts as the main repository.
 
Let us stress that git is (uniquely!) a command line tool that allows you to track changes in your software projects. 
Nevertheless, since for some users it is easier to interact with a graphical interface, 
there is a wealth of graphical clients available to work with git repositories.
Also the main IDEs, (e.g. IntelliJ, VisualStudio) allow users to perform the main git operations from their interface.
We will explore demonstrate some of these tools.


#### A historical note 
why is git so special, in a good or bad way?
Git has been developed primarily by Linus Torvalds, the same author of Linux. Some of the consequences are:

- its name is a reference to his author: git = "unpleasent person", which is how Linus Torvalds appears.
- it is (incredibly) solid: to break a repo sitory requires a strong commitment.
- it is not easy to use by default and it is not meant to be.
- it becomes easy if you understand the underlying principles, i.e. it is consistent and has no free complications. 
- if you overcome the initial barrier, chances are high that you will fall in love. 

Linus Torvalds has decided only twice to embark in a new project, since only twice he believed
 that he would change the world of software.

#### In this scenario we are going to learn:

- how to let git track files, namely, how to initiate a repository and include files in it
- how to save snapshots of the files as they naturally evolve, that is, make commits
- how to inspect and browse the history of a repository, that is, jump between commits
- how to start working on an existing repository


