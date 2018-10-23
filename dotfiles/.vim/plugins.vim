filetype off                " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/surround.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Plugin 'vim-syntastic/syntastic'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
" Plugin 'neilagabriel/vim-geeknote'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'mxw/vim-jsx'
Plugin 'valloric/youcompleteme'

" colors
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'flazz/vim-colorschemes'

call vundle#end()           " required
filetype plugin indent on   " required
