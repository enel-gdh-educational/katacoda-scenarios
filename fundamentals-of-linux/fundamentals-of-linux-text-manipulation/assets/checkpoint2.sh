#!/bin/bash

### CHECKPOINT 2 (3 tokenized words files) ###
rm -f *.txt;

wget --no-check-certificate https://raw.githubusercontent.com/zioproto/hadoop-swift-tutorial/master/dcu.txt -O divina_commedia.txt;

sed -n 3,4899p divina_commedia.txt > inferno.txt;

sed -n 4900,9828p divina_commedia.txt > purgatorio.txt;

sed -n 9829,14753p divina_commedia.txt > paradiso.txt;

cat inferno.txt | tr '[:punct:]' ' ' | tr '[:space:]' ' ' | tr -s ' ' | tr ' ' '\n' | tr '[:upper:]' '[:lower:]' | grep -E ".{5,}" | sort | uniq -c > inferno_words.txt;

cat purgatorio.txt | tr '[:punct:]' ' ' | tr '[:space:]' ' ' | tr -s ' ' | tr ' ' '\n' | tr '[:upper:]' '[:lower:]' | grep -E ".{5,}" | sort | uniq -c > purgatorio_words.txt;

cat paradiso.txt | tr '[:punct:]' ' ' | tr '[:space:]' ' ' | tr -s ' ' | tr ' ' '\n' | tr '[:upper:]' '[:lower:]' | grep -E ".{5,}" | sort | uniq -c > paradiso_words.txt; 
