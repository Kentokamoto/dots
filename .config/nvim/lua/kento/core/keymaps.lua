vim.g.mapleader = " "
vim.keymap.set("n", "x", '"_x')

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- Next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- Prev tab

-- Nvim Tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>") -- Open File Explorer

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope git_files<CR>") -- Open File Explorer
vim.keymap.set("n", "<leader>fs", "<cmd> Telescope live_grep<CR>") -- Open File Explorer
vim.keymap.set("n", "<leader>fc", "<cmd> Telescope grep_string<CR>") -- Open File Explorer
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers<CR>") -- Open File Explorer
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags<CR>") -- Open File Explorer
