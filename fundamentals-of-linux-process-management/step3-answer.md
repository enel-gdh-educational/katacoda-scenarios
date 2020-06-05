### Solution to exercise 1

Make sure your *script1* is an executable. If it is, run it:
```bash
nohup ./script1 &
``` 
then
```bash
ps -ef | grep script1
``` 
You select the pid **PROCESS PID** (which is not fixed) of the process.
Then
```bash
kill -9 <PROCESS PID>
``` 

