local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local whichkey_setup, whichkey = pcall(require, "which-key")
if not whichkey_setup then
	return
end

whichkey.setup()

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})

telescope.load_extension("fzf")
