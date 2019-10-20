#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Hombrew/bundle
brew bundle

xcode-select --install

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# Configure diff / merge tool
git config --global merge.tool opendiff
git config --global diff.tool opendiff
git config --global pager = diff-so-fancy | less --tabs=4 -RFX

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

./install.sh
