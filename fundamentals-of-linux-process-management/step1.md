## Launching and stopping executables

We can easily generate a new process by launching an executable.
An **executable** is a file that we can run to start a new program, therefore a new process. <br>
We have provided you a simple bash script to do so: ``script1``, here inside the home folder. Let's have a look to it. You can display it using `less` command. Here's what you'll see:
```bash
#!/bin/bash
while [ 1 ]
do
echo "stop me if you can"
done
```

This simple script runs a new process that executes an infinite loop, so it keep running unless some external intervention occurs. In this infinite loop,
it prints to the standard output (the screen) the message *stop me if you can*.
<br>
This script, for now, is nothing else but a text file. In order to make it an executable, we have to assign it the execution permissions:
```bash
chmod +x script1
```
In this way you can launch the script with the command:
```bash
./script1
```
Generally speaking, to launch an executable in linux using the terminal you have to type the path to the executable file (and of course the file itself at the end of the path).
In this case, since we are located in the folder where the script is, the relative path is just ``./``, which means “here”.
<br>
Have you executed the command? Then you should see printed endlessly on the screen *stop me if you can*. <br>
But can you really can? <br>
Yes, you can. Use control+c keys combination and surprise surprise the prints have stopped.

- script1
- chmod +x
- ./script1
- control + c
- script2
- chmod +x
- ./script2
- ./script2 > out.txt
- less out.txt (q)


---
**Exercise 1**

Check that ``emacs`` appears among of the installed package with a one-line command.

*Hint*: Pipe `dpkg` with one of the tools that you have learnt so far to filter the output.

---

However, if you try to launch emacs

```bash
emacs
``` 

you will get an error pointing out that emacs is looking for some libraries that are missing because the package in which
 they are included is not installed.

So, now you have two options: 

1. **Option 1** Look for the missing packages,
 find them, and install them one by one. Oh, I was forgetting, each missing package might have further unsatisfed dependencies!
 
2. **Option 2** You jump to the next step and discover a powerful tool that does the job for you.
 
 **N.B.** Before that , do not forget to clean up your system, by removing the unusable emacs package:
 
 ```bash
dpkg -r emacs
``` 

For the brave among you, I challange you taking the following pretty tough exercise:

---
**Exercise 2**

Determine the five installed packages with the largest size.

*Steps*: 
1. You already know how to list the installed packages with `dpkg -l` 
2. Pipe the output with `tail +<N>` where N is the number of heading lines you want to skip.
3. Select a single columns of an output stream through `awk '{print $<column_number>}'`
4. Make them become the input of a new command adding the pipe `| xargs`
5. Run the command you've built so far and understand the output
6. Now add the flag `-exec` to `xargs` to execute a command to the list of inputs you have created.
7. This command will be `dpkg-query` to show information about the packages. 
Use the flags `-f ''${Package} ${Installed-Size}\n' -W` to show only the relevant information
8. Now sort the results on the values of the size field using `sort`. No hints for this!
---