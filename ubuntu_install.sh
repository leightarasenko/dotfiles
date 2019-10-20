#!/bin/bash

sudo apt-get update
sudo apt-get install -q -y git unzip ripgrep vim-gtk tmux htop python3-pip openjdk-11-jdk

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "~/awscliv2.zip" \
	  && unzip ~/awscliv2.zip && sudo ~/aws/install && rm ~/awscliv2.zip

## Install Android SDK
curl "https://dl.google.com/android/repository/commandlinetools-linux-6514223_latest.zip" -o ~/commandlinetools.zip \
    && unzip ~/commandlinetools.zip -d ~/Android \
    && rm commandlinetools.zip \
    && ~/Android/tools/bin/sdkmanager "platform-tools" "platforms;android-28" "build-tools;29.0.2"

./install.sh
