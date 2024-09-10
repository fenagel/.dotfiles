-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.guicursor = "i:block"
local opt = vim.opt
opt.cursorline = false
opt.tabstop = 4
opt.shiftwidth = 4
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.ignorecase = true

-- pandoc related

opt.spell = false
opt.foldmethod = "manual"
opt.foldenable = false

-- scrolling
-- opt.number = false
-- opt.relativenumber = false
opt.scrolloff = 8

-- wrap / break

opt.textwidth = 80
opt.linebreak = true

-- opt.background = "light"

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"
