call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
call plug#end()
let g:auto_save=1
let NERDTreeWinSize=60
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
autocmd vimenter * NERDTree

"set cursorcolumn
"hi CursorColumn cterm=None ctermbg=Black
"autocmd InsertEnter * highlight  CursorColumn ctermbg=Black ctermfg=None
"autocmd InsertLeave * highlight  CursorColumn ctermbg=Black ctermfg=None

set cursorline
hi CursorLine cterm=None ctermbg=Black
hi Visual ctermfg=Black ctermbg=White


autocmd InsertEnter * highlight  CursorLine ctermbg=Black  ctermfg=White
autocmd InsertLeave * highlight  CursorLine ctermbg=Black ctermfg=None


set tw=80
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
set laststatus=2
set path=$PWD/**
set switchbuf+=usetab,newtab

" find files and populate the quickfix list
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FF call FindFiles(<q-args>) | redraw!

noremap ; l
noremap l k
noremap k j
noremap j h


" Execute grep recursive grep -> skip ENTER window -> redraw the output -> open the location list
command -nargs=* F silent execute "lgrep! -inr -I <args>" | redraw! | lopen 30

