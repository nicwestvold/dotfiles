#! /bin/bash

if ! [ -x "$(command -v asdf)" ]; then
  echo 'Error: asdf is not installed.' >&2
  exit 1
fi

# TODO: check if plugin is already installed
# install the golang plugin
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

# get the latest version of go
latest=$(asdf list-all golang | awk '!/rc|beta/ {a=$0} END{print a}')

if [ -x "$(command -v go)" ]; then
  curr=$(go version | awk '{print substr($3, 3)}')
  if [ "$curr" = "$latest" ]; then
    echo 'Go is at the latest version' >&2
    exit 0
  else
    echo 'Go is NOT at the latest version' >&2
    echo "current: $curr"
    echo "latest : $latest"
    exit 0
  fi
fi

echo "installing version $latest of go"
asdf install golang $latest
asdf global golang $latest
