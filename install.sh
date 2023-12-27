#!/bin/bash

## Uncomment the commands to perform various actions

## Install various packages
# sudo apt-get install -y zsh atop tmux

## Change your shell
# sudo chsh $USER -s /bin/zsh

## Install awscli
# pip3 install awscli

## Install Terraform
# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo chmod 644 /usr/share/keyrings/hashicorp-archive-keyring.gpg /etc/apt/sources.list.d/hashicorp.list
# sudo apt update && sudo apt-get install -y terraform

## Install kubectl
#sudo curl -LO --output-dir /usr/local/bin "https://dl.k8s.io/release/v1.27.4/bin/linux/amd64/kubectl"
#sudo chmod 755 /usr/local/bin/kubectl

## Make it your own!