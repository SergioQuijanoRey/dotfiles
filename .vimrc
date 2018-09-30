"	sergiquijano@gmail.com
" Version
" 	v1.0 26/09/2018 - First functionaly version

" Plugins
"==============================================================================
call plug#begin('~/.vim/plugged')

" General purpose plugins
Plug 'itchyny/lightline.vim'			" Status bar
Plug 'scrooloose/nerdtree'			" File tree
Plug 'junegunn/goyo.vim'			" ZenMode
Plug 'ErichDonGubler/vim-sublime-monokai'	" Sublime theme
Plug 'ctrlpvim/ctrlp.vim'			" For finding archives
Plug 'Valloric/YouCompleteMe'			" Autocompletion for any language
Plug 'kana/vim-smartinput'			" Autoclose brackets and parenthesis

" Python IDE plugins
Plug 'davidhalter/jedi-vim' 			" <ctr><space> for autocompletion
						" <leader>g for goto definition
						" K for show documentation
call plug#end()

" Leader letter
"==============================================================================
let mapleader = ","

" Performance configuration
"==============================================================================
set hidden 
set history=100				" Vim history buffer 
set autoread                          	" Auto reload changed files
autocmd! bufwritepost .vimrc source %	" Auto compile when changing .vimrc

" Get rid of swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Better copy/paste ---> WIP
set pastetoggle=<F2>
set clipboard=unnamed

" Editor configuration
"==============================================================================
set autoindent			" Sets autoindent
set smartindent			" Set smartindent
set smarttab			" Set smarttab
set incsearch                   " Shows results while searching
set wildmenu                    " Tab autocomplete in command mode
set backspace=indent,eol,start	" Normal backspace

" Whole block identation
vnoremap < <gv
vnoremap > >gv

" Visual settings
"==============================================================================
set number					" Show numbers
syntax enable					" Show syntax
syntax on					" Show syntax 
set hlsearch 					" Higlights what we searched
set laststatus=2 				" For the lightline plugin
set nowrap                      		" Don't wrap long lines
set listchars=extends:→         		" Show arrow if line continues rightwards
set colorcolumn=80				" Show 80 col line 

" Tabs control 
"==============================================================================
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>
map <leader>t <esc>:tabnew<CR>
map <leader>t! <esc>:tabclose<CR>


" Vim theme
"==============================================================================
colorscheme sublimemonokai			" Monokai theme
set termguicolors				" For best Monokai theme

" Plugins configuration
"==============================================================================
" Nerdtree automatically opens when using vim to open a dir, ie: vim .  | vim ~/GitProjects
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Recompile the file for new diagnostics - YouCompleteMe
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Keybindings
"==============================================================================
" Ctr-o to open tree view
map <C-o> :NERDTreeToggle<CR> 		

" Ctrl-f to go zen mode
map <C-f> :Goyo<CR>		

" Ctr-p to find files
map <C-p> :CtrlP<Cr>			

" Some fast vertical movement
map <C-Down> 3j
map <C-Up> 3k

