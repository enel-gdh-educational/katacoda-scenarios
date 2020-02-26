#### A)
```
sort -nr inferno_words.txt > inferno_sorted.txt
sort -nr paradiso_words.txt > paradiso_sorted.txt
```
#### B)

```
head -10 inferno_sorted.txt
head -10 paradiso_sorted.txt
```
#### C)
```
join -1 2 -2 2 <(sort -k 2 inf_sorted.txt) <(sort -k 2 par_sorted.txt) | sort -nr -k 3 > joined.txt
```
#### D)
```
awk 'BEGIN {FS=" "} {print ($2-$3)/($2+$3)} END {}' joined.txt > paradisiac_score.txt
```
#### E)
```
paste 
```

**NB:**

You could achieve the same results of commands D+E with a slight modification of the awk command:

```
awk 'BEGIN {FS=" "} {print $1; $2; $3; ($2-$3)/($2+$3)} END {}' joined.txt > paradisiac_score.txt
```

#### F)

```
sort paradisiac_score.txt -k4 -nr > paradisiac_sorted.txt
```

```
head -10 paradisiac_sorted.txt 
```

```
tail -10 paradisiac_sorted.txt 
```