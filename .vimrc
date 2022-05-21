"
" plugins
"

call plug#begin()
    Plug 'https://github.com/itchyny/lightline.vim'
    Plug 'https://github.com/itchyny/vim-gitbranch'
    Plug 'https://github.com/bronson/vim-trailing-whitespace'
    Plug 'https://github.com/ycm-core/YouCompleteMe.git'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

"
" basics
"

set nu
set hlsearch
set incsearch
set autoindent
set termguicolors
set nocompatible
syntax on

"
" colorscheme
"

let g:tokyonight_style = 'night'

colorscheme tokyonight

"
" statusline
"

set laststatus=2

set noshowmode
let g:lightline = {
	\ 'colorscheme': 'tokyonight',
	\ 'active': {
	\ 'left': [  [ 'mode' ],
	\            [ 'readonly', 'filename', 'gitbranch' ],
	\            [ 'modified' ] ],
	\ 'right': [ [ 'filetype', 'fileencoding' ],
	\            [ 'percent' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'gitbranch#name'
	\ },
	\ }
