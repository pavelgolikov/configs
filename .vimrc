call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save=1

autocmd vimenter * NERDTree
set number
set tabstop=4
set bs=2
set relativenumber
set autoindent
syntax on
set shiftwidth=4
