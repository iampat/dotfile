#!/bin/bash
set -e

rm -rf temp 
mkdir temp
cd temp


# Python 2 & Python 3.8 + tool
mkdir -p ./install/deadsnakes
cd install/deadsnakes
rm -rf python3.8
git clone https://github.com/deadsnakes/python3.8.git
cd python3.8
git checkout ubuntu/bionic
./configure --enable-optimizations --with-lto
make profile-opt
 make
# make test

sudo make install # altinstall will cause some issues with skel

cd ../../

sudo apt install python3-pip
python3.8 -m pip install pre-commit

sudo apt update
sudo apt install python2.7 python2.7-dev

echo "Awesome, now you can setup gitbub by runninh ./setup_github"
