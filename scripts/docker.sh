#! /bin/bash

# setup the repository
sudo apt-get update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    # gnupg-agent \
    software-properties-common

# add docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# install Docker CE
sudo apt-get update

apt-cache policy docker-ce

# sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-ce

sudo usermod -aG docker $USER
