#! /bin/bash

if [ -x "$(command -v rustup)" ]; then
  echo 'Rust has already been installed' >&2
  exit 0
fi

curl https://sh.rustup.rs -sSf | sh
