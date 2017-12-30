#!/bin/bash

# Uninstalls dotfiles

# Get root
DOTFILES=`dirname $0 | xargs readlink -f`

rm ~/.bash
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.vimrc
rm ~/.vim
rm ~/.editorconfig
rm ~/.gitconfig
rm ~/.gitignore_global
rm ~/.eslintrc
rm ~/.tmux.conf
rm ~/git-prompt.sh
rm ~/.agignore
