-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)
-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })
-- Obsidian
-- navigate to vault
--/Users/fenagel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain
map("n", "<leader>oo", ":cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain<cr>")
--
-- convert note to template and remove leading white space
map("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
map("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
--
-- search for files in full vault
map(
  "n",
  "<leader>os",
  ':Telescope find_files search_dirs={"$HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain"}<cr>'
)
map(
  "n",
  "<leader>oz",
  ':Telescope live_grep search_dirs={"$HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain"}<cr>'
)
--
-- search for files in notes (ignore zettelkasten)
-- vim.map("n", "<leader>ois", ":Telescope find_files search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
-- vim.map("n", "<leader>oiz", ":Telescope live_grep search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
--
-- for review workflow
-- move file in current buffer to zettelkasten folder
map(
  "n",
  "<leader>ok",
  ":!mv '%:p' $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain/zettelkasten<cr>:bd<cr>"
)
-- delete file in current buffer
map("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")
