#! /bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y lxd lxd-client

sudo lxd init --auto

sudo adduser $USER lxd
