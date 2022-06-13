" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
set foldmethod=indent

" Trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
