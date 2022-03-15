#!/bin/bash
set -e

# it is important to follow steps in
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

# pre install
# sudo apt-get install linux-headers-$(uname -r)

# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
# sudo ubuntu-drivers autoinstall

# # if you have CUDA on your machine https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#handle-uninstallation
# sudo /usr/local/cuda/bin/cuda-uninstaller
# sudo /usr/bin/nvidia-uninstall
# sudo apt-get --purge remove <package_name>


# # from https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network

# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
# sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
# sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
# sudo apt-get update
# # sudo apt-get -y install cuda-11 nvidia-gds-11
#
# Tensor RT
# https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#downloading
sudo apt install cuda-nvcc-11 libnpp-11 libnpp-dev-11

sudo apt install libnvinfer8 libnvinfer-dev
sudo apt install libnvinfer-plugin8 libnvinfer-plugin-dev
sudo apt install libnvparsers8 libnvparsers-dev
