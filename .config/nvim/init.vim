" Author:
" 	Sergio Quijano Rey
" 	sergiquijano@gmail.com
" Description:
" 	CONFIG FILE FOR NEOVIM
" Version:
" 	v1.0 06/02/2019 - First functionally version of the configuration
" 	v1.1 08/02/2019 - More pulished configuration, better organized

" PLUGIN MANAGER
"==============================================================================
call plug#begin('~/.local/share/nvim/plugged')

	" General purpose
	Plug 'scrooloose/nerdtree'	 					" File exploring
	Plug 'junegunn/fzf.vim'							" Fuzzy Finder
	Plug 'w0rp/ale'									" Real time linting

	" Editor
	Plug 'kana/vim-smartinput'						" Autoclose pairs
	
	" Visual
	Plug 'itchyny/lightline.vim'					" Status bar
	Plug 'junegunn/goyo.vim'						" Focus Mode

	" Autocompleters
	Plug 'Shougo/deoplete.nvim'						" Autocomplete
	
	" Linters
	Plug 'neomake/neomake'							" Linting by typing :Neomake

	" Color schemes
	Plug 'sickill/vim-monokai'						" Monokai Theme
	Plug 'morhetz/gruvbox'							" Gruvbox Theme
	Plug 'gosukiwi/vim-atom-dark'

call plug#end()

" LEADER KEY
"==============================================================================
let mapleader = ","

" EDITOR SETTINGS
"==============================================================================
set autoindent															" Sets autoindent
set smartindent															" Set smartindent
set smarttab															" Set smarttab
set tabstop=4															" Visually, 4 spaces
set incsearch															" Shows results while searching
set wildmenu															" Tab autocomplete in command mode
set backspace=indent,eol,start											" Normal backspace (for VI specially)
set mouse=n																" Allow mouse control

" Fast movement
map <C-Down> 3j			
map <C-Up> 3k

" Whole block identation
vnoremap < <gv
vnoremap > >gv

" PERFORMANCE
"==============================================================================
set autoread																" Auto reload changed files
autocmd! bufwritepost init.vim source %										" Auto compile when changing nvim config file
autocmd! bufwritepost .nvimrc source %										" Auto compile when changing nvim config file

" Get rid of swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Clipboard
set clipboard+=unnamedplus

" VISUAL SETTINGS
"==============================================================================
set number																	" Show numbers
syntax enable																" Show syntax
syntax on																	" Show syntax 
filetype on																	" Checks automatically for filetype
filetype indent on															" Identation dependent of filetype
filetype plugin on															" Plugins dependent of filetype
set hlsearch																" Higlights what we searched
set laststatus=2															" For the lightline plugin
set nowrap																	" Don't wrap long lines
set listchars=extends:→														" Show arrow if line continues rightwards
set colorcolumn=80															" Show 80 col line 
set splitbelow splitright													" Spliting on righ instead of below
set guicursor=																" OLD CURSOR
let loaded_matchparen= 1													" No matching parenthesis/brakets/... highlight
colorscheme gruvbox

" Keybindings
"==============================================================================
" Spell checking
map <F6> :setlocal spell! spelllang=es<CR>
map <F7> :setlocal spell! spelllang=en<CR>
 
" Code Linting
map <F5> :Neomake<CR>
" Open a terminal
map <C-K> :sp<CR>:terminal<CR>A
 
" Ctr-space for autocompletion
imap <C-space> <C-p>

" Focus mode
map <C-f> :Goyo 120x120<CR>

" Fuzzy File Finder
map <C-p> :FZF<CR>

" Open Nerd Tree
map <C-o> :NERDTreeToggle<CR>

" Goto Definition
map <C-g> :ALEGoToDefinitionInSplit<CR>


" PLUGINS CONFIGURATION
"=============================================================================
" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" ALE
let g:ale_completion_enabled = 1					" ALE autocompletion
