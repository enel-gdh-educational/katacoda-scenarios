#!/usr/bin/env bash

bash step1.sh
bash step2.sh
bash step3.sh

echo "Some additional info" >> README.md

echo "print('Hello world')" > hello_world.py

git add README.md hello_world.py

git commit -m "README modified. hello_world added."

git gc

clear
