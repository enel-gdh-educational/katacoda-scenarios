#### A)
```
sort -nr inferno_table.txt > inferno_sorted.txt
sort -nr paradiso_table.txt > paradiso_sorted.txt
```
#### B)

```
head -10 inferno_sorted.txt
head -10 paradiso_sorted.txt
```
#### C)
```
join -1 2 -2 2 <(sort -k 2 inferno_sorted.txt) <(sort -k 2 paradiso_sorted.txt) | sort -nr -k 3 > table.txt
```
#### D)
```
awk -F " "  '{print ($3-$2)/($2+$3)}'  table.txt > score.txt
```
#### E)
```
paste joined.txt score.txt > paradisiac_table.txt
```

**NB:**

You could achieve the same results of commands D+E with a slight modification of the awk command:

```
awk -F " "  '{print $1, $2, $3, ($3-$2)/($2+$3)} ' table.txt > paradisiac_table.txt
```

#### F)

```
sort paradisiac_table.txt -k4 -nr > paradisiac_sorted.txt
```

```
head -10 paradisiac_sorted.txt 
```

```
tail -10 paradisiac_sorted.txt 
```