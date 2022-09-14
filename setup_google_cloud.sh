#!/bin/bash
set -e

cd /tmp
version="402.0.0"
tar_file=google-cloud-cli-${version}-linux-x86_64.tar.gz

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${tar_file}
       
install_path=${HOME}/.local/bin/
mkdir -p ${install_path}
pwd
tar -xf ${tar_file} -C ${install_path}

${install_path}/google-cloud-sdk/install.sh

# don't use snap, it will mess with other local libraries
# snap install google-cloud-cli --classic

gcloud init
gcloud auth application-default login --project postmates-x
gcloud auth login seyed@serverobotics.com
gcloud auth configure-docker

