#!/bin/bash
echo "Preparing environment..."
docker rmi -f $(docker images -a -q)
clear