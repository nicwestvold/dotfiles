#! /bin/bash

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y gnome-tweaks

# Swap Caps Lock and Escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
