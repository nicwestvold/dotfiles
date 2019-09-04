#! /bin/bash

if ! [ -x "$(command -v npm)" ]; then
  echo 'npm must be installed to continue' >&2
  exit 1
fi

# install typescript
npm i -g typescript
# install development tools
npm i -g tslint
