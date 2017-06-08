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
map <C-p> :Startify<CR>

"
"PLUGINS
"
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'a-nikolaev/vim-boltzmann'
	Plug 'gcmt/taboo.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'isruslan/vim-es6'
  Plug 'jelera/vim-javascript-syntax'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'mhinz/vim-startify'
  Plug 'mxw/vim-jsx'
  Plug 'othree/html5.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'pearofducks/ansible-vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-sensible'
  Plug 'trevordmiller/nova-vim'
	Plug 'vim-javascript'
	Plug 'vim-airline/vim-airline'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"NERDTree
let NERDTreeMinimalUI=1
let NERDTreeWinPos='right'
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.DS_Store','.git$','\.pyc$']
exec 'autocmd filetype nerdtree syntax match hideBracketsInNerdTree "[\]|\[]*" contained conceal containedin=ALL'
exec 'autocmd filetype nerdtree set conceallevel=3'
exec 'autocmd filetype nerdtree set concealcursor=nvic'
let g:NERDTreeIndicatorMapCustom= {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "~",
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
let projectDirs=split(globpath('~/triptease', '*'), '\n')
for d in projectDirs
  let dArr=split(d,"/")
  let projectList=projectList + [[ dArr[-1], 'call OpenProject("'.d.'")']]
endfor

let g:startify_custom_header=[]
let g:startify_list_order=['commands']
let g:startify_commands=projectList

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list= 1
let g:syntastic_auto_loc_list= 1
let g:syntastic_check_on_open= 1
let g:syntastic_check_on_wq= 1
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

let g:syntastic_ansible_checkers= ['ansible-lint']
let g:syntastic_css_checkers= ['csslint']
let g:syntastic_dockerfile_checkers= ['dockerfile-lint']
let g:syntastic_html_checkers= ['eslint']
let g:syntastic_javascript_checkers= ['eslint']
let g:syntastic_json_checkers= ['jsonlint']
let g:syntastic_yaml_checkers= ['yamllint']

