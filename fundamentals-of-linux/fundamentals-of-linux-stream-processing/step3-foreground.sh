#!/bin/bash

while [ ! -f /opt/.backgroundfinished ] ; do 
    sleep 2;
    printf "." 
done; 

echo "Waiting for the step 3 configuration to complete. Please wait.."; 
echo "Done"
