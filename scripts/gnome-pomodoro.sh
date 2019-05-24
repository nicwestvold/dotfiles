#! /bin/bash

# short circuit if gnome-pomodoro is already installed
if [ "$(command -v gnome-pomodoro)" ]; then
  echo 'gnome-pomodoro is already installed.' >&2
  exit 0
fi

# create the bin directory
if ! [ -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

cd $HOME/bin

git clone -b gnome-3.32 https://github.com/codito/gnome-pomodoro.git

cd gnome-pomodoro
./autogen.sh --prefix=/usr --datadir=/usr/share

make
sudo make install
