#! /bin/bash

if [ -x "$(command -v asdf)" ]; then
  echo 'asdf is already installed. updating asdf and plugins.' >&2
  asdf update
  asdf plugin-update --all
  exit 0
fi

sudo apt-get update
sudo apt-get -y upgrade

# install dependencies
sudo apt install \
  automake autoconf libreadline-dev \
  libncurses-dev libssl-dev libyaml-dev \
  libxslt-dev libffi-dev libtool unixodbc-dev \
  unzip curl

# clone the repo and check out the latest branch
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# add asdf to bash
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
# add asdf to zsh
# echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
# echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
