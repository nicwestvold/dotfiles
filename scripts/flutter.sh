#! /bin/bash

sudo apt-get update
sudo apt-get install -y  xz-utils libglu1-mesa

cd $HOME/Downloads
curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz

cd $HOME
tar xf ~/Downloads/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz

# add `flutter` to the PATH
export PATH="$PATH:`pwd`/flutter/bin"
# add `flutter' to the .zshrc file
echo "PATH=\"$PATH:$HOME/flutter/bin\"" >> $HOME/.zshrc

# pre-download development binaries
flutter precache
