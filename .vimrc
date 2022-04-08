set hlsearch
set relativenumber
set number relativenumber
set incsearch
set ignorecase
set smartcase
set noshowmatch
set hidden
set noerrorbells
set linebreak

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set so=4

filetype off
syntax on

let mapleader = "'"

" set termguicolors

set t_Co=256
set background=dark
set updatetime=500

" Add Vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

let g:gruvbox_invert_selection='0'

autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'RRethy/vim-illuminate'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-commentary'
call vundle#end()

" colorscheme Tomorrow-Night
colorscheme gruvbox

filetype plugin indent on

autocmd FileType c,cpp,java,php,cs,md autocmd BufWritePre <buffer> %s/\s\+$//e
