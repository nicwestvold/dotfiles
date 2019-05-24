#! /bin/bash

if [ "$(command -v kubectl)" ]; then
  echo 'kubectl is already installed.' >&2
  exit 0
fi

# download the latest release
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

# make the binary executable
chmod +x ./kubectl

# move it into the PATH
sudo mv ./kubectl /usr/local/bin/kubectl
