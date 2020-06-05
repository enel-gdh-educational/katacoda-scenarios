Solution to exercise 1

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

Solution to exercise 2 (hard)

```bash
dpkg -l | tail +6 | awk '{print $2}' | xargs -exec dpkg-query -f '${Package} ${Installed-Size}\n' -W | sort -k 2 -n -r | head -5
```
