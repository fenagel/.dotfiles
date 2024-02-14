-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { gohtml = "gohtml" } })
vim.o.conceallevel = 2
-- Fixes Notify opacity issues
vim.o.termguicolors = true
