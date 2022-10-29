local opt = vim.opt

-- line numbers
-- opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- Use system clipboard
opt.clipboard:append("unnamedplus")

-- Window Splits
opt.splitright = true
opt.splitbelow = true

-- Mouse support
opt.mouse = "v" -- Visual mode only

-- Cursor position
vim.cmd[[augroup RememberCursorPosition
    autocmd!  
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
augroup END  
]]
