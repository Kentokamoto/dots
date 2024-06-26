-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = "vn"
vim.opt.relativenumber = false

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  command = "set filetype=ejs",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.kdl",
  command = "set filetype=kdl",
})

vim.opt.maxmempattern = 10000
vim.opt.shiftwidth = 4
vim.re = 0
