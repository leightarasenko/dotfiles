#!/bin/bash

sudo apt-get install -q -y git zsh silversearcher-ag ack-grep ctags python-setuptools build-essential cmake

# ZSH install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# NVM install
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    pushd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    ./nvm.sh
    popd
 . "$NVM_DIR/nvm.sh"
fi

# Geeknote install
if [ ! -d ~/geeknote ]; then
    git clone git://github.com/VitaliyRodnenko/geeknote.git ~/geeknote
    pushd ~/geeknote
    sudo python setup.py install
    geeknote login
    geeknote settings --editor vim
    popd
fi

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt install oracle-java8-set-default

./install.sh
