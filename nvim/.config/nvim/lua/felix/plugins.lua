local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- measure startup time
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})

	-- faster loading of filetypes in nvim
	use({ "nathom/filetype.nvim" })

	-- Themes
	use({ "gruvbox-community/gruvbox" })
	-- use({ "sainnhe/everforest" })
	-- use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "folke/tokyonight.nvim" })
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	-- use("bluz71/vim-nightfly-guicolors")

	use({
		"norcalli/nvim-colorizer.lua",
	})

	-- icons
	use({ "kyazdani42/nvim-web-devicons" })

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Harpoon window management
	use({ "ThePrimeagen/harpoon" })

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")
	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{
				"tzachar/cmp-tabnine",
				run = "./install.sh",
			},
			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
		},
	})

	-- Snippets, Language, Syntax
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
	use({ "darrikonn/vim-gofmt" })
	use({ "rafamadriz/friendly-snippets", module = { "cmp", "cmp_nvim_lsp" }, event = "InsertEnter" })

	-- File Explorer Tree
	use({ "kyazdani42/nvim-tree.lua" })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
	})

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	use({ "nvim-lua/lsp_extensions.nvim" })
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- General
	use({
		"numToStr/Comment.nvim",
	})

	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-surround" })
	use({ "glepnir/lspsaga.nvim" })
	use({
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline" },
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
