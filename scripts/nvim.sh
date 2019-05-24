#! /bin/bash

sudo apt-get install -y neovim python-neovim python3-neovim

# install neovim library for deoplete
pip3 install neovim

# add minpac
mkdir -p ~/.vim/pack/minpac/opt
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
