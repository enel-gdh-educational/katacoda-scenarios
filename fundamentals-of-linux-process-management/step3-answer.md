Solution to exercise 1
```bash
nohup ./script1 &
``` 
then
```bash
ps -ef | grep script1
``` 
You select the pid **\<PROCESS PID>** (which is not fixed) of the process.
Then
```bash
kill -9 <PROCESS PID>
``` 

Solution to exercise 2 (hard)

```bash
dpkg -l | tail +6 | awk '{print $2}' | xargs -exec dpkg-query -f '${Package} ${Installed-Size}\n' -W | sort -k 2 -n -r | head -5
```
