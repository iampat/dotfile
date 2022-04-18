#!/bin/bash
set -e

cd /tmp

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-377.0.0-linux-x86_64.tar.gz
install_path=${HOME}/.local/bin/
mkdir -p ${install_path}
tar -xf google-cloud-sdk-377.0.0-linux-x86_64.tar.gz -C ${install_path}

${install_path}/google-cloud-sdk/install.sh
 
gcloud init
gcloud auth application-default login --project postmates-x
gcloud auth login seyed@serverobotics.com
gcloud auth configure-docker

