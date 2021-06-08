" Author:
"     Sergio Quijano Rey
"     sergiquijano@gmail.com
" Description:
"     CONFIG FILE FOR NEOVIM
" TODO:
"   [ ] Move from CoC to builtin lsp

" PLUGIN MANAGER
"===============================================================================
call plug#begin('~/.local/share/nvim/plugged')

    " General purpose
    "===========================================================================
    Plug 'scrooloose/nerdtree'          " File exploring
    Plug 'tpope/vim-fugitive'           " Git Integration
    Plug 'psliwka/vim-smoothie'         " Smooth scrolling

    " Editor
    "===========================================================================
    Plug 'jiangmiao/auto-pairs'         " Autoclose brackets, parenthesis...
    Plug 'preservim/nerdcommenter'      " Commenting code

    " Visual
    "===========================================================================
    Plug 'vim-airline/vim-airline'          " Status bar. Lightline is a lighter alternative
    Plug 'vim-airline/vim-airline-themes'   " Status bar themes
    Plug 'junegunn/goyo.vim'                " Focus Mode
    Plug 'ryanoasis/vim-devicons'           " Icons for NerdTree

    " Language server protocols, codecompletions, ...
    "===========================================================================
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Code Autocompletion and other utils

    " Telescope
    Plug 'nvim-lua/popup.nvim'              " Requirement for telescope
    Plug 'nvim-lua/plenary.nvim'            " Requirement for telescope
    Plug 'nvim-telescope/telescope.nvim'    " The plugin
    Plug 'kyazdani42/nvim-web-devicons'     " Icons for the plugig

    " Treesitter -- Advance hightlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Color schemes
    "===========================================================================
    Plug 'gruvbox-community/gruvbox'    " Gruvbox Theme updated
    Plug 'joshdick/onedark.vim'         " Secondary Theme

    " Weird language support
    "===========================================================================
    " TODO -- delete this pluging when uni homework is finished
    Plug 'PontusPersson/pddl.vim'

call plug#end()

" Load Lua config files
"===============================================================================
lua require("treesitter")

" LEADER KEY
"==============================================================================
let mapleader = ","

" EDITOR SETTINGS
"==============================================================================
set autoindent                          " Sets autoindent
set smartindent                         " Set smartindent
set incsearch                           " Shows results while searching
set backspace=indent,eol,start          " Normal backspace (for VI specially)
set mouse=n                             " Allow mouse control
set undofile                            " Persisten undos (I can undo even if I closed the file)
set encoding=utf-8                      " Type of encoding
set ignorecase                          " When searching, ignore upper or lower case
set scrolloff=4                         " Start scrolling before getting to last line

" Four spaces instead of tab
filetype plugin indent on
set smarttab                            " Set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Remove trailing white spaces when saving file
autocmd BufWritePre * %s/\s\+$//e

" PERFORMANCE
"==============================================================================
set autoread                                " Auto reload changed files
autocmd! bufwritepost init.vim source %     " Auto compile when changing nvim config file
autocmd! bufwritepost .nvimrc source %      " Auto compile when changing nvim config file

" Get rid of swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Clipboard
set clipboard+=unnamedplus

" Avoid flashy terminal
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=10

" VISUAL SETTINGS
"==============================================================================
set number                          " Show numbers
syntax enable                       " Show syntax
syntax on                           " Show syntax
filetype on                         " Checks automatically for filetype
filetype plugin on                  " Plugins dependent of filetype
set hlsearch                        " Higlights what we searched
set nowrap                          " Don't wrap long lines
set listchars=extends:→             " Show arrow if line continues rightwards
set colorcolumn=100                 " Show 100 col line
set splitbelow splitright           " Spliting on righ instead of below
set guicursor=                      " Block cursor
let loaded_matchparen= 1            " No matching parenthesis/brakets/... highlight
set background=dark                 " Dark background, does nothing with gruvbox colorscheme
colorscheme gruvbox                 " Default color scheme

" Keybindings
"===============================================================================
" Fast movement
map <C-Down> 3j
map <C-Up> 3k
map <C-j> 3j
map <C-k> 3k

" Whole block identation
vnoremap < <gv
vnoremap > >gv

" Spell checking
map <F5> :setlocal spell! spelllang=es<CR>
map <F6> :setlocal spell! spelllang=en<CR>

" Open a terminal (horizontal or vertical)
map <leader>k :sp<CR>:terminal<CR>A
map <leader>K :vsp<CR>:terminal<CR>A

" Focus mode for writting
map <leader>f :Goyo 120x120<CR>:set wrap<CR>:set linebreak<CR>:set breakindent<CR>
map <leader><S-f> :Goyo<CR>:set nowrap<CR>:set number<CR>

" Open Nerd Tree
map <leader>o :NERDTreeToggle<CR>

" For exiting the terminal mode
tnoremap <leader><Esc> <C-\><C-n>>

" For avoid shifting
map <S-Up> <C-Up>
map <S-Down> <C-Down>

" Clears the search highlight
map <leader>m :noh<CR>

" Tab Navigation
map <leader>t :tabnew<CR>
map <leader>T :tabnew<CR>:terminal<CR>A
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt

" Split navigation
map <leader><Left> :wincmd h<CR>
map <leader><Right> :wincmd l<CR>
map <leader><Up> :wincmd k<CR>
map <leader><down> :wincmd j<CR>

" Git integration. Open Git Status in vertical split
map <leader>g :Git<CR>
map <leader>G :vertical Git<CR>

" Change NVIM Working Directory
" Usefull when using fzf to open a file and instantly change NVIM working dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remaps for telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>lb <cmd>Telescope buffers<cr>
nnoremap <leader>lh <cmd>Telescope help_tags<cr>
nnoremap <leader>lf <cmd>Telescope filetypes<cr>
