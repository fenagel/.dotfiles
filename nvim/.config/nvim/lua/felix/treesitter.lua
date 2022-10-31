-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	autotag = { enable = true },
})
