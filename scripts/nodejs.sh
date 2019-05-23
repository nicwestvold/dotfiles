#! /bin/bash

if ! [ -x "$(command -v asdf)" ]; then
  echo 'Error: asdf is not installed.' >&2
  exit 1
fi

sudo apt-get update
sudo apt-get -y upgrade

# install dependencies
sudo apt-get -y install dirmngr gpg

# install the nodejs plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# import the Node.js release team's OpenPGP keys to main keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

lts=$(asdf list-all nodejs | awk '/^10/ {a=$0} END{print a}')

echo "installing node version $lts"
asdf install nodejs $lts
asdf global nodejs $lts
