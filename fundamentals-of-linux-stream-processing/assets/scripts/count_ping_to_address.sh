#!/bin/bash

OUTPUT_FILE="data/word_count.csv"

if [ $# -eq 0 ]; then
    printf "No arguments supplied. Using default output file = %s.\n" "$OUTPUT_FILE"
else
    OUTPUT_FILE=$1
    printf "Using default output file = %s.\n" "$OUTPUT_FILE" 
fi

# COUNT THE NUMBER OF DIFFERENT ADDRESSES:
COUNT=$(cat data/ip_addresses.txt | wc -l)

SEPARATOR=";"

# writing the header of the CSV file. NOTE: file is truncated at this step
printf "address%scount\n" "$SEPARATOR"> $OUTPUT_FILE

# FOR EACH OF THE ADDRESSES, COUNT THE NUMBER OF OCCURRENCES:
for i in $(seq 1 $COUNT); do
  ADDRESS=`sed -n $(printf "%dp" $i) data/ip_addresses.txt`
  #printf "picked address=%s\n" "$ADDRESS"
  WC=`sed -n "/$ADDRESS/p" data/ip_address_output.log | wc -l`
  printf "Address %s selected %d times.\n" "$ADDRESS" $WC
  printf "\"%s\"%s%d\n" "$ADDRESS" "$SEPARATOR" $WC | tr -d ' ' >> $OUTPUT_FILE
done
