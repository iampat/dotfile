#!/bin/bash
set -e

git config --global user.email "ali@amiri.dev"
git config --global user.name "Ali Amiri"

gh auth
gh auth login
gh auth refresh -h github.com -s admin:public_key


ssh-keygen -t ed25519 -C "$(uname -n)$(date)"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
gh ssh-key add ~/.ssh/id_ed25519.pub --title "For $USER@$(uname -n) at $(date +'%Y-%m-%d')"
