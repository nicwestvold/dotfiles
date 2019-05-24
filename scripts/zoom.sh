#! /bin/bash

cd /tmp
wget https://zoom.us/client/latest/zoom_amd64.deb

sudo dpkg -i ./zoom_amd64.deb

sudo apt-get install -f
