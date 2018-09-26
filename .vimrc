"	sergiquijano@gmail.com
" Version
" 	v1.0 26/09/2018 - First functionaly version

" Plugins
"==============================================================================
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim' 			"Status bar
Plug 'scrooloose/nerdtree'			"File tree
Plug 'w0rp/ale'					"Linter
Plug 'junegunn/goyo.vim'			"ZenMode
Plug 'scrooloose/syntastic'			"Syntaxis color
Plug 'valloric/youcompleteme'			"Completion
Plug 'nathanaelkane/vim-indent-guides' 		"For indentation lines
Plug 'ErichDonGubler/vim-sublime-monokai'	"Sublime theme
call plug#end()

" Some basics
syntax enable
syntax on 
set hidden 
set history=100 

" Some editing config
set autoindent
set smartindent
set smarttab
  
" Some visuals 
set number
set hlsearch 			"Higlights what we searched
set laststatus=2 		"For the lightline plugin
colorscheme sublimemonokai	"Monokai theme
set termguicolors		"For best Monokai theme

" Keybindings
map <C-o> :NERDTreeToggle<CR> 		"Ctr+O for opening nerdtree
map <C-f> :Goyo<F11><CR>		"Ctr+f for fullscreen mode
