#! /bin/bash

cd /tmp

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-247.0.0-linux-x86_64.tar.gz

tar zxvf google-cloud-sdk-247.0.0-linux-x86_64.tar.gz -C $HOME

$HOME/google-cloud-sdk/install.sh

# setup
~/google-cloud-sdk/bin/gcloud init

# get application default for running locally and talking to the cloud
~/google-cloud-sdk/bin/gcloud auth application-default login

# configure gcloud container registry
~/google-cloud-sdk/bin/gcloud auth configure-docker
