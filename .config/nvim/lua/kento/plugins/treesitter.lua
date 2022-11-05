local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local context_ok, context = pcall(require, "treesitter-context")
if not context_ok then
	return
end

require("nvim-ts-autotag").setup()

context.setup({
	mode = "topline",
})

configs.setup({
	encure_installed = "maintained",
	sync_install = false,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
