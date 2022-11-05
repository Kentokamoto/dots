--- Install Packer if not yet installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

--- Autocommand that reloads neovim whenever you save this file.
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
    augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("shaunsingh/nord.nvim")
	use("christoomey/vim-tmux-navigator")
	-- File Explorer
	use("nvim-tree/nvim-tree.lua")
	-- Statusline
	use("nvim-lualine/lualine.nvim")
	-- Fuzzy Finding
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	-- CMP Plugins
	use("hrsh7th/nvim-cmp") -- Completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer Completion
	use("hrsh7th/cmp-path") -- Path Completion
	use("hrsh7th/cmp-cmdline") -- cmdline completion
	use("hrsh7th/cmp-nvim-lsp") -- cmdline completion
	use("windwp/nvim-autopairs") -- Parenthesis autopair
	-- Snippets
	use("L3MON4D3/LuaSnip") -- Snippets Plugin
	use("rafamadriz/friendly-snippets") -- Snippets for many languages
	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason-lspconfig.nvim")
	use("williamboman/mason.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag") -- HTML Autotagging
	use("nvim-treesitter/nvim-treesitter-context")
	-- Git signs
	use("antoniomayk/nvim-gitsigns")

	-- Fugitive
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- Surround words
	use("tpope/vim-surround")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
