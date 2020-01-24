call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save=1
let NERDTreeWinSize=60
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
autocmd vimenter * NERDTree

set cursorcolumn
hi CursorColumn cterm=None ctermbg=Black

set cursorline
hi CursorLine cterm=None ctermbg=Black

autocmd InsertEnter * highlight  CursorLine ctermbg=Black  ctermfg=White
autocmd InsertLeave * highlight  CursorLine ctermbg=Black ctermfg=None

autocmd InsertEnter * highlight  CursorColumn ctermbg=Black ctermfg=None
autocmd InsertLeave * highlight  CursorColumn ctermbg=Black ctermfg=None

set encoding=utf-8
set number
set relativenumber
set backspace=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
syntax on
nnoremap f /
set incsearch
nnoremap <Space> i<Space><Esc>
inoremap <C-n> <Esc>
nnoremap <C-n> <Esc>
vnoremap <C-n> <Esc>
cnoremap <C-n> <Esc>
snoremap <C-n> <Esc>
set laststatus=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
