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

# install dependencies
sudo apt-get update
sudoo apt-get upgrade -y
sudo apt-get install -y \
  autoconf-archive \
  gettext \
  valac \
  pkg-config \
  desktop-file-utils \
  appstream-util \
  libappstream-glib-dev \
  libglib2.0-dev \
  gsettings-desktop-schemas-dev \
  gobject-introspection \
  libgirepository1.0-dev \
  libsqlite3-dev \
  libgom-1.0-dev \
  libgstreamer1.0-dev \
  libgtk-3-dev \
  libcanberra-dev \
  libpeas-dev \
  libappindicator3-dev

./autogen.sh --prefix=/usr --datadir=/usr/share

make
sudo make install

# sudo apt-get update
# sudo apt-get -y upgrade
# sudo apt-get install -y gnome-shell-pomodoro
