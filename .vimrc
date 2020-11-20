" General
" ======
"" start w/ relative line numbers
set relativenumber
set number
let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s+$/
set hlsearch
set incsearch
set autochdir

" Plugins
" =======
"
" vundle
""filetype must be turned off before vundle commands
filetype off
""" set the runtime path to include vundle, and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

""" vundle modules to load
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/AutoComplPop'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-markdown'
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

" status bar
set laststatus=2
let g:airline_theme='jellybeans'

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
