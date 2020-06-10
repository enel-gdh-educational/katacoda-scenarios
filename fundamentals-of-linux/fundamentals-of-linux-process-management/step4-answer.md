### Solution to exercise 1

First of all, execute the required command we showed:
```bash
pip2 install flask
``` 
Another pre-requisite is making *script4* an executable:
```bash
chmod +x script3
``` 
Then:
```bash
./script3
``` 
To find the IP address on which the launched process is listening, we use the only information we know: the port, 
which we said was **8087**.
```bash
netstat -na | grep 8087
``` 
The output:
```bash
tcp        0      0 127.0.0.1:8087          0.0.0.0:*               LISTEN
```
The IP address that you'll see associated with the port is 127.0.0.1, so the right answer is **number 1**.
<br>
If you chose *localhost*, maybe you didn't use the -n flag.

### Solution to exercise 2

There isn't a single way to pursue this task. One is to find via `ps` the process ID associated with the name of the executable.<br>
We told you in the hint that this name is *api_server.py*, so you can search for *api_server* and it should be ok 
(but feel free to use the complete name with also the extension).
```bash
ps -ef | grep api_server
```
but also
```bash
ps aux | grep api_server
```
Find its PID, then:
```bash
kill -9 <PID YOU FOUND>
```
Another cool method is using ``lsof`` command to display all listening processes. You can try it.
```bash
lsof | grep LISTEN
```
You should find in the list your process listening on port 8087. The second information in the lines is the PID. <br>
So you found it, and you can easily kill it with ``kill -9`` as previously showed.