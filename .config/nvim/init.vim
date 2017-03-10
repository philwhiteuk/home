"
"SETTINGS
"
so ~/.vimrc

"presentation
set syntax=on
set termguicolors

"custom file types
autocmd BufEnter * if expand('%:t') == "Jenkinsfile" | setlocal ft=groovy | endif

"custom key mappings
map <C-n> :NERDTreeTabsToggle<CR>

"
"PLUGINS
"
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'a-nikolaev/vim-boltzmann'
	Plug 'gcmt/taboo.vim'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'mhinz/vim-startify'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-sensible'
	Plug 'vim-javascript'
	Plug 'vim-airline/vim-airline'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"NERDTree
let NERDTreeMinimalUI=1
let NERDTreeWinPos='right'
exec 'autocmd filetype nerdtree syntax match hideBracketsInNerdTree "[\]|\[]*" contained conceal cchar=_ containedin=ALL'
exec 'autocmd filetype nerdtree set conceallevel=3'
exec 'autocmd filetype nerdtree set concealcursor=nvic'
let g:NERDTreeIndicatorMapCustom= {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "u",
    \ "Renamed"   : "*",
    \ "Unmerged"  : "",
    \ "Deleted"   : "!",
    \ "Dirty"     : "*",
    \ "Clean"     : "",
    \ 'Ignored'   : "",
    \ "Unknown"   : "?"
    \ }

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
  exec 'NERDTree ' . a:pd 
endfunction

let projectList=[]
let projectDirs=split(globpath('~/triptease,~/Documents/scripts', '*'), '\n')
for d in projectDirs
  let dArr=split(d,"/")
  let projectList=projectList + [[ dArr[-2] . '-' . dArr[-1], 'call OpenProject("'.d.'")']]
endfor

let g:startify_custom_header=[]
let g:startify_list_order=['commands']
let g:startify_commands=projectList

