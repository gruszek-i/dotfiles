let mapleader = " "

nnoremap <leader>e :Ex<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>d "+p
vnoremap <leader>d "+p

nnoremap <leader><leader> :so<CR>

nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

nnoremap <silent> <leader>x :!chmod +x %<CR>

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

set nohlsearch 
set incsearch  

set scrolloff=8
