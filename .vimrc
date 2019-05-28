call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save=1
let NERDTreeWinSize=60
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
autocmd vimenter * NERDTree

set encoding=utf-8
set number
set relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
syntax on
