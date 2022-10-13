-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({ highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true } })
