execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2 softtabstop=0 expandtab shiftwidth=22 smarttab
set nocompatible
set visualbell           " don't beep
set noerrorbells         " don't beep
set showcmd
set cursorline
set mouse=a
set shell=/bin/bash
set nonumber

" Ignore these files/folders
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildignore+=*/vendor/**,*/node_modules/**,*/bower_components/**

nmap <C-v> :vertical resize +10<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap :sp :rightbelow sp<cr>
nmap <C-z> :ZoomWin<cr>
noremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
imap jj <esc>
nmap <leader>f :AutoFormat<cr>

" Map a leader key
let mapleader = ","
let g:mapleader =","
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace on save

" Fast save
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>q :qa!<cr>
