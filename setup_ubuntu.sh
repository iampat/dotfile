#!/bin/bash
mkdir temp
cd temp
rm -rf *

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get update

# git
sudo apt install git

# Python
sudo apt install openssl libssl-dev
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo apt install libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev
sudo apt install libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev

mkdir -p ./install/deadsnakes
cd install/deadsnakes
git clone https://github.com/deadsnakes/python3.7.git
cd python3.7
git checkout ubuntu/focal
./configure --enable-optimizations --with-lto
make profile-opt
make
make test
sudo make altinstall
cd ../../

# Bazel need python 2
sudo apt install python2 python2-dev

sudo apt install python3-pip
python3.7 -m pip install pre-commit


# Clang 11
sudo apt install clang-11 lld-11 llvm-11
sudo apt install clang-format-11 clang-tidy-11 clang-tools-11
 
# protobuf
sudo apt install protobuf-compiler protobuf-c-compiler

sudo apt install emacs xclip tmux

sudo apt install docker.io 

# post docker install https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER


mkdir google-cloud-sdk
cd google-cloud-sdk
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-374.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-sdk-374.0.0-linux-x86_64.tar.gz
sh ./google-cloud-sdk/install.sh

cd ../..
 
# install bazel
sudo apt install apt-transport-https curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
# we are using bazel 4.0.0 https://docs.bazel.build/versions/main/install-ubuntu.html
sudo apt update && sudo apt install bazel-4.0.0
sudo ln -s /usr/bin/bazel-4.0.0 /usr/bin/bazel
 
# # install slack
sudo snap install slack --classic 
install vs code https://code.visualstudio.com/docs/setup/linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

 
# git command line 
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# # sudo apt install hibernate pm-utils 

# sudo apt upgrade
# sudo apt autoremove

