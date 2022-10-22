" Plugins
" =================================================
" Vim-Plug
call plug#begin()
Plug 'luochen1990/rainbow'
Plug 'shaunsingh/nord.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Langauge server
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Vim Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git Browsing
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Better code block context
Plug 'wellle/context.vim'
call plug#end()

" General
" =================================================
" Line Numbers
set relativenumber
set number

" Mapping from VIM
" hlsearch enabled by default
" incsearch enabled by default
"
set autochdir

" Look for tags file
" tags defaults ot "./tags;,tags"

" Status Bar
" vim-airline also configures the statusline
let g:airline_theme='wombat'
set laststatus=2

" Tabs

" Coloring
" Syntax enabled by default
" background set to dark by default
let g:rainbow_active=1 " from luochen1990/rainbow plugin
" colorscheme nord

" Indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Pane Splitting
set splitright
set splitbelow

set cursorline	
" Last-Position-Jump
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

" Force Write
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

" Plugin Settings
" =================================================
" Fuzzy Finding
nnoremap <C-f> :FZF
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <C-P> :ProjectFiles<CR>


