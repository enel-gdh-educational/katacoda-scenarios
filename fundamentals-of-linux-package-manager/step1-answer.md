Solution to exercise 1
```bash
dpkg -l | grep vim
``` 


Solution to exercise 2 (hard)

```bash
dpkg -l | tail +6 | awk '{print $2}' | xargs -exec dpkg-query -f '${Package} ${Installed-Size}\n' -W | sort -k 2 -n -r | head -1
```
