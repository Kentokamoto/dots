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
    return "\<C-N>"                         	  " slight modification was : \<C-X>\<C-P>
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

