" Author:
" 	Sergio Quijano Rey
" 	sergiquijano@gmail.com
" Description:
" 	CONFIG FILE FOR NEOVIM
" Version:
" 	v1.0 06/02/2019 - First functionally version of the configuration

" PLUGIN MANAGER
"==============================================================================
" nvim completion manager
" asyncomplete
" ale
" Video de youtube to guapo
" neomake
" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" General purpose
Plug 'Shougo/deoplete.nvim'						" Autocomplete
Plug 'fatih/molokai'							" Monokai color scheme
Plug 'itchyny/lightline.vim'						" Status bar
Plug 'junegunn/goyo.vim'						" Focus Mode


call plug#end()

" LEADER KEY
"==============================================================================
let mapleader = ","

" VISUAL SETTINGS
"==============================================================================

" EDITOR SETTINGS
"==============================================================================
set autoindent			" Sets autoindent
set smartindent			" Set smartindent
set smarttab			" Set smarttab
set incsearch                   " Shows results while searching
set wildmenu                    " Tab autocomplete in command mode
set backspace=indent,eol,start	" Normal backspace

" Fast movement
map <C-Down> 3j			
map <C-Up> 3k

" Whole block identation
vnoremap < <gv
vnoremap > >gv

" PERFORMANCE
"==============================================================================
set autoread                          	" Auto reload changed files
autocmd! bufwritepost init.vim source %	" Auto compile when changing nvim config file
autocmd! bufwritepost .nvimrc source %	" Auto compile when changing nvim config file

" Get rid of swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Clipboard
set clipboard+=unnamedplus

" " Visual settings
" "==============================================================================
set number					" Show numbers
syntax enable					" Show syntax
syntax on					" Show syntax 
set hlsearch 					" Higlights what we searched
set laststatus=2 				" For the lightline plugin
set nowrap                      		" Don't wrap long lines
set listchars=extends:→         		" Show arrow if line continues rightwards
set colorcolumn=80				" Show 80 col line 
set splitbelow splitright			" Spliting on righ instead of below
set guicursor=		" OLD CURSOR
let loaded_matchparen = 1			" No matching parenthesis/brakets/... highlight
colorscheme molokai


" Keybindings
"==============================================================================
" Spell checking
map <F6> :setlocal spell! spelllang=es<CR>
" 
" Open a terminal
map <C-k> :terminal<CR>
 
" Ctr-space for autocompletion
imap <C-space> <C-p>

" Focus mode
map <C-f> :Goyo<CR>


" PLUGINS CONFIGURATION
"=============================================================================
let g:deoplete#enable_at_startup = 1
