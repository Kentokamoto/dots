"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
set foldmethod=syntax

" Trailing Whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
