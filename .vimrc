"presentation
set number
set ruler
set colorcolumn=160

"standards
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

"annoyances
set noerrorbells
set novisualbell

"custom key mappings
nmap ; :

"refresh buffer on file change
set autoread

"yank to clipboard
set clipboard=unnamed

"normal copy/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
