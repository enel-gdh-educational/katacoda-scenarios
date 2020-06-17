#### A)

```
grep INFERNO divina_commedia.txt -n 
grep PURGATORIO divina_commedia.txt -n 
grep PARADISO divina_commedia.txt -n  
```



#### B)

```
head -n 4899 divina_commedia.txt > inferno.txt
sed -n 4899,9828p divina_commedia.txt > purgatorio.txt
tail -n +9829 divina_commedia.txt > paradiso.txt
```

#### C)

```
wc -l inferno.txt > word_count.txt
```

```
wc -l purgatorio.txt >> word_count.txt
```

```
wc -l paradiso.txt >> word_count.txt
```
