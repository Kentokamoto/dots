" Plugins
" ====================================================
"
" vundle
""filetype must be turned off before vundle commands
filetype off
""" set the runtime path to include vundle, and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

""" vundle modules to load
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'mbbill/undotree'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-markdown'
Plugin 'luochen1990/rainbow'
Plugin 'preservim/nerdtree'
"Plugin 'yuratomo/w3m.vim'
call vundle#end()
"
""" helpful vundle hints (to be run inside vim)
":PluginList - list plugins
":PluginInstall - install plugins
":PluginInstall! - update plugins
":PluginSearch foo - search for plugin foo
":PluginClean - remove unused plugins
"
"" turn filetype recognition back on
filetype plugin indent on

" save and load folds automatically
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

"" 'control+n' to reset highlighting (e.g. after a search or search/replace)
"nnoremap <C-n> :nohl<CR>

" General
" ===================================================
"" start w/ relative line numbers
set relativenumber
set number
"let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
set hlsearch
set incsearch
set autochdir

" Look for tags file
set tags=tags;/

" status bar
set laststatus=2
let g:airline_theme='jellybeans'
let g:rainbow_active = 1

syntax on
color elflord

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Split section
set splitright
set splitbelow

" Highlight characters in red if the 80 char limit has been reached
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set cursorline
hi CursorLine cterm=bold term=bold guibg=Grey40
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Some odd backspace thing?
set backspace=indent,eol,start
" Fuzzy Find
nnoremap <C-f> :FZF

" VUNDLE PLUGIN SETTINGS
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" GLOBAL GNU TAGS SETTINGS
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Absolute_Path = 1

" Folding
nnoremap <space> za
set foldlevelstart=99
