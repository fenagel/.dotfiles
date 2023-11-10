-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- use leader w and q for save and exit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit file" })

-- Easy select all of file
keymap.set("n", "<Leader>sa", "ggVG<c-$>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<C-n>", ":nohl<CR>", { desc = "Clear search highlights" })

-- center after scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")

-- move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<S-h>", "<cmd>bp<cr>", { desc = "Previous" })
keymap.set("n", "<S-l>", "<cmd>bn<cr>", { desc = "Next" })
-- GO Keymaps
-- GO error boiler plate macro
keymap.set("n", "<leader>ge", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])
keymap.set("n", "<leader>gs", "<cmd>GoFillStruct<CR>")
keymap.set("n", "<leader>gw", "<cmd>GoFillSwitch<CR>")
