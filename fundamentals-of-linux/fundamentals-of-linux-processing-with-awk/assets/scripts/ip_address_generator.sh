#!/bin/bash

OUTPUT_FILE="data/ip_addresses.txt"
# truncating output file before writing into it.
> $OUTPUT_FILE

ADDRESS_NUM=10
if [ $# -eq 0 ]; then
    printf "No arguments supplied. Using default = %d.\n" "$ADDRESS_NUM"
else
    ADDRESS_NUM=$1
    printf "Using value = %d.\n" "$ADDRESS_NUM" 
fi

echo "Generating $ADDRESS_NUM ip addresses into file '$OUTPUT_FILE'."

for i in $(seq 1 $ADDRESS_NUM); do 
	printf "%d.%d.%d.%d\n" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" >> $OUTPUT_FILE
	#sleep 1
done