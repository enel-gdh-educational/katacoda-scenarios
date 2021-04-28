#!/bin/bash

OUTPUT_FILE="data/ping.log"
MAX_RUN=5 #00
LOG_LENGTH=1000


ADDRESS_NUM=$(wc -l data/ip_addresses.txt | awk '{ print $1 }')

echo "Reading #lines=$ADDRESS_NUM."

for i in $(seq 1 $MAX_RUN); do
   echo "trucating log file..."
  > $OUTPUT_FILE
  for j in $(seq 1 $LOG_LENGTH); do
    # choose a random address from list of addresses:
    SED_ADDR="$((1 + RANDOM % ADDRESS_NUM))"
    #printf "Generating sed address #=%d.\n" $SED_ADDR
    IP_ADDRESS=`sed -n $(printf "%sp" "$SED_ADDR") data/ip_addresses.txt` 
    #printf "Using ip_address = %s, with index=%d.\n" "$IP_ADDRESS" $SED_ADDR
    #printf "Using ip_address = %s\n" "$IP_ADDRESS" >> $OUTPUT_FILE
    printf "64 bytes from %s: icmp_seq=%d ttl=64 time=%0.4f ms\n" "$IP_ADDRESS" $j $(awk -v min=0.001 -v max=0.08 'BEGIN{srand(); printf("%.4f\n",min+rand()*(max-min))}') >> $OUTPUT_FILE
    sleep 0.5
  done  
done
