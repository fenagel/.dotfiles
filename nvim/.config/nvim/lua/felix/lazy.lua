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
	-- -- add LazyVim and import its plugins
	-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

	-- additional plugins
	-- { import = "lazyvim.plugins.extras.lang.go" },
	-- { import = "lazyvim.plugins.extras.lang.json" },
	-- { import = "lazyvim.plugins.extras.lang.tailwind" },
	-- { import = "lazyvim.plugins.extras.lang.typescript" },
	-- { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

	-- import all plugins from the plugins folder
	{ import = "felix.plugins.lsp" },
	{ import = "felix.plugins" },
}, {
	install = { colorscheme = { "rose-pine", "nightfly", "catppuccin", "tokyonight" } },
	ui = {
		border = "single",
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
