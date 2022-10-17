"LSP Options
let s:lsp_impl = 'vim-lsp'
"let s:lsp_impl = 'coc'

" Plugins
" ====================================================
" Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if s:lsp_impl == "vim-lsp"
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
elseif s:lsp_impl == "coc"
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'wellle/context.vim'
Plug 'psf/black', { 'branch': 'stable' }

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'ycm-core/YouCompleteMe'

" Programming Languages
Plug 'rust-lang/rust.vim'
" Initialize plugin system
call plug#end()

" General
" ===================================================
"" start w/ relative line numbers
set relativenumber
set number

"let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set hlsearch
set incsearch
set autochdir
" Look for tags file
set tags=tags;/

" status bar
set statusline+=%F
set laststatus=2
let g:rainbow_active = 1
let g:solarized_termcolors=256

" Coloring
syntax on
set background=dark
colorscheme nord

set termguicolors

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
hi CursorLine cterm=bold term=bold guibg=#2E3440
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
" Fuzzy Find
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <C-P> :ProjectFiles<CR>
" Folding
nnoremap <space> za
set foldlevelstart=99

" Force Write
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

if s:lsp_impl == "vim-lsp"
    " VIM-LSP
    let g:asyncomplete_auto_popup = 0
    let g:lsp_diagnostics_float_cursor = 1

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ asyncomplete#force_refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
elseif s:lsp_impl == "coc"
    " Conquorer of Completion
    set hidden
endif
" " You Complete Me
" let g:ycm_register_as_syntastic_checker = 1
" 
" " Clang-format
" function! ClangFormatonsave()
"     let l:formatdiff = 1
"     py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py
" endfunction

" You Complete Me
let g:ycm_register_as_syntastic_checker = 1


