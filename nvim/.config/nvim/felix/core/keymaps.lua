-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
---------------------
-- General Keymaps -------------------

-- Netrw
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- use leader w and q for save and exit
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit file" })

-- Easy select all of file
keymap("n", "<Leader>sa", "ggVG<c-$>")

-- use jk to exit insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- center after scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
-- keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- move lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- window management
keymap("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap({ "n", "o", "x" }, "<S-h>", "^", opts)
keymap({ "n", "o", "x" }, "<S-l>", "g_", opts)
-- GO Keymaps
-- GO error boiler plate macro
keymap("n", "<leader>ge", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])
keymap("n", "<leader>gs", "<cmd>GoFillStruct<CR>")
keymap("n", "<leader>gw", "<cmd>GoFillSwitch<CR>")
