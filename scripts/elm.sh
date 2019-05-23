#! /bin/bash

if ! [ -x "$(command -v npm)" ]; then
  echo 'npm must be installed to continue' >&2
  exit 1
fi

# install elm
npm i -g elm
# install development tools
npm i -g elm-test elm-oracle elm-format
npm i -g create-elm-app
