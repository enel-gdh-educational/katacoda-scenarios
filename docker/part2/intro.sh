#!/bin/bash
echo "Preparing environment..."
docker rmi -f $(docker images -a -q)
echo "Done. Enjoy your course."