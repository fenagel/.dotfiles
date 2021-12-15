local vim = vim
local api = vim.api
local M = {}
function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function M.mapBuf(buf, mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

M.map("n", "<Leader>f", "<cmd>Format<cr>")
M.map("n", "<c-p>", "<cmd>lua require('fn.telescope').find_files()<cr>")
M.map("n", "<Leader>h", "<cmd>lua require('fn.telescope').help_tags()<cr>")
M.map("n", "<Leader>a", "<cmd>Telescope live_grep<cr>")
M.map("n", "<Leader>b", "<cmd>Telescope buffers<cr>")
-- Allow gf to open non-existing files
M.map("", "gf", ":edit <cfile><cr>")
-- Reselect visual selection after indenting
M.map("v", "<", "<gv")
M.map("v", ">", ">gv")
-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
M.map("v", "y", "myy`y")
M.map("v", "Y", "myY`y")
-- Paste replace visual selection without copying it
M.map("v", "<leader>p", '"_dP')
-- Make Y behave like the other capitals
M.map("n", "Y", "y$")
-- Keep it centered
M.map("n", "n", "nzzzv")
M.map("n", "N", "Nzzzv")
M.map("n", "J", "mzJ`z")
M.map("n", "<Leader>u", "<cmd>PackerUpdate<cr>")
-- Movement
M.map('n', '<leader>ne', ':NERDTreeToggle<CR>')
M.map('n', '<leader>h', ':wincmd h<CR>')
M.map('n', '<leader>j', ':wincmd j<CR>')
M.map('n', '<leader>k', ':wincmd k<CR>')
M.map('n', '<leader>l', ':wincmd l<CR>')
M.map('n', '<leader>+', ':vertical resize +5<CR>')
M.map('n', '<leader>-', ':vertical resize -5<CR>')
M.map('n', '<c-s>', ':w<CR>')
M.map('n', '<leader>q', ':q<CR>')
--Vim Config edits
M.map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
M.map('n', '<leader>vr', ':source ~/.config/nvim/init.lua<cr>')

M.map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
M.map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
M.map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
M.map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")

M.map("i", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
M.map("i", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
M.map("i", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
M.map("i", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")

M.map("t", "<C-j>", "<c-\\><c-n>:TmuxNavigateDown<cr>")
M.map("t", "<C-k>", "<c-\\><c-n>:TmuxNavigateUp<cr>")
M.map("t", "<C-l>", "<c-\\><c-n>:TmuxNavigateRight<cr>")
M.map("t", "<C-h>", "<c-\\><c-n>:TmuxNavigateLeft<CR>")

return M
