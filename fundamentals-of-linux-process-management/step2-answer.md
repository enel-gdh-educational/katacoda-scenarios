### Solution to exercise 1
```bash
./script2 >> output_twice.txt | ./script2 >> output_twice.txt
``` 
The correct answer is **number 2**: the outputs of the two executions are mixed up.<br>
Why? Because when we concatenate two commands with `|`, we are telling the system to launch two processes one after the other, not to wait that
the first ends before launching the second. So the second execution of *script2* starts when the first is still running, and
since they are writing on the same output file we see the them writing lines in it at the same time.

### Solution to exercise 2
1 -
```bash
less text.txt | wc -l
```
Number it should display: **53**.

2 - 
```bash
grep -c Jude text.txt
```
Number it should display: **30**. <br>
Yes, apparently the Beatles call Jude thirty times in Hey Jude lyrics.