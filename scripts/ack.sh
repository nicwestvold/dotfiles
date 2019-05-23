#! /bin/bash

# update
sudo apt-get update
sudo apt-get -y upgrade

# install ack
sudo apt-get -y install ack-grep

# rename ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
