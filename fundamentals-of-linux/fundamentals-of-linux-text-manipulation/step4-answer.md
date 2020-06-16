#### A)

```
tr  ' ' '\n' < inferno.txt  > inferno_temp1.txt
```

```
tr  '\r' '\n' < inferno_temp1.txt  > inferno_temp2.txt
```

```
tr '[:punct:]' '\n' < inferno_temp2.txt > inferno_temp3.txt
```

#### B)

```
tr  "[:lower:]" "[:upper:]" < inferno_temp3.txt  > inferno_temp4.txt
```

#### C)

```
grep '.....' inferno_temp4.txt > inferno_temp5.txt
```

#### D)

```
sort inferno_temp5.txt > inferno_temp6.txt
```

#### E)

```
sort inferno_temp6.txt | uniq -c > inferno_temp7.txt
```

```
cat inferno.txt | tr ' ' '\n' | tr  '\r' '\n'  | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > inferno_table.txt
```

```
cat purgatorio.txt | tr ' ' '\n' |  tr  '\r' '\n'  | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > purgatorio_table.txt
```

```
cat paradiso.txt | tr ' ' '\n' | tr  '\r' '\n'  | tr [:punct:] '\n' | tr [:upper:] [:lower:] | grep '.....' | sort | uniq -c > paradiso_table.txt
```
