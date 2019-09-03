#! /bin/bash

workfiles=$HOME/Development/nic/workfiles
dotfiles=$HOME/Development/nic/dotfiles

# create .dotiles directories
mkdir -p ~/.dotfiles/tmux
mkdir -p ~/.dotfiles/zsh

# SETUP zsh
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# link dotfiles
ln -sf $dotfiles/zsh/aliases $HOME/.dotfiles/zsh/aliases
ln -sf $dotfiles/zsh/exports $HOME/.dotfiles/zsh/exports
ln -sf $dotfiles/zsh/functions $HOME/.dotfiles/zsh/functions
ln -sf $dotfiles/zsh/.zshrc $HOME/.zshrc

# SETUP tmux
ln -sf $dotfiles/tmux/tmux-keybindings.conf $HOME/.dotfiles/tmux/tmux-keybindings.conf
ln -sf $dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $dotfiles/tmux/.tmux.conf.local $HOME/.tmux.conf.local

# SETUP vim
ln -sf $dotfiles/vim/.vimrc $HOME/.vimrc
ln -sf $dotfiles/vim/custom.vim $HOME/.vim/custom.vim
# SETUP nvim
mkdir -p ~/.config/nvim
ln -sf $dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

# WORKFILES
# clone the workfiles repository
# git clone git@github.com:nicwestvold/workfiles.git $workfiles

# sh $workfiles/setup.sh

# SETUP tooling
# sh $dotfiles/scripts/gcloud.sh
# sh $dotfiles/scripts/kubectl.sh
