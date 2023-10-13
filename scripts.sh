#!/bin/bash

# Instalacion Ansible

apt update
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
python3 -m pip install ansible

# Instalacion Terraform

apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

apt update

apt-get install terraform

# Instalacion Docker

curl -fsSL https://get.docker.com/ -o get-docker-sh
sudo sh get-docker-sh

# Usar Docker sin sudo

sudo groupadd docker
sudo usermod -aG docker $(whoami)
newgrp docker