vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- { "catppuccin/nvim", name = "catppuccin" },
	{
		"folke/tokyonight.nvim",
		config = { transparent = true },
		opts = {
			style = "moon",
			styles = {
				floats = "transparent",
				sidebars = "transparent",
			},
			overrides = {
				-- TelescopeMatching = { fg = colors.flamingo },
				-- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
				-- TelescopePromptPrefix = { bg = colors.surface0 },
				-- TelescopeResultsNormal = { bg = colors.mantle },
				-- TelescopePreviewNormal = { bg = colors.mantle },
				-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
				-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
				-- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
				-- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
				-- TelescopeResultsTitle = { fg = colors.mantle },
				-- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
				TelescopePromptNormal = { bg = "#1d2021" },
			},
			dim_inactive = false,
		},
	},

	-- { "olivercederborg/poimandres.nvim", opts = nil },
	-- { "rmehri01/onenord.nvim", opts = nil },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	opts = {
	-- 		contrast = "hard",
	-- 		-- palette_overrides = {
	-- 		-- 	gray = "#2ea542",
	-- 		-- },
	-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 		overrides = {
	-- 			-- TelescopeMatching = { fg = colors.flamingo },
	-- 			-- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
	-- 			-- TelescopePromptPrefix = { bg = colors.surface0 },
	-- 			-- TelescopeResultsNormal = { bg = colors.mantle },
	-- 			-- TelescopePreviewNormal = { bg = colors.mantle },
	-- 			-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
	-- 			-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
	-- 			-- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
	-- 			-- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
	-- 			-- TelescopeResultsTitle = { fg = colors.mantle },
	-- 			-- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
	-- 			TelescopePromptNormal = { bg = "#1d2021" },
	-- 		},
	-- 		dim_inactive = false,
	-- 		transparent_mode = false,
	-- 	},
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = { "c", "lua", "vim", "go", "javascript", "typescript", "rust", "vue", "scss", "css" },
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			context_commentstring = { enable = true, enable_autocmd = false },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		version = false,
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-j>"] = function(...)
							return require("telescope.actions").move_selection_next(...)
						end,
						["<C-k>"] = function(...)
							return require("telescope.actions").move_selection_previous(...)
						end,
						["<C-u>"] = function(...)
							return require("telescope.actions").preview_scrolling_down(...)
						end,
						["<C-d>"] = function(...)
							return require("telescope.actions").preview_scrolling_up(...)
						end,
					},
					n = {
						["q"] = function(...)
							return require("telescope.actions").close(...)
						end,
					},
				},
			},
		},
	},
	{ "onsails/lspkind-nvim", dependencies = "famiu/bufdelete.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = function()
			local function getWords()
				if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
					if vim.fn.wordcount().visual_words == 1 then
						return tostring(vim.fn.wordcount().visual_words) .. " word"
					elseif not (vim.fn.wordcount().visual_words == nil) then
						return tostring(vim.fn.wordcount().visual_words) .. " words"
					else
						return tostring(vim.fn.wordcount().words) .. " words"
					end
				else
					return ""
				end
			end

			-- local lineNum = vim.api.nvim_win_get_cursor(0)[1]
			local function getLines()
				return tostring(vim.api.nvim_win_get_cursor(0)[1]) .. "/" .. tostring(vim.api.nvim_buf_line_count(0))
			end

			local function getColumn()
				local val = vim.api.nvim_win_get_cursor(0)[2]
				-- pad value to 3 units to stop geometry shift
				return string.format("%03d", val)
			end

			local function diff_source()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end
			return {
				options = {
					icons_enabled = true,
					globalstatus = true,
					theme = "tokyonight",
					component_separators = { " ", " " },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch", icon = "" },
						{
							"diff",
							source = diff_source,
							color_added = "#a7c080",
							color_modified = "#ffdf1b",
							color_removed = "#ff6666",
						},
					},
					lualine_c = {
						{ "diagnostics", sources = { "nvim_diagnostic" } },
						function()
							return "%="
						end,
						"filename",
						{
							getWords,
							color = { fg = "#333333", bg = "#eeeeee" },
							separator = { left = "", right = "" },
						},
					},
					lualine_x = { "filetype" },
					lualine_y = {},
					lualine_z = {
						{ getColumn, padding = { left = 1, right = 0 } },
						{ getLines, icon = "", padding = 1 },
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {
					"quickfix",
				},
			}
		end,
	},
	"fatih/vim-go",
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			-- local luasnip = require("luasnip")
			-- local has_words_before = function() end
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-e>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					-- ["<S-CR>"] = cmp.mapping.confirm({
					-- 	behavior = cmp.ConfirmBehavior.Replace,
					-- 	select = true,
					-- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "copilot" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						maxwidth = 50,
						menu = {
							buffer = "",
							copilot = "",
							cmp_tabnine = "9",
							nvim_lsp = "",
							spell = "",
							look = "",
						},
					}),
				},
			}
		end,
	}, -- Required
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		keys = {
			{
				"<A-j>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<A-j>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<A-k>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	}, -- Required
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion

			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			"hrsh7th/cmp-buffer", -- Optional
			"hrsh7th/cmp-path", -- Optional
			"saadparwaiz1/cmp_luasnip", -- Optional
			"rafamadriz/friendly-snippets", -- Optional
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		opts = {
			direction = "horizontal",
			size = 15,
			open_mapping = [[<A-h>]],
		},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	"ThePrimeagen/harpoon",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth",
		opts = {
			cmp = {
				enabled = true,
				method = "getCompletionsCycling",
			},
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<C-a>",
					accept_word = false,
					accept_line = false,
					next = "<A-j>",
					prev = "<A-k>",
					dismiss = "<C-q>",
				},
			},
		},
		filetypes = {
			yaml = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 16.x
		server_opts_overrides = {},
	},
	{
		"zbirenbaum/copilot-cmp",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.flake8,
					nls.builtins.formatting.prettier.with({
						extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
					}),
				},
			}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "BufReadPre",
		opts = {
			numhl = true,
			signcolumn = false,
		},
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline" },
	},
	"NvChad/nvim-colorizer.lua",
})

-- some
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
		winblend = 10,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>p", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
-- Search and replace word under cursor
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Quick new file
vim.keymap.set("n", "<Leader>n", "<cmd>enew<CR>")
-- Easy select all of file
vim.keymap.set("n", "<Leader>sa", "ggVG<c-$>")
-- Maintain the cursor position when yanking a visual selection
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")
-- Keep search results centred
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--After searching, pressing escape stops the highlight
vim.keymap.set("n", "<esc>", ":noh<cr><esc>", { silent = true })
vim.keymap.set("", "<leader>w", ":w<CR>")
vim.keymap.set("", "<leader>q", ":q<CR>")
-- GO error boiler plate macro
vim.keymap.set("n", "<leader>e", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])
-- Harpoon
local silent = { silent = true }
vim.keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, silent)
vim.keymap.set("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)
vim.keymap.set("n", "<C-h>", function()
	require("harpoon.ui").nav_file(1)
end, silent)
vim.keymap.set("n", "<C-j>", function()
	require("harpoon.ui").nav_file(2)
end, silent)
vim.keymap.set("n", "<C-k>", function()
	require("harpoon.ui").nav_file(3)
end, silent)
vim.keymap.set("n", "<C-l>", function()
	require("harpoon.ui").nav_file(4)
end, silent)

-- LSP
local lsp = require("lsp-zero")
require("cmp_nvim_lsp")
local signs = {

	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"gopls",
	"eslint",
	"volar",
	"rust_analyzer",
})

lsp.set_preferences({
	sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
end)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.cmd("colorscheme tokyonight")
vim.cmd("au ColorScheme * hi! Normal guibg=NONE")
vim.cmd("au ColorScheme * hi! SignColumn guibg=NONE")
vim.cmd("au ColorScheme * hi! LineNr guibg=NONE")
vim.cmd("au ColorScheme * hi! CursorLineNr guibg=NONE")
vim.cmd("au ColorScheme * hi! Normal guibg=none")

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	pattern = "*",
})
-- HighlightYank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

vim.o.background = "dark"

vim.keymap.set("i", "jj", "<Esc>")

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.guicursor = "i:block"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.inccommand = "split" -- Get a preview of replacements
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:1" -- always show signcolumns
vim.opt.colorcolumn = "80"
