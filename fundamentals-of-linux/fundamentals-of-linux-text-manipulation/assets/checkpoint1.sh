#!/bin/bash

### CHECKPOINT 1 (3 files for each section) ###
rm -f *.txt;

wget --no-check-certificate https://raw.githubusercontent.com/zioproto/hadoop-swift-tutorial/master/dcu.txt -O divina_commedia.txt;

sed -n 3,4899p divina_commedia.txt > inferno.txt;

sed -n 4900,9828p divina_commedia.txt > purgatorio.txt;

sed -n 9829,14753p divina_commedia.txt > paradiso.txt;
