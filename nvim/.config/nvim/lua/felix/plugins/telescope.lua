return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"joshmedeski/telescope-smart-goto.nvim",
	},
	config = function()
		local icons = require("felix.utils.icons")
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				prompt_prefix = icons.ui.Telescope .. " ",
				selection_caret = icons.ui.Forward .. " ",
				entry_prefix = "   ",
				initial_mode = "insert",
				color_devicons = true,
				file_ignore_patterns = { ".git/", "node_modules" },
				layout_config = {
					height = 0.90,
					width = 0.90,
					preview_cutoff = 0,
					horizontal = { preview_width = 0.60 },
					vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				path_display = { "truncate" },

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
					n = {
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				live_grep = {
					theme = "dropdown",
				},

				grep_string = {
					theme = "dropdown",
				},

				find_files = {
					theme = "dropdown",
					previewer = false,
				},

				-- buffers = {
				-- 	theme = "dropdown",
				-- 	previewer = false,
				-- 	initial_mode = "normal",
				-- 	mappings = {
				-- 		i = {
				-- 			["<C-d>"] = actions.delete_buffer,
				-- 		},
				-- 		n = {
				-- 			["dd"] = actions.delete_buffer,
				-- 		},
				-- 	},
				-- },

				planets = {
					show_pluto = true,
					show_moon = true,
				},

				colorscheme = {
					enable_preview = true,
				},

				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
		-- local telescope = require("telescope")
		-- local actions = require("telescope.actions")
		--
		-- telescope.setup({
		-- 	-- configure custom mappings
		-- 	defaults = {
		-- prompt_prefix = icons.ui.Telescope .. " ",
		-- selection_caret = icons.ui.Forward .. " ",
		-- entry_prefix = "   ",
		-- initial_mode = "insert",
		-- path_display = { "smart" },
		-- color_devicons = true,
		-- 		file_ignore_patterns = { ".git/", "node_modules" },
		-- 		layout_config = {
		-- 			height = 0.90,
		-- 			width = 0.90,
		-- 			preview_cutoff = 0,
		-- 			horizontal = { preview_width = 0.60 },
		-- 			vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
		-- 			prompt_position = "top",
		-- 		},
		-- 		sorting_strategy = "ascending",
		-- 		path_display = { "truncate" },
		-- 		mappings = {
		-- 			i = {
		-- 				["<C-k>"] = actions.move_selection_previous, -- move to prev result
		-- 				["<C-j>"] = actions.move_selection_next, -- move to next result
		-- 				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
		-- 			},
		-- 		},
		-- 	},
		-- })

		telescope.load_extension("fzf")
		telescope.load_extension("smart_goto")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<cmd-p>", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Fuzzy find files in cwd" }) -- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Fuzzy find files in cwd" }) -- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }) -- find previously opened files
		keymap.set("n", "<leader>sl", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" }) -- find string in current working directory as you type
		keymap.set("n", "<leader>sg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" }) -- find string under cursor in current working directory
		keymap.set("n", "<leader>sh", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" }) -- show harpoon marks
	end,
}
