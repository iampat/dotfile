#!/bin/bash
set -e

mkdir temp
cd temp
rm -rf *


# Python 2 & Python 3.8 + tool
mkdir -p ./install/deadsnakes
cd install/deadsnakes
rm -rf python3.8
git clone https://github.com/deadsnakes/python3.8.git
cd python3.8
git checkout ubuntu/bionic
./configure --enable-optimizations --with-lto
make profile-opt
make & make test & sudo make install # altinstall will cause some issues with skel

cd ../../

sudo apt install python3-pip
python3.8 -m pip install pre-commit
python3.8 -m pip install venv

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python2.7 python2.7-dev
