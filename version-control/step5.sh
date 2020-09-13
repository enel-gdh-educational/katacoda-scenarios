#!/usr/bin/env bash

bash step1.sh
bash step2.sh
bash step3.sh
bash step4.sh

mkdir src
git mv hello_world.py src
git mv README.md readme.md

git commit -m "Some renaming and file repositioning"

clear
