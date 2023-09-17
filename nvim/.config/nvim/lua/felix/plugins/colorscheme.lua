return {
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- -- load the colorscheme here
			vim.cmd([[colorscheme nightfly]])
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	opts = {
	-- 		flavour = "mocha",
	-- 		transparent_background = true,
	-- 		integrations = {
	-- 			cmp = true,
	-- 			fidget = true,
	-- 			gitsigns = true,
	-- 			harpoon = true,
	-- 			lsp_trouble = true,
	-- 			mason = true,
	-- 			neotest = true,
	-- 			noice = true,
	-- 			notify = true,
	-- 			octo = true,
	-- 			telescope = {
	-- 				enabled = true,
	-- 			},
	-- 			treesitter = true,
	-- 			treesitter_context = false,
	-- 			symbols_outline = true,
	-- 			illuminate = true,
	-- 			which_key = true,
	-- 			barbecue = {
	-- 				dim_dirname = true,
	-- 				bold_basename = true,
	-- 				dim_context = false,
	-- 				alt_background = false,
	-- 			},
	-- 			native_lsp = {
	-- 				enabled = true,
	-- 				virtual_text = {
	-- 					errors = { "italic" },
	-- 					hints = { "italic" },
	-- 					warnings = { "italic" },
	-- 					information = { "italic" },
	-- 				},
	-- 				underlines = {
	-- 					errors = { "underline" },
	-- 					hints = { "underline" },
	-- 					warnings = { "underline" },
	-- 					information = { "underline" },
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- Configure LazyVim to load colorscheme
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "nightfly",
	-- 	},
	-- },
}
