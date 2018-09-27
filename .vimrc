"	sergiquijano@gmail.com
" Version
" 	v1.0 26/09/2018 - First functionaly version

" Plugins
"==============================================================================
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim' 			" Status bar
Plug 'scrooloose/nerdtree'			" File tree
Plug 'junegunn/goyo.vim'			" ZenMode
Plug 'ErichDonGubler/vim-sublime-monokai'	" Sublime theme
Plug 'ctrlpvim/ctrlp.vim'			" For finding archives

call plug#end()

" Performance configuration
"==============================================================================
set hidden 
set history=100				" Vim history buffer 
set autoread                          	" Auto reload changed files

let g:minimap_highlight='Visual'


" Editor configuration
"==============================================================================
set autoindent			" Sets autoindent
set smartindent			" Set smartindent
set smarttab			" Set smarttab
set incsearch                   " Shows results while searching
set wildmenu                    " Tab autocomplete in command mode
set backspace=indent,eol,start	" Normal backspace

" Visual settings
"==============================================================================
set number					" Show numbers
syntax enable					" Show syntax
syntax on					" Show syntax 
set hlsearch 					" Higlights what we searched
set laststatus=2 				" For the lightline plugin
set nowrap                      		" Don't wrap long lines
set listchars=extends:→         		" Show arrow if line continues rightwards

" Vim theme
"===============================================================================
colorscheme sublimemonokai			" Monokai theme
set termguicolors				" For best Monokai theme

" Plugins configuration
"===============================================================================
" Nerdtree automatically opens when using vim to open a dir, ie: vim .  | vim ~/GitProjects
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Keybindings
"==============================================================================
map <C-o> :NERDTreeToggle<CR> 		
map <C-f> :Goyo<CR>		
map <C-p> :CtrlP<Cr>			

" Some fast vertical movement
map <C-Down> 3j
map <C-Up> 3k

" Experimental
"===============================================================================
nnoremap <space> za
