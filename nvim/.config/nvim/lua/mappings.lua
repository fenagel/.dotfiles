local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = " "
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<c-f>", "<cmd>Format<cr>")
-- Allow gf to open non-existing files
map("", "gf", ":edit <cfile><cr>")
-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map("v", "y", "myy`y")
map("v", "Y", "myY`y")
-- Paste replace visual selection without copying it
map("v", "<leader>p", '"_dP')
-- Make Y behave like the other capitals
map("n", "Y", "y$")
-- Keep it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "<Leader>u", "<cmd>PackerUpdate<cr>")
-- Movement
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('n', '<leader>+', ':vertical resize +5<CR>')
map('n', '<leader>-', ':vertical resize -5<CR>')
map('n', '<c-s>', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
--Vim Config edits
map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
map('n', '<leader>vr', ':source ~/.config/nvim/init.lua<cr>')
-- Telescope
map("n", "<c-p>", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>a", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
