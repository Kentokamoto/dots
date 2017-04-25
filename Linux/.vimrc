" General
" ======
"" start w/ relative line numbers
set relativenumber

let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2

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

"" 'space + <char>' to insert character <char>
nnoremap <Space> i_<Esc>r

"" show trailing spaces as '_', tabs as '>   '
"set list listchars=tab:>\ ,eol:Â¬,extends:Â,precedes:Â«
"set list listchars=tab:\ \ ,trail:_,extends:Â»,precedes:Â«
"map <leader>lc :set list!<cr>

" status bar
set laststatus=2
let g:airline_theme='jellybeans'


"" enable folder/project -specific vimrc
"set exrc
"" ... and restrict what you can do with it
"set secure

"" ycm options

syntax on
color koehler

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab

" Omni Complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Auto Completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>


function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"
