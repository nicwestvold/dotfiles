#! /bin/bash

workfiles=$HOME/Development/nic/workfiles
dotfiles=$HOME/Development/nic/dotfiles

# create .dotiles directories
mkdir -p ~/.dotfiles/tmux
mkdir -p ~/.dotfiles/zsh

# setup zsh
# ln -sf /home/nwestvold/Development/nic/workfiles/zsh/custom /home/nwestvold/.dotfiles/zsh/custom
ln -sf $(dotfiles)/zsh/aliases $(HOME)/.dotfiles/zsh/aliases
ln -sf $(dotfiles)/zsh/exports $(HOME)/.dotfiles/zsh/exports
ln -sf $(dotfiles)/zsh/functions $(HOME)/.dotfiles/zsh/functions
ln -sf $(dotfiles)/zsh/.zshrc $(HOME)/.zshrc

# setup tmux
ln -sf $(dotfiles)/tmux/tmux-keybindings.conf $(HOME)/.dotfiles/tmux/tmux-keybindings.conf
ln -sf $(dotfiles)/tmux/.tmux.conf $(HOME)/.tmux.conf
ln -sf $(dotfiles)/tmux/.tmux.conf.local $(HOME)/.tmux.conf.local

# setup vim
ln -sf $(dotfiles)/vim/.vimrc $(HOME)/.vimrc
ln -sf $(dotfiles)/vim/custom.vim $(HOME)/.vim/custom.vim

# clone the workfiles repository
git clone git@github.com:nicwestvold/workfiles.git $workfiles

sh $workfiles/setup.sh

sh $dotfiles/scripts/gcloud.sh
sh $dotfiles/scripts/kubectl.sh
