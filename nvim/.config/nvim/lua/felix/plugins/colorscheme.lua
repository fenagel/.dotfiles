return {
	-- {
	-- 	"LunarVim/primer.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[colorscheme primer_dark]])
	-- 	end,
	-- },
	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- -- load the colorscheme here
	-- 		vim.cmd([[colorscheme nightfly]])
	-- 	end,
	-- },
	-- {
	-- 	"luisiacc/gruvbox-baby",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- -- load the colorscheme here
	-- 		vim.g.gruvbox_baby_transparent_mode = 1
	-- 		vim.cmd([[colorscheme gruvbox-baby]])
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
					SignColumn = { bg = "none", fg = "none" },

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
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- local bg = "#011628"
	-- 		-- local bg_dark = "#011423"
	-- 		-- local bg_highlight = "#143652"
	-- 		-- local bg_search = "#0A64AC"
	-- 		-- local bg_visual = "#275378"
	-- 		-- local fg = "#CBE0F0"
	-- 		-- local fg_dark = "#B4D0E9"
	-- 		-- local fg_gutter = "#627E97"
	-- 		-- local border = "#547998"
	--
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			-- on_colors = function(colors)
	-- 			-- 	colors.bg = bg
	-- 			-- 	colors.bg_dark = bg_dark
	-- 			-- 	colors.bg_float = bg_dark
	-- 			-- 	colors.bg_highlight = bg_highlight
	-- 			-- 	colors.bg_popup = bg_dark
	-- 			-- 	colors.bg_search = bg_search
	-- 			-- 	colors.bg_sidebar = bg_dark
	-- 			-- 	colors.bg_statusline = bg_dark
	-- 			-- 	colors.bg_visual = bg_visual
	-- 			-- 	colors.border = border
	-- 			-- 	colors.fg = fg
	-- 			-- 	colors.fg_dark = fg_dark
	-- 			-- 	colors.fg_float = fg
	-- 			-- 	colors.fg_gutter = fg_gutter
	-- 			-- 	colors.fg_sidebar = fg_dark
	-- 			-- end,
	-- 			transparent = true,
	-- 			styles = {
	-- 				sidebars = "transparent",
	-- 				floats = "transparent",
	-- 			},
	-- 		})
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		local dracula = require("dracula")
	-- 		dracula.setup({
	-- 			transparent_bg = true,
	-- 		})
	-- 		-- -- load the colorscheme here
	-- 		vim.cmd([[colorscheme dracula]])
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local gruvbox = require("gruvbox")
	-- 		gruvbox.setup({
	-- 			terminal_colors = true, -- add neovim terminal colors
	-- 			undercurl = true,
	-- 			underline = true,
	-- 			bold = true,
	-- 			italic = {
	-- 				strings = true,
	-- 				emphasis = true,
	-- 				comments = true,
	-- 				operators = false,
	-- 				folds = true,
	-- 			},
	-- 			strikethrough = true,
	-- 			invert_selection = false,
	-- 			invert_signs = false,
	-- 			invert_tabline = false,
	-- 			invert_intend_guides = false,
	-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 			contrast = "", -- can be "hard", "soft" or empty string
	-- 			palette_overrides = {},
	-- 			overrides = {},
	-- 			dim_inactive = false,
	-- 			transparent_mode = true,
	-- 		})
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
}
