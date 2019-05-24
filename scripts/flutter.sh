#! /bin/bash

sudo apt-get update
sudo apt-get install -y xz-utils libglu1-mesa lib32stdc++6

cd $HOME/Downloads
curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz

cd $HOME
tar xf ~/Downloads/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz

# add `flutter` to the PATH
export PATH="$PATH:`pwd`/flutter/bin"

# pre-download development binaries
flutter precache

# android studio - https://developer.android.com/studio
cd /tmp
curl -O https://dl.google.com/dl/android/studio/ide-zips/3.4.1.0/android-studio-ide-183.5522156-linux.tar.gz
sudo tar zxvf android-studio-ide-183.5522156-linux.tar.gz -C /opt/
# run the setup script to install Android Studio
/opt/android-studio/bin/studio.sh

# continue/finish setting up flutter
flutter doctor
