#! /bin/bash

sudo apt-get install -y tmux

# oh my tmux
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
