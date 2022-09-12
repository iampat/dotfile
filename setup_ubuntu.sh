#!/bin/bash
set -e

rm -rf ./temp
mkdir temp
cd temp

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
     protobuf-compiler protobuf-c-compiler protoc-gen-go \
     build-essential \
     apt-transport-https curl gnupg \
     openssl libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
     libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev \
     libglib2.0-dev \
     gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
     libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
     zlib1g-dev libncurses5-dev libnss3-dev \
     docker.io \
     jq \
     openjdk-11-jdk

# https://github.com/serve-robotics/skel/wiki/Update-install-dependencies-for-Local-Bazel-Workstation-Setup
sudo apt install \
     libgirepository1.0-dev \
     libcairo2-dev \
     libjpeg-dev \
     libudev-dev \
     pkg-config

# post docker install https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd -f docker
sudo usermod -aG docker $USER

# Setup golang
mkdir -p /tmp/golang
mkdir -p /usr/local
export PATH=${PATH}:/usr/local/go/bin/
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz -P /tmp/golang
sudo tar -C /usr/local -xzf /tmp/golang/go1.19.1.linux-amd64.tar.gz

# insall jsonnet
go install github.com/google/go-jsonnet/cmd/jsonnet@latest

# install bazel
sudo npm install -g @bazel/bazelisk
go install github.com/bazelbuild/buildtools/buildifier@latest
go install github.com/bazelbuild/buildtools/buildozer@latest
go install github.com/bazelbuild/buildtools/unused_deps@latest

# install slack
snap install slack --classic 
# install vscode
snap install code --classic


# VPN tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --accept-routes

sudo apt upgrade
sudo apt autoremove

echo "Awesome, now it's time to  setup your python! just run ./setup_python.sh"
