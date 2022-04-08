" Plugins
" ====================================================
" Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe'
Plug 'arcticicestudio/nord-vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'vim-syntastic/syntastic'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'CoatiSoftware/vim-sourcetrail'
"Plugin 'mbbill/undotree'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'tpope/vim-markdown'
"Plugin 'yuratomo/w3m.vim'

" Initialize plugin system
call plug#end()

" General
" ===================================================
"" start w/ relative line numbers
set relativenumber
set number

"let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2
set hlsearch
set incsearch
set autochdir
" Look for tags file
set tags=tags;/

" status bar
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
nnoremap <C-P> :FZF<CR>

" Folding
nnoremap <space> za
set foldlevelstart=99

" Force Write
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

" Conquorer of Completion
set hidden
" LSP
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'allowlist': ['python'],
"         \ })
" endif
" 
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd', '-background-index']},
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"         \ })
" endif
" 
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gs <plug>(lsp-document-symbol-search)
"     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"     inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"     inoremap <buffer> <expr><c-d> lsp#scroll(-4)
" 
"     let g:lsp_format_sync_timeout = 1000
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"     
"     " refer to doc to add more commands
" endfunction
" 
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" 
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

" Clang-format
function! ClangFormatonsave()
    let l:formatdiff = 1
    py3f /usr/local/Cellar/llvm/13.0.1_1/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call ClangFormatonsave()
map <C-K> :py3f /usr/local/opt/llvm/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/local/opt/llvm/share/clang/clang-format.py<cr>
autocmd BufNewFile,BufRead *.cpp set formatprg=clang-format
