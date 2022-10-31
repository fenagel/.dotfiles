-- Telescope Global remapping
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = "> ",
		color_devicons = true,
		layout_strategy = "horizontal",
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
			},
		},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
