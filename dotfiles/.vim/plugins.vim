filetype off                " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/surround.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'
Plugin 'valloric/youcompleteme'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" colors
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'flazz/vim-colorschemes'

call vundle#end()           " required
filetype plugin indent on   " required
