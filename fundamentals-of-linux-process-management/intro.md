# Process management: introduction

Let's start with defining what a process is. <br>
Practically speaking, a **process** in Linux system is a program (or part of a program) in execution on the machine;
 we say also "part of" because a program might be composed of more than one single process (and it often is). The Linux operative system itself runs a lot of processes in background.
 <br>
 Let's have a look to them. Try to type
 ```bash
ps -aux
``` 
The ``ps`` command (ps stands for **P**rocess **S**tate) shows the status of the processes that the system is executing at the time you input the command.
The following string (``-aux``) is composed by the *flags* stacked together, and we'll see the details later. <br>
Now let's focus on the command output. You'll see something quite similar to
 ```bash
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  2.7  0.0  18240  3184 pts/0    Ss   22:42   0:00 bash
root        54  0.0  0.0  34424  2912 pts/0    R+   22:42   0:00 ps -aux
``` 
Here's the description of some of the fields, from left to right: <br>
* **USER**: the user who launched the process;
* **PID**: the identification number of the process;
* **%CPU** and **%MEM**: show, respectively, the percentage of processor and RAM memory used by the process;
* **STAT**: the current status of the process; it can assume many values, and in this example we showed **R**, 
which means running, and **S**, which indicates that the process is sleeping from more than 20 seconds.
  - sometimes a second character follows the first status letter (in this case we have a lowercase **s** and **+**);
  for the purpose of this course, we can ignore them.
 --- 
In this section you'll familiarize with processes: launching, monitoring and also stopping them. We'll provide you 
the basic tools to be aware at anytime of what is running on your machine and the power to decide what to do with it. <br>
Just remember that with great power comes great responsibility.


