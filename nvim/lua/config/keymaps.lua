-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "Close" })
keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write" })
keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzz", opts)
keymap.set("n", "N", "Nzz", opts)
keymap.set("n", "*", "*zz", opts)
keymap.set("n", "#", "#zz", opts)
keymap.set("n", "g*", "g*zz", opts)
keymap.set("n", "g#", "g#zz", opts)

-- Move to start/end of line
keymap.set({ "n", "x", "o" }, "H", "^", opts)
keymap.set({ "n", "x", "o" }, "L", "g_", opts)
-- surrounding words
keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Split windows
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

-- paste over visually selected text without copying it
keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- search and replace auto fill
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

-- Obsidian
-- navigate to vault
--/Users/fenagel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain
keymap.set("n", "<leader>oo", ":cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain<cr>")
--
-- convert note to template and remove leading white space
keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
--
-- search for files in full vault
keymap.set(
  "n",
  "<leader>os",
  ':Telescope find_files search_dirs={"$HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain"}<cr>'
)
keymap.set(
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
keymap.set(
  "n",
  "<leader>ok",
  ":!mv '%:p' $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain/zettelkasten<cr>:bd<cr>"
)
-- delete file in current buffer
keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")
