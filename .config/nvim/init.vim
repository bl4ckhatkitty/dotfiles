" Plugins
call plug#begin()
	Plug 'https://github.com/editorconfig/editorconfig-vim'
	Plug 'https://github.com/itchyny/lightline.vim'
	Plug 'https://github.com/rafaqz/ranger.vim'
	Plug 'https://github.com/romainl/vim-cool'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/itchyny/vim-gitbranch'
	Plug 'https://github.com/tpope/vim-surround'
	Plug 'https://github.com/tpope/vim-repeat'
	Plug 'https://github.com/tpope/vim-speeddating'
	Plug 'https://github.com/bronson/vim-trailing-whitespace'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'jiangmiao/auto-pairs'

	" Neovim LSP
	Plug 'https://github.com/neovim/nvim-lspconfig'
	Plug 'https://github.com/hrsh7th/nvim-cmp'
		Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
		Plug 'https://github.com/hrsh7th/cmp-buffer'
		Plug 'https://github.com/hrsh7th/cmp-path'
		Plug 'https://github.com/hrsh7th/cmp-cmdline'
call plug#end()


"
" Colorseme
"
let g:tokyonight_style = "night"
colorscheme tokyonight


"
" Basics
"

syntax on
filetype plugin indent on
set autoindent
set smarttab
set nu
set clipboard=unnamedplus
set inccommand=nosplit
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set undofile
set termguicolors


" Lua configs
runtime lua/completion.lua


" Disable changing cursor to line
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=

" Python paths, needed for virtualenvs
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'


"
" Plugin configs
"

" Lightline - statusline
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

" Neovim LSP
map <silent> <C-k> :lua vim.diagnostic.open_float({focusable=false})<CR>
map <silent> <C-b> :lua vim.lsp.buf.formatting()<CR>
set completeopt=menu,menuone,noselect



"
" Language-specific
"

autocmd Filetype css        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype gitolite   setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype htmldjango setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype json       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype jst        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype less       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown   setlocal conceallevel=0
autocmd Filetype php        setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype scss       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml       setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2



"
" Key Bindings
"

" Leader key
let mapleader = ' '

" When line overflows, it will go
" one /visual/ line and not actual
map j gj
map k gk

" gv reselects last selection
" so now you can indent with >>>>…
" without selecting again
xnoremap < <gv
xnoremap > >gv

" Tab Management
map <C-o> :tabnew<CR>
map <C-c> :tabclose<CR>
nnoremap <Leader>k gT
nnoremap <Leader>j gt

" Open Ranger, file manager
map <C-\> :RangerEdit<CR>
