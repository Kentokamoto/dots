"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
set foldmethod=syntax

" Trailing Whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Clang-format
function! ClangFormatonsave()
    let l:formatdiff = 1
    py3f /usr/local/Cellar/llvm@13/13.0.1_1/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call ClangFormatonsave()
autocmd BufNewFile,BufRead *.cpp set formatprg=clang-format
