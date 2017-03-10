"
"SETTINGS
"

"presentation
set number
set syntax
set ruler
set colorcolumn=160
set termguicolors

"standards
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

"annoyances
set noerrorbells
set novisualbell

"use shell aliases
set shellcmdflag=-ic

"custom file types
autocmd BufEnter * if expand('%:t') == "Jenkinsfile" | setlocal ft=groovy | endif

"custom key mappings
map <C-n> :NERDTreeTabsToggle<CR>

"
"PLUGINS
"
call plug#begin('~/.vim/plugged')
  Plug 'a-nikolaev/vim-boltzmann'
	Plug 'gcmt/taboo.vim'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'mhinz/vim-startify'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-sensible'
	Plug 'vim-javascript'
	Plug 'vim-airline/vim-airline'
call plug#end()

"Taboo
set sessionoptions+=tabpages,globals
let g:taboo_tab_format=" %f%m "
so ~/.vim/plugged/vim-boltzmann/colors/boltzmann.vim

"Startify
function! OpenProject(pd)
  exec 'lcd ' . a:pd
  sp new
  tab sp
  tabonly
  NERDTreeTabsOpen
endfunction

let projectList=[]
let projectDirs=split(globpath('~/triptease,~/Documents/scripts', '*'), '\n')
for d in projectDirs
  let projectList=projectList + [[ split(d,"/")[-1], 'call OpenProject("'.d.'")']]
endfor

let g:startify_custom_header=[]
let g:startify_list_order=['commands']
let g:startify_commands=projectList

