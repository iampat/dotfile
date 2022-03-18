#!/bin/bash
set -e

snap install google-cloud-cli --classic

gcloud init
gcloud auth application-default login --project postmates-x
gcloud auth login seyed@serverobotics.com
gcloud auth configure-docker

