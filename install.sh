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

# FZF install
export FZF_DIR="$HOME/.fzf"
if [ ! -d "$FZF_DIR" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR" 
    pushd "$FZF_DIR"
    ./install
    popd
 . "$FZF_DIR/install"
fi

# ASDF install
export ASDF_DIR="$HOME/.asdf"
if [ ! -d "$ASDF_DIR" ]; then
    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.7.8 

    source "$HOME"/.asdf/asdf.sh

    # Install Node
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    asdf install nodejs 12.17.0
    asdf global nodejs 12.17.0
fi

# Install ansible
pip3 install --user ansible

source ~/.bashrc
