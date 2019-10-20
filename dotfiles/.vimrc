" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

Plug 'bling/vim-airline'

" Automatically show Vim's complete menu while typing.
Plug 'vim-scripts/AutoComplPop'

" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Colors
Plug 'gosukiwi/vim-atom-dark'
Plug 'flazz/vim-colorschemes'

call plug#end()

"BASIC SETUP

" enter the current millenium
set nocompatible
set t_Co=256

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

"FINDING FILES

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files we tab complete
set wildmenu

" FILE BROWSING
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s)zs\.\S\+'

"-------------Search------------
set hlsearch
set incsearch

"-------------Visuals------------
colorscheme atom-dark-256
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set nofoldenable
set clipboard^=unnamed,unnamedplus

set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Show (partial) command in the status line
set showcmd

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

hi vertsplit guifg=bg guibg=bg

"-------------Mappings------------
let mapleader = ","
let g:mapleader = "\,"

"nmap <Leader>ev 	:tabedit $MYVIMRC<cr>
nmap <Leader><space>	:nohlsearch<cr>

nmap <leader>w :w!<cr> " Fast saves

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

set wildignore+=*/node_modules/**
set wildignore+=*/\.git/**

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

" Grep/RG
if executable('rg') 
    " Note we extract the column as well as the file and line number
    set grepprg=rg\ --nogroup\ --nocolor\
    set grepformat=%f:%l:%c%m
    " bind \ (backward slash) to grep shortcut
    nnoremap \ :Rg<SPACE>
    nnoremap K :Rg <C-R><C-W><CR>
endif

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"-------------Plugins-------------

" FZF
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

nnoremap <silent> <C-p> :FZF -m<Cr>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" NERDTREE
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 32

nnoremap <silent> <leader>f :NERDTreeToggle<CR>
nnoremap <silent> <leader>F :NERDTreeFind<CR>

" AIRLINE
set statusline+=%#warningmsg#
set statusline+=%*

if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/undo
    set undolevels=5000
endif
