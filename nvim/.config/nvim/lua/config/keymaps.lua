-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

return {
	-- Easy select all of file
	vim.keymap.set("n", "<Leader>sa", "ggVG<c-$>"),

	-- use jk to exit insert mode
	vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }),

	-- clear search highlights
	vim.keymap.set("n", "<C-n>", ":nohl<CR>", { desc = "Clear search highlights" }),

	-- center after scrolling
	vim.keymap.set("n", "<C-d>", "<C-d>zz"),
	vim.keymap.set("n", "<C-u>", "<C-u>zz"),
	-- vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
	-- vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")

	-- move lines up and down
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv"),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv"),

	vim.keymap.set("v", "<", "<gv"),
	vim.keymap.set("v", ">", ">gv"),

	-- delete single character without copying into register
	-- vim.keymap.set("n", "x", '"_x')

	-- increment/decrement numbers
	vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }), -- increment
	vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }), -- decrement

	-- window management
	-- vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
	-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

	-- GO Keyvim.keymap.sets
	-- GO error boiler plate macro
	vim.keymap.set("n", "<leader>ge", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]]),
	vim.keymap.set("n", "<leader>gs", "<cmd>GoFillStruct<CR>"),
	vim.keymap.set("n", "<leader>gw", "<cmd>GoFillSwitch<CR>"),
}
