#!/bin/bash
set -e

# cd /tmp
# 
# curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-384.0.1-linux-x86_64.tar.gz
#        
# install_path=${HOME}/.local/bin/
# mkdir -p ${install_path}
# tar -xf google-cloud-cli-384.0.1-linux-x86.tar.gz -C ${install_path}
# 
# ${install_path}/google-cloud-sdk/install.sh

snap install google-cloud-cli --classic

gcloud init
gcloud auth application-default login --project postmates-x
gcloud auth login seyed@serverobotics.com
gcloud auth configure-docker

