#!/bin/bash

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}" 
}

safe_link() {
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

for f in `ls -A $DOTFILES/dotfiles`; do
    safe_link "$DOTFILES/dotfiles/$f"
done

vim "+helptags ~/.vim/doc" "+q"

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap

mkdir -p ~/bin

git submodule init
git submodule update

# Configure diff / merge tool
if [ `uname` == "Darwin" ]; then
    git config --global merge.tool opendiff
    git config --global diff.tool opendiff
	git config --global pager = diff-so-fancy | less --tabs=4 -RFX
fi

source ~/.bashrc
