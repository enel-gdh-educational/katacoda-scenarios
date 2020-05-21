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
(To exit the script view, just type ``q``).<br><br>
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
Yes, you can. Use **control+c** keys combination and surprise surprise the prints have stopped.

## Standard output (stdout) and output redirecting

In the home folder you can find a second script: ``script2``. It looks similar to the first one (you can show the content via ``less`` command)
 but there's a difference: the loop executes now a finite number of steps. <br>
Make the script an executable and execute it as we've done for script1.
<br> <br>
The text shown by the full execution appears like this:

```bash
printing line 0
printing line 1
printing line 2
printing line 3
printing line 4
printing line 5
printing line 6
printing line 7
printing line 8
printing line 9
```
Now, this output exists only inside the terminal, therefore it's volatile. <br>
Can we make the process writing on a file, so that we can store its logs for a later access? <br>
The answer is yes, and to do so we can use the **output redirecting**. Launch the process again in this way:

```bash
./script2 > output.txt
```
When the execution is over, you can find a new file called ``output.txt`` inside the folder. If you show its content (using ``less`` command),
you'll fine the same lines were previously printed on the screen. <br>
So you have succesfully redirected the output from the standard output (the screen) to a selected file (output.txt).


---
**Exercise 1**

TODO

---


---
**Exercise 2**

TODO
 
---