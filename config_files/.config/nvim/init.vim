" Author:
"     Sergio Quijano Rey
"     sergiquijano@gmail.com
" Description:
"     CONFIG FILE FOR NEOVIM
" TODO -- add a plugin in order to make easier to comment out blocks of code

" PLUGIN MANAGER
"===============================================================================
call plug#begin('~/.local/share/nvim/plugged')

    " General purpose
    "===========================================================================
    Plug 'scrooloose/nerdtree'          " File exploring
    Plug 'junegunn/fzf.vim'             " Fuzzy Finder
    Plug 'tpope/vim-fugitive'           " Git Integration
    Plug 'jremmen/vim-ripgrep'          " Searching into multiple files
    Plug 'psliwka/vim-smoothie'         " Smooth scrolling

    " Editor
    "===========================================================================
    Plug 'jiangmiao/auto-pairs'         " Autoclose brackets, parenthesis...

    " Visual
    "===========================================================================
    Plug 'vim-airline/vim-airline'          " Status bar. Lightline is a lighter alternative
    Plug 'vim-airline/vim-airline-themes'   " Status bar themes
    Plug 'junegunn/goyo.vim'                " Focus Mode
    Plug 'ryanoasis/vim-devicons'           " Icons for NerdTree

    " Autocompleters
    "===========================================================================
    Plug 'neoclide/coc.nvim'            " Code Autocompletion and other utils

    " Linters
    "===========================================================================
    Plug 'w0rp/ale'                     " Real time linting

    " Color schemes
    "===========================================================================
    Plug 'gruvbox-community/gruvbox'    " Gruvbox Theme updated

call plug#end()

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

" Four spaces instead of tab
filetype plugin indent on
set smarttab                            " Set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Remove trailing white spaces
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

" Fuzzy File Finder
map <leader>p :FZF<CR>

" Open Nerd Tree
map <leader>o :NERDTreeToggle<CR>

" For exiting the terminal mode
tnoremap <leader><Esc> <C-\><C-n>>

" For avoid shifting
map <S-Up> <C-Up>
map <S-Down> <C-Down>

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

" Go to Definition -- uses coc.nvim
map<leader>d <Plug>(coc-definition)

" Renaming -- Uses coc.nvim
map<leader>r <Plug>(coc-rename)

" Git integration. Open Git Status in vertical split
map <leader>g :Git<CR>
map <leader>G :vertical Git<CR>

" Change NVIM Working Directory
" Usefull when using fzf to open a file and instantly change NVIM working dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" PLUGINS CONFIGURATION
"=============================================================================
" Set the airline theme
let g:airline_theme='bubblegum'

" Allow powerline font (instead of straight borders, triangle borders)
let g:airline_powerline_fonts = 1

" Better tab display for airline
" Got from https://www.reddit.com/r/vim/comments/crs61u/best_airline_settings/
let g:airline#extensions#tabline#enabled = 1            " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0  " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''        " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''     " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#tab_min_count = 2      " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_buffers = 0       " dont show buffers in the tabline
let g:airline#extensions#tabline#show_splits = 0        " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0        " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0      " disables the weird orange arrow on the tabline

" COC Config
"===============================================================================
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Go To
map <leader>qd <Plug>(coc-definition)

" show documentation in preview window.
map <leader>qk :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Renaming
map <leader>qr <Plug>(coc-rename)

" Autofix
map <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
