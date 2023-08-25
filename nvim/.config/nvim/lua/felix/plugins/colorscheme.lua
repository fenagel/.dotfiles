return {
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme nightfly]])
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatBoarder", { bg = "none" })

			local augroup = vim.api.nvim_create_augroup
			local autocmd = vim.api.nvim_create_autocmd
			local yank_group = augroup("HighlightYank", {})

			autocmd("TextYankPost", {
				group = yank_group,
				pattern = "*",
				callback = function()
					vim.highlight.on_yank({
						higroup = "IncSearch",
						timout = 40,
					})
				end,
			})
		end,
	},
}
