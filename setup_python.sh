#!/bin/bash
set -e


cd /tmp


# Python 2 & Python 3.8 + tool
# https://www.linuxcapable.com/how-to-install-python-3-8-on-ubuntu-22-04-lts/

version=13
wget https://www.python.org/ftp/python/3.8.${version}/Python-3.8.${version}.tar.xz
tar -xf Python-3.8.${version}.tar.xz
sudo mv Python-3.8.${version} /opt/

sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
 
cd /opt/Python-3.8.${version}/
./configure --enable-optimizations --enable-shared --with-lto
make -j 6
sudo make altinstall # altinstall may cause some issues with skel, if so consider make install.
sudo ldconfig /opt/Python-3.8.${version}
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py
python3.8 get-pip.py
python3.8 -m pip install --upgrade pip
python3.8 -m pip install pre-commit

sudo apt update
sudo apt install python2.7 python2.7-dev

echo "Awesome, now you can setup gitbub by runninh ./setup_github"
