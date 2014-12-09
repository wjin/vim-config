""""""""""""""""""""""""""""""""""""""
" configure for Vundle
" https://github.com/gmarik/Vundle.vim
""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"
" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
"

" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'

" scripts not on GitHub
Bundle 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

" tags and search
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'cscope.vim'
Bundle 'grep.vim'

" IDE appearance
Bundle 'minibufexplorerpp'
Bundle 'winmanager'

Bundle 'a.vim'

"Bundle 'command-t'
Bundle 'xptemplate'

Bundle 'Valloric/YouCompleteMe'
"Bundle 'word_complete.vim'
"Bundle 'SuperTab'

Bundle 'Markdown-syntax'
Bundle 'instant-markdown.vim'

Bundle 'Syntastic'

filetype plugin indent on     " required

"To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line
"


""""""""""""""""""""""""""""""
" general configure
""""""""""""""""""""""""""""""

" record previous open location
if has("autocmd")  
	autocmd BufRead *.txt set tw=78  
	autocmd BufReadPost *  
	\if line("'\"") > 0 && line ("'\"") <= line("$") |  
	\	exe "normal g'\"" |  
	\endif  
endif

" fix chinese messy code
"let &termencoding=&encoding
"set fileencodings=gbk,utf-8,ucs-bom,cp936

set mouse=a
set noeb vb t_vb= "disable error beeping
"set lines=30 columns=80

set number
set splitright

colo evening
syntax enable
syntax on
set cul "highlight current row

set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" search configuration
set hlsearch "highlight
set magic "magic matching 
set showmatch "show matching brackets
set ignorecase "ingore case 
set smartcase  
set incsearch "incremental match

set pastetoggle=<F7>

" fold code
"set foldenable
"set foldlevel=3
"set foldmethod=syntax

" compile program
"let cur = getcwd()
"if cur == "/home/jinwei/coding/test"
"  set makeprg=g++\ -g\ -o\ %<.test\ %
"else 
"  set makeprg=g++\ -g\ -o\ %<\ %
"endif
set makeprg=g++\ -g\ -o\ %<\ %

""""""""""""""""""""""""""""""
" key mapping
""""""""""""""""""""""""""""""
"map <C-c> y  
"map <C-X> d  
map <C-A> <Esc>ggVG 

" quickfix
map <F2> :cn<CR>
map <F3> :cp<CR>
" compile program
map <F4> :make<CR> :copen<CR> <C-W>10_
" Grep.vim
nnoremap <silent> <F8> :Grep<CR>
" ctags shortcut
map <F9> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> :set tags=tags<CR>
" cscope shortcut
map <F10> :!/usr/local/bin/cscope -Rbq<CR> :cs add cscope.out<CR>


""""""""""""""""""""""""""""""
" quickfix
""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open when ':make' encounter errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


""""""""""""""""""""""""""""""
" taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window = 1
"let Tlist_Show_Menu = 1
"let Tlist_File_Fold_Auto_Close = 1


""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""
":set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


""""""""""""""""""""""""""""""
" MiniBufExplorer
""""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs = 1


""""""""""""""""""""""""""""""
" winmanager
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='NERDTree, BufExplorer|TagList'
nmap wm :WMToggle<cr>


""""""""""""""""""""""""""""""
" new-omni-completion
""""""""""""""""""""""""""""""
"filetype plugin indent on
"set completeopt=longest,menu


""""""""""""""""""""""""""""""
" SuperTab
""""""""""""""""""""""""""""""
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"


""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F5> :YcmDiags<CR>
