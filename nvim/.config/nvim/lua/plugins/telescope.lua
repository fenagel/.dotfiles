return {
	"nvim-telescope/telescope.nvim",
	opts = function()
		local actions = require("telescope.actions")

		local open_with_trouble = function(...)
			return require("trouble.providers.telescope").open_with_trouble(...)
		end
		local open_selected_with_trouble = function(...)
			return require("trouble.providers.telescope").open_selected_with_trouble(...)
		end

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				-- open files in the first window that is an actual file.
				-- use the current window if no other window is available.
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						["<c-t>"] = open_with_trouble,
						["<a-t>"] = open_selected_with_trouble,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["q"] = actions.close,
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
				},
				layout_config = {
					height = 0.90,
					width = 0.90,
					preview_cutoff = 0,
					horizontal = { preview_width = 0.60 },
					vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
		}
	end,
}
