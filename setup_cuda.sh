#!/bin/bash
set -e

# it is important to follow steps in
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

# pre install
sudo apt-get install linux-headers-$(uname -r)

# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
# Consider sudo apt autoremove to make sure old default driver has been removed.
# sudo ubuntu-drivers install nvidia-driver-510


# from https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network

mkdir -p /tmp/cuda
cd /tmp/cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda

sudo apt-get update

CUDA_VERSION=11-7
sudo apt-get install \
     cuda-${CUDA_VERSION} \
     cuda-nvcc-${CUDA_VERSION} libnpp-${CUDA_VERSION} libnpp-dev-${CUDA_VERSION} \
     libnvinfer8 libnvinfer-dev \
     libnvinfer-plugin8 libnvinfer-plugin-dev \
     libnvparsers8 libnvparsers-dev \
     libcurand-dev-${CUDA_VERSION}


# Tensor RT
# https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#downloading

