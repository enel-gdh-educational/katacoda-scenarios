#### A)

```
tr  ' ' '\n' < inferno.txt | tr '[:punct:]' '\n' > inferno_temp1.txt
```

#### B)

```
tr  "[:lower:]" "[:upper:]" < inferno_temp1.txt  > inferno_temp2.txt
```

#### C)

```
grep '.....' inferno_temp2.txt > inferno_temp3.txt
```

#### D)

```
sort inferno_temp3.txt > inferno_temp4.txt
```

#### E)

```
sort inferno_temp4.txt | uniq -c > inferno_table.txt
```

```
cat inferno.txt | tr ' ' '\n' | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > inferno_final.txt
```

```
cat purgatorio.txt | tr ' ' '\n' | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > purgatorio_final.txt
```

```
cat paradiso.txt | tr ' ' '\n' | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > paradiso_final.txt
```
