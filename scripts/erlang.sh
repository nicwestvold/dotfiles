#! /bin/bash

if ! [ -x "$(command -v asdf)" ]; then
  echo 'Error: asdf is not installed.' >&2
  exit 1
fi

# TODO: check if the plugin is already installed
# install the erlang plugin
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

# get the latest (non-rc) version of erlang
latest=$(asdf list-all erlang | awk '!/rc/ {a=$0} END{print a}')

if [ -x "$(command -v erl)" ]; then
  curr=$(erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' -noshell)
  if [ "$curr" = "$latest" ]; then
    echo 'erlang is at the latest version' >&2
    exit 0
  else
    echo 'erlang is NOT at the latest version' >&2
    echo "current: $curr"
    echo "latest : $latest"
    exit 0
  fi
fi

# install dependencies
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
  build-essential \
  autoconf \
  m4 \
  libncurses5-dev \
  libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev \
  libssh-dev \
  unixodbc-dev \
  xsltproc fop

echo "installing version $latest of erlang"
# skip the java dependency
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
asdf install erlang $latest
asdf global elrang $latest
