#!/bin/bash
set -e

mkdir temp
cd temp
rm -rf *

sudo apt-get update

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# dev-tools
sudo apt install \
     git gh \
     emacs xclip tmux \
     npm \
     clang-11 lld-11 llvm-11 clang-format-11 clang-tidy-11 clang-tools-11 \
     golang-1.18 \
     protobuf-compiler protobuf-c-compiler protoc-gen-go \
     build-essential \
     apt-transport-https curl gnupg \
     openssl libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
     libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev \
     libglib2.0-dev \
     gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
     libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
     zlib1g-dev libncurses5-dev libnss3-dev \
     docker.io

# post docker install https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
 
# install bazel
sudo npm install -g @bazel/bazelisk

# # install slack
snap install slack --classic 
# vscode
snap install code --classic

# Google Cloud SDK and CLI
snap install google-cloud-sdk --classic
snap install google-cloud-cli --classic

# VPN tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --accept-routes

sudo apt upgrade
sudo apt autoremove
