----------

#### Launching executables

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