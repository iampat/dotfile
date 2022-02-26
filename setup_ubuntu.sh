#!/bin/bash

cd temp
rm -rf *

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get update

# git
sudo apt install git

# Python
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt install python3.7 python3.7-distutils python3.7-dev 
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

# Bazel need python 2
sudo apt install python2 python2-dev

sudo apt install python3-pip
python3 -m pip install pre-commit


# Clang 11
sudo apt install clang-11 lld-11 llvm-11
sudo apt install clang-format-11 clang-tidy-11 clang-tools-11

# protobuf
sudo apt install protobuf protobuf-compiler

sudo apt install emacs xclip tmux openvpn 

# docker https://docs.docker.com/engine/install/ubuntu/
# sudo apt remove --purge docker docker-engine docker.io containerd runc
# sudo apt-get install ca-certificates curl gnupg lsb-release

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo apt update
# sudo apt install docker-ce docker-ce-cli containerd.io
sudo apt install docker.io

# # post docker install https://docs.docker.com/engine/install/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER

# google cloud sdk https://cloud.google.com/sdk/docs/install#deb
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update
sudo apt-get install google-cloud-sdk

# install bazel
sudo apt install apt-transport-https curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
# we are using bazel 4.0.0 https://docs.bazel.build/versions/main/install-ubuntu.html
sudo apt update && sudo apt install bazel-4.0.0
sudo ln -s /usr/bin/bazel-4.0.0 /usr/bin/bazel

# install slack
sudo snap install slack --classic

# install vs code https://code.visualstudio.com/docs/setup/linux
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

# sudo apt install hibernate pm-utils 


sudo apt upgrade
sudo apt autoremove

