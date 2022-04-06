#!/bin/bash
set -e

# it is important to follow steps in
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

# pre install
sudo apt-get install linux-headers-$(uname -r)

# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
# sudo ubuntu-drivers autoinstall
sudo ubuntu-drivers install nvidia-driver-510


# from https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get install \
     cuda-11-1 \
     cuda-nvcc-11-1 libnpp-11-1 libnpp-dev-11-1 \
     libnvinfer8 libnvinfer-dev \
     libnvinfer-plugin8 libnvinfer-plugin-dev \
     libnvparsers8 libnvparsers-dev \
     libcurand-dev-11-1
# 

# Tensor RT
# https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#downloading

