" Config for airline plugin
"
" Set the airline theme
let g:airline_theme='bubblegum'

" Allow powerline font (instead of straight borders, triangle borders)
let g:airline_powerline_fonts = 1

" Better tab display for airline
" Got from https://www.reddit.com/r/vim/comments/crs61u/best_airline_settings/
let g:airline#extensions#tabline#enabled = 1            " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2      " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_buffers = 0       " dont show buffers in the tabline
let g:airline#extensions#tabline#show_splits = 0        " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0        " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0      " disables the weird orange arrow on the tabline
let g:airline#extensions#tabline#fnamemod = ':t'        " Show only filename in tab

" Avoid giving terminal tabs a bad name
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" Formatter for tabnames
let g:airline#extensions#tabline#formatter = 'unique_tail'
