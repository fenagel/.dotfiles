return {
	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- -- load the colorscheme here
	-- 		vim.cmd([[colorscheme nightfly]])
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({ --- @usage 'auto'|'main'|'moon'|'dawn'
				variant = "auto",
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = "main",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = true,
				disable_float_background = true,
				disable_italics = false,

				--- @usage string hex value or named color from rosepinetheme.com/palette
				groups = {
					background = "base",
					background_nc = "_experimental_nc",
					panel = "surface",
					panel_nc = "base",
					border = "highlight_med",
					comment = "muted",
					link = "iris",
					punctuation = "subtle",

					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
					-- or set all headings at once
					-- headings = 'subtle'
				},

				-- Change specific vim highlight groups
				-- https://github.com/rose-pine/neovim/wiki/Recipes
				highlight_groups = {
					ColorColumn = { bg = "rose" },

					-- Blend colours against the "base" background
					CursorLine = { bg = "foam", blend = 10 },
					StatusLine = { fg = "love", bg = "love", blend = 10 },

					-- By default each group adds to the existing config.
					-- If you only want to set what is written in this config exactly,
					-- you can set the inherit option:
					Search = { bg = "gold", inherit = false },
				},
			})

			-- Set colorscheme after options
			vim.cmd("colorscheme rose-pine")
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
	-- -- Configure LazyVim to load colorscheme
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "catppuccin",
	-- 	},
	-- },
}
