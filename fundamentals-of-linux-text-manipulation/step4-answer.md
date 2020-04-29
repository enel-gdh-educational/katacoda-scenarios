#### A)

```
tr  ' ' '\n' < input.txt | tr '[:punct:]' '\n' > output.txt
```

#### B)


```
grep -v '.....' input.txt > output.txt
```

#### D)

```
sort input.txt | uniq -c > output.txt
```