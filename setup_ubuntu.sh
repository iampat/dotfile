#!/bin/bash
set -e

rm -rf ./temp
mkdir temp
cd temp

sudo apt-get update

# dev-tools
# sudo apt install clang-11 lld-11 llvm-11 clang-format-11 clang-tidy-11 clang-tools-11 \
sudo apt install \
     git gh \
     emacs xclip tmux \
     npm \
     protobuf-compiler protobuf-c-compiler protoc-gen-go \
     build-essential \
     apt-transport-https curl gnupg \
     openssl libssl-dev \
     jq \
     cmake

sudo apt install pkg-config

# Setup golang

# insall jsonnet

# install bazel
sudo npm install -g @bazel/bazelisk
go install github.com/bazelbuild/buildtools/buildifier@latest
go install github.com/bazelbuild/buildtools/buildozer@latest
go install github.com/bazelbuild/buildtools/unused_deps@latest

# VPN tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --accept-routes

sudo apt upgrade
sudo apt autoremove
