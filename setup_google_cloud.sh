#!/bin/bash
set -e

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-377.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-sdk-377.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

gcloud init
gcloud auth application-default login --project postmates-x
gcloud auth login seyed@serverobotics.com
gcloud auth configure-docker

