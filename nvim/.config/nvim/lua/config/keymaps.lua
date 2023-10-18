local mapkey = require("util.keymapper").mapkey
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use leader w and q for save and exit
mapkey("<leader>w", "w", "n")
mapkey("<leader>q", "q", "n")

-- Easy select all of file
keymap.set("n", "<Leader>sa", "ggVG<c-$>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
mapkey("<C-n>", ":nohl", "n")

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
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
mapkey("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimise

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

-- Directory Navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
