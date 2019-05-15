call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save=1
autocmd vimenter * NERDTree

set number
set relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
syntax on
