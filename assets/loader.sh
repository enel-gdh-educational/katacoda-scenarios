#!/usr/bin/env bash
apt install subversion -y
svn checkout https://github.com/agdiiura/enel-mongodb-data/trunk/ .

pip3 install pymongo
# python3 loader.py
