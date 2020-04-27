#### A)

```
head -n 4899 divina_commedia.txt > section_inferno.txt
sed -n 4899,9828p divina_commedia.txt > section_purgatorio.txt
tail -n +9829 divina_commedia.txt > section_paradiso.txt
```

#### B)

```
wc -l section_*
```
